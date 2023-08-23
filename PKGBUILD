# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=fping-exporter
pkgver=0.1+17+g7aa628e
pkgrel=1
pkgdesc='prometheus exporter to measure network latency '
arch=(x86_64)
url='https://github.com/schweikert/fping-exporter'
license=(APACHE)
depends=(fping)
makedepends=(go git systemd)
_commit=7aa628e5d19e616702815fc6730079373304b4aa
source=(
  git+$url#commit=$_commit
  fping-exporter.config
  fping-exporter.service
)
sha256sums=('SKIP'
            '5ff4dc052e0f695aa3354e267d717390d6d7ef83bc6e86fd2527187723df804b'
            '07980e147ec360814b9ab2aff3f4535e0382622205688099ea36f12f5761490c')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//;s/-/+/g'
}


build() {
  cd ${pkgname}
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  go build -ldflags "-X main.buildCommit=`git rev-parse --short HEAD` \
	              -X main.buildDate=`date +%Y-%m-%d` \
	              -X main.buildVersion=${pkgver}"
}

package() {
  cd $pkgname
  install -Dm 0755 fping-exporter "$pkgdir/usr/bin/fping-exporter"
  install -Dm 0644 "${srcdir}/fping-exporter.service" "$pkgdir/usr/lib/systemd/system/fping-exporter.service"
  install -Dm 0644 "${srcdir}/fping-exporter.config" "$pkgdir/etc/default/fping-exporter"
}
