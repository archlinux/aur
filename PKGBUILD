# Maintainer: Hans-Nikola Viessmann <hans AT viess DOT mn>
pkgname=eduvpn-common
pkgver=1.0.0
pkgrel=1
pkgdesc='EduVPN common library for clients'
arch=('x86_64')
url="https://github.com/eduvpn/eduvpn-common"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar".{xz,xz.asc})
sha256sums=('9f26c11b0c8f6bec7443c96b3c177786ab6156313d540a6f3ab97d69aa84ee4e'
            'SKIP')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # use upstream build instructions (to create C shared library)
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "exports/lib/linux/amd64/lib${pkgname/-/_}-$pkgver.so" "$pkgdir"/usr/lib/"lib${pkgname/-/_}-$pkgver.so"
  install -Dm644 "exports/lib/linux/amd64/${pkgname/-/_}.h" "$pkgdir"/usr/include/"${pkgname/-/_}.h"
  install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
