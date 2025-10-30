# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: rafaqzsu <rafaqzsu [at] gmail (dot) com>

pkgname=cropgui-git
_gitpkgname=cropgui
pkgver=0.9+r1.g7eb3941
pkgrel=1
epoch=1
pkgdesc='GTK GUI for lossless JPEG cropping and rotating'
arch=('any')
url='https://emergent.unpythonic.net/01248401946'
license=('GPL-2.0-or-later')
depends=(
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'imagemagick'
  'libjpeg-turbo'
  'perl-image-exiftool'
  'python'
  'python-gobject'
  'python-pillow'
  'python-qualify'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-j2cli'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'at-spi2-core'
  'xorg-server-xvfb'
)
provides=("cropgui=${pkgver%+r*}")
conflicts=('cropgui')

source=(
  "${_gitpkgname}::git+https://github.com/jepler/cropgui.git"
  '__init__.py.template'
  '__main__.py'
  'pyproject.toml.template'
)

sha512sums=(
  'SKIP'
  '6602cead033696ce152e10a327269cfe2da70dc2991aac0687363f011a81f8025dad8a27440cb355dc653d711e5ae4f48b40d7175ef2be783a95b21961f53e38'
  'f7c154e25e61080df56bd73ed5e62d87e071853c64ec94806aae0bf4ab0d97a6c69e055daf5c8db17567106f076bf1dabb7776005fea78ca0560491e9ab48eb9'
  '89565f1ac14cdf5e63d1e58f9f4ad4c0139d0f659cdd56ebbf1535f9a72fe6b294a686bc94eaf838737217439bbf4a44aa3ad03f7be9fb777ecfc6fbca575d66'
)

pkgver() {
  local _tag _tag_rev

  cd "${_gitpkgname}"
  _tag_rev="$(git rev-list -n 1 --tags='v[0-9]*')"
  _tag="$(git describe --tags "${_tag_rev}")"
  printf "%s+r%s.g%s" \
    "${_tag#v}" \
    "$(git -C "${_gitpkgname}" rev-list --count "^${_tag}" HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

prepare() {
  local _pep440_conforming_version
  _pep440_conforming_version="$(
    #shellcheck disable=SC2001  # legitimate case for sed
    sed -e 's/\([^+]*\)+r\([^g]*\)\.g\(.*\)/\1.post\2+git.\3/' <<< "${pkgver}"
  )"

  cd "${_gitpkgname}"

  echo >&2 'Preparing setuptools'
  j2 -f env -o 'pyproject.toml' '../pyproject.toml.template' - \
    <<< "version=${_pep440_conforming_version}"

  echo >&2 'Preparing Python namespace compatibility fix'
  mkdir -v cropgui
  j2 -f env -o 'cropgui/__init__.py' '../__init__.py.template' - \
    <<< "version=${_pep440_conforming_version}"

  echo >&2 'Preparing Python package'
  mv -v ../__main__.py cropgtk.py cropgui_common.py filechooser.py \
    cropgui.glade stock-rotate-90-16.png stock-rotate-270-16.png \
    cropgui/
}

build() {
  cd "${_gitpkgname}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "$(mktemp -d)"

  echo >&2 'Installing wheel into a temporary environment'
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer \
    "${srcdir}/${_gitpkgname}/dist"/*.whl

  echo >&2 'Testing the executable'
  dbus-run-session xvfb-run -s '-nolisten local' \
    test-env/bin/cropgui -h > actual.txt
  if ! grep -qF 'Losslessly crop images' actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${_gitpkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_gitpkgname}.desktop"

  echo >&2 'Packaging app icon'
  install -D -m 644 -T \
    "${_gitpkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${_gitpkgname}.png"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    COPYING
}
