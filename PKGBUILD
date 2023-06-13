# Maintainer: Markus Pesch <markus.pesch plus apps at cryptic.systems>

pkgname=prometheus-x509-certificate-exporter
_pkgname=x509-certificate-exporter
pkgver=3.6.0
pkgrel=2
pkgdesc="metric exporter for x509 certificates"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/enix/$_pkgname"
license=('MIT')
makedepends=('go')
source=(
  "$url/archive/refs/tags/v$pkgver.zip"
  'prometheus-x509-certificate-exporter'
  'systemd.service'
)
sha512sums=('7d8d4e091d37f3cd0bdff42ed62797d8a2d5749ad8b0d01acbb8edc15571d79daf7d08c0d4a7aeb85416fdbd396d98a89b6ddc0bc0fb92f394e6ef21e35eb06b'
            '2fd59748f9cb4018456befcc07bb1e4a68cbe5d5bf30faa74e4bc607c241623ee66d6ea7765a5bcd707dfa2a1eb674b7e2e766e27fc0c462c0db1b5ec6aa13ac'
            'f0e6848cb2ae0e103754cca3eb6fd0e259b5e26b219275abb0041b6458f55425ea794da2f25b9e5bf2a24ca953864379d6d174e26c86c3a9da4c11785a9f6ec7')
b2sums=('fbc8ed61f07fa7c44138ce303f5f73d4ff32e6a71e47e7cae0b7f7d97e9fd02635fd80d59a1d67b5a5de2eefa83693431797c6b519b60cccf87bceb83f7ab751'
        '41d9f7daeeedddc11056ac3b8e741afbab80c5779ce3823aa2d88f179e779c0715ccf8c471d645ef74df87f0f7c33cbec92a0ecdae148bd80f83670b6446038c'
        '6a8ed26fcd1390e91801cd1978e28b1aee88327784f8c07d02b95193e66ea62e2be009cb1047b8afafbc5183e99a90b43cb0c2239e61091872dae0ce6bef041a')

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

  # binary
  install -D --mode 0755 --target-directory "$pkgdir/usr/bin" "$_pkgname-$pkgver/cmd/$_pkgname/$pkgname"

  # extra args
  # NOTE: Set restrict file permissions by default to protect optional basic auth credentials
  install -D --mode 0600 --target-directory "$pkgdir/etc/conf.d" prometheus-x509-certificate-exporter

  # license
  install -D --mode 0755 --target-directory "$pkgdir/usr/share/licenses/$pkgname" "$_pkgname-$pkgver/LICENSE"
}
