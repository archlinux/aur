# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

_pkgname=hadolint
pkgname=hadolint-git
pkgver=2.12.1.beta.r7.g7c54238
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash'
url='https://github.com/hadolint/hadolint'
license=('GPL')
source=('git+https://github.com/hadolint/hadolint.git'
        'stack.yaml')
sha256sums=('SKIP'
            'b020b3c470ba3f16bc7f513e82409ea9e7b5964f0f385d67c7fb6f44be8b4806')
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

