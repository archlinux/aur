# Maintainer: Markus Pesch <markus.pesch plus apps at cryptic.systems>

pkgname=prometheus-x509-certificate-exporter
_pkgname=x509-certificate-exporter
pkgver=3.6.0
pkgrel=1
pkgdesc="metric exporter for x509 certificates"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/enix/$_pkgname"
license=('MIT')
makedepends=('go')
source=(
  "$url/archive/refs/tags/v$pkgver.zip"
  'prometheus-x509-certificate-exporter'
  'systemd.service'
  'sysusers.conf'
)
sha512sums=('7d8d4e091d37f3cd0bdff42ed62797d8a2d5749ad8b0d01acbb8edc15571d79daf7d08c0d4a7aeb85416fdbd396d98a89b6ddc0bc0fb92f394e6ef21e35eb06b'
            '681a744d7a7d7825d857b5d14ea19fefe0302de2d98fa76a2442335ecc7cf4cf2dfd03aa8fe9b3356544ef29b0823279a3810c78eabbf8be6c88a0a71f509967'
            '5fb623fd40983b1ae9de5a2fe05fe70ece36c8ce6ca80f58dbfdaa160afbaba99efd125f5a6b90e6f0e2d4f3545f1d68a66c67feaac58972bd8d1572cc5c08c7'
            '02585897ce834c1f23aa0d0eda61e60d003ae3bf16ff9ec819d029602d5d78c260f8ba3b9e9a6e28c1ebe84e6d7e9aaf3c757db5d8656b9f0bdd9caab6d9f36d')
b2sums=('fbc8ed61f07fa7c44138ce303f5f73d4ff32e6a71e47e7cae0b7f7d97e9fd02635fd80d59a1d67b5a5de2eefa83693431797c6b519b60cccf87bceb83f7ab751'
        '3d6adfad59d88ff99b1e4f924651746e62e562fefa0360f02fe1091e920b0bb74e4f54930ff1f863b9004a490e90c78dc92d16ca234b5b536315b7fd45cbf4e4'
        'd94c2a9a9a895be60e3d4d0db08ceb163b27fe12c96c7f1d51497627a4ce4e9d03a0fa434b2aacb232e3dc279d7158238b43ea48c85fe4d82cffd00992c89c66'
        '6e4ed3697654dbc6cdef10f92dfe324459158769f2287ffd167172f9a5f2fbb3ebaa2e79c5da8ff88950ab9ad0f301d5c348c5d8e872d2efc56530ee1547918e')

build() {
  cd "$_pkgname-$pkgver/cmd/$_pkgname"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -o $pkgname .
}

package() {
  # systemd integration
  install -D --mode 0644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -D --mode 0644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # binary
  install -D --mode 0755 --target-directory "$pkgdir/usr/bin" "$_pkgname-$pkgver/cmd/$_pkgname/$pkgname"

  # extra args
  # NOTE: Set restrict file permissions by default to protect optional basic auth credentials
  install -D --mode 0600 --target-directory "$pkgdir/etc/conf.d" prometheus-x509-certificate-exporter

  # license
  install -D --mode 0755 --target-directory "$pkgdir/usr/share/licenses/$pkgname" "$_pkgname-$pkgver/LICENSE"
}
