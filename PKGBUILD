# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

_pkgname=hadolint
pkgname=hadolint-git
pkgver=2.12.1.beta.r4.ge12f4fa
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash'
url='https://github.com/hadolint/hadolint'
license=('GPL')
source=('git+https://github.com/hadolint/hadolint.git'
        'stack.yaml')
sha256sums=('SKIP'
            'b48e1b7264197c61e79cbd0225cc2ddb924afd62f6444745e33da834e9e7ff5d')
arch=('any')
makedepends=('git' 'stack')
provides=('hadolint')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  [ ${PIPESTATUS[0]} -eq 0 ] || \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # NOTE: the official build of hadolint switched from stack to cabal.
  # However, it requires ghc>=9.2.x, while the version of ghc
  # currently available on Arch is 9.0.2.
  # For this reason, the package keeps using stack for now.
  cp "${srcdir}/stack.yaml" .

  # Build
  stack build hadolint --flag hadolint:-static

  # Install the program.
  install -Dm755 .stack-work/install/*/*/*/bin/hadolint "${pkgdir}/usr/bin/hadolint"
}

# vim: ft=sh ts=2 sw=2 et

