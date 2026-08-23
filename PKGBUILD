# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# shellcheck disable=SC2034,SC2154,SC2164

pkgbase=apparmor.d-git
pkgname=(
  apparmor.d-git
  apparmor.d-base-git
  apparmor.d-tools-git
)
pkgver=v0.4910.0.r155.g95da007
pkgrel=2
pkgdesc="Full set of apparmor profiles"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/roddhjav/apparmor.d"
license=('GPL-2.0-only')
depends=('apparmor>=4.1.3' 'apparmor<5.0.0')
makedepends=('go' 'git' 'just')
conflicts=('apparmor.d')
source=("$pkgname::git+https://github.com/roddhjav/apparmor.d.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgbase"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export DISTRIBUTION=arch
  just prebuild
}

package_apparmor.d-git() {
  depends=('apparmor' 'apparmor.d-base-git' 'apparmor.d-tools-git')
  arch=("any")
  cd "$srcdir/$pkgbase"
  just destdir="$pkgdir" install-profiles
}

package_apparmor.d-base-git() {
  pkgdesc="$pkgdesc (base abstractions, tunables, and booleans)"
  arch=("any")
  cd "$srcdir/$pkgbase"
  just destdir="$pkgdir" install-base
}

package_apparmor.d-tools-git() {
  pkgdesc="$pkgdesc (userland toolings)"
  cd "$srcdir/$pkgbase"
  just destdir="$pkgdir" install-tools
}
