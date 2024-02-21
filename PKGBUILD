# Maintainer: Claudia Pellegrino <clau@tiqua.de>

pkgname=funiculi-git
_gitpkgname=funiculi
pkgver=0.1.3.r7.c5a8945
pkgrel=1
pkgdesc='Control your Denon AVR amplifier from the command line'
arch=('any')
url='https://github.com/claui/funiculi'
license=('Apache-2.0')
depends=(
  'nmap'
  'pulseaudio-dlna'
  'python-colorama'
  'python-fire'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
provides=('funiculi')
conflicts=('funiculi')
options=('!strip')

source=(
  "${_gitpkgname}::git+https://github.com/claui/funiculi.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_gitpkgname}"
  printf "%s.r%s.%s" \
    "$(poetry version -s)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitpkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
