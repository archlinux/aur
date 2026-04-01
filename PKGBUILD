# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>

pkgname=vmlinux-to-elf-git
_pkgname=vmlinux-to-elf
pkgver=r326.f9e1b8b
pkgrel=1
pkgdesc="This tool allows to obtain a fully analyzable .ELF file from a vmlinux/vmlinuz/bzImage/zImage kernel image, with recovered function and variable symbols."
arch=('x86_64')
url="https://github.com/marin-m/${_pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'python>=3.9'
  'python-lz4>=4.4.5'
  'python-minilzo>=1.2'
  'python-peewee>=3.17'
  'python-zstandard>=0.25.0'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=69'
  'python-setuptools-scm>=8'
)
optdepends=(
  # 'glib2: GUI'
  # 'gtk4: GUI'
  'python-gobject: GUI'
  'libadwaita: GUI'
)
provides=(
  "python-${_pkgname}=${pkgver}"
)
conflicts=(
  "python-${_pkgname}"
)
options=(
  '!strip'
)
source=("${_pkgname}::git+https://github.com/marin-m/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}" || exit 1
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${_pkgname}" || exit 1
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${_pkgname//-/_}/ui/assets"
  install -vDm644 "re.fossplant.vmlinux-to-elf.desktop" \
    "${pkgdir}/usr/share/applications/re.fossplant.vmlinux-to-elf.desktop"
  install -vDm644 "re.fossplant.vmlinux-to-elf.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/re.fossplant.vmlinux-to-elf.metainfo.xml"
  install -vDm644 "re.fossplant.vmlinux-to-elf.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/re.fossplant.vmlinux-to-elf.svg"

  install -vd "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -vsf "${site_packages}/${_pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
