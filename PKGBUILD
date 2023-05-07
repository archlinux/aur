# Maintainer: Jakob (XDjackieXD) <aur at chaosfield dot at>
pkgname=rmfakecloud
pkgver=0.0.13.2
pkgrel=1
pkgdesc="host your own cloud for the remarkable"
arch=('x86_64')
url="https://github.com/ddvk/rmfakecloud"
license=('AGPL3')
depends=(
  'nodejs'
)
makedepends=(
  'go'
  'yarn'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ddvk/rmfakecloud/archive/v${pkgver}.tar.gz"
  "rmfakecloud.service"
  "rmfakecloud.conf"
)
sha256sums=('4e58f21624241447629cc6c6fab1acbb97423540f85fa9050ec557f3bdbac097'
            '5f5ba109ab19df8f00bae6300f0f7028a7995f2b54d0505e703dd5f04d83468a'
            'f992a133142f9706e700531fc23ea7eb8ba7f2bfda97626bcccd121e06610a10')
backup=(
  'etc/rmfakecloud.conf'
)

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 dist/rmfakecloud-x64 "${pkgdir}/usr/bin/rmfakecloud"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/rmfakecloud.service" "${pkgdir}/usr/lib/systemd/system/rmfakecloud.service"
  install -Dm644 "${srcdir}/rmfakecloud.conf" "${pkgdir}/etc/rmfakecloud.conf"
}

