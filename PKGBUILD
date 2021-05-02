# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

_pkgname=hadolint
pkgname=hadolint-git
pkgver=2.3.0.r2.g4b949a8
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash'
url='https://github.com/hadolint/hadolint'
license=('GPL')
source=('git+https://github.com/hadolint/hadolint.git')
sha256sums=('SKIP')
arch=('any')
makedepends=('git' 'stack')
provides=('hadolint')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -eq 0 ] || \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Build
  stack build hadolint --flag hadolint:-static

  # Install the program.
  install -Dm755 .stack-work/install/*/*/*/bin/hadolint "${pkgdir}/usr/bin/hadolint"
}

# vim: ft=sh ts=2 sw=2 et

