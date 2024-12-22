# Maintainer: Claudia Pellegrino <clau@tiqua.de>

pkgname=funiculi-git
_gitpkgname=funiculi
pkgver=0.2.0.r56.f2ea19d
pkgrel=2
pkgdesc='Control your Denon AVR amplifier from the command line'
arch=('any')
url='https://github.com/claui/funiculi'
license=('Apache-2.0')
depends=(
  'nmap'
  'pulseaudio-dlna-cygn'
  'python'
  'python-colorama'
  'python-fire'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-myst-parser'
  'python-poetry'
  'python-sphinx'
  'python-wheel'
)
provides=('funiculi')
conflicts=('funiculi')
options=('!debug' '!strip')

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
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating man page'
  sphinx-build -aqEW -b man doc/sphinx build/man
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

  echo >&2 'Packaging the man page'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man1" \
    build/man/*.1
}
