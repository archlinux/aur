# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# shellcheck disable=SC2034,SC2154,SC2164

pkgbase=apparmor.d
pkgname=(
  apparmor.d
  apparmor.d-base
  apparmor.d-tools
)
pkgver=0.4915.0
pkgrel=1
pkgdesc="Full set of apparmor profiles"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/roddhjav/apparmor.d"
license=('GPL-2.0-only')
depends=('apparmor>=4.1.3' 'apparmor<5.0.0')
makedepends=('go' 'git' 'just')
source=("https://github.com/roddhjav/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz"
        "https://github.com/roddhjav/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz.asc")
sha512sums=('6d0577e75a1f237c99295e1509e484dd44940b9f596ee2d42c417b6cb25af1a7c19bbb477361f374353d708e2368c888b362e354e2edc03028724861125f415e'
            'SKIP')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export DISTRIBUTION=arch
  just prebuild
}

package_apparmor.d() {
  depends=('apparmor' 'apparmor.d-base' 'apparmor.d-tools')
  arch=("any")
  cd "$srcdir/$pkgbase-$pkgver"
  just destdir="$pkgdir" install-profiles
}

package_apparmor.d-base() {
  pkgdesc="$pkgdesc (base abstractions, tunables, and booleans)"
  arch=("any")
  cd "$srcdir/$pkgbase-$pkgver"
  just destdir="$pkgdir" install-base
}

package_apparmor.d-tools() {
  pkgdesc="$pkgdesc (userland toolings)"
  cd "$srcdir/$pkgbase-$pkgver"
  just destdir="$pkgdir" install-tools
}
