# Maintainer: Gianluca Boiano <morf3089@gmail.com>
pkgname=openartifact-bin
pkgver=0.9.0 # renovate: datasource=github-releases depName=openartifact/openartifact extractVersion=^v(?<version>\d.+)$
pkgrel=1
pkgdesc="Free-as-in-freedom artifact repository manager (Maven, npm, PyPI, OCI, Helm, ...) - prebuilt binaries"
arch=('x86_64' 'aarch64')
url='https://github.com/openartifact/openartifact'
license=('AGPL-3.0-or-later')
provides=("openartifact=$pkgver" "oa-cli=$pkgver")
conflicts=('openartifact')
backup=('etc/openartifact/openartifact.yaml')
source=("openartifact.service")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/openartifact_${pkgver}_linux_amd64.tar.gz"
               "oa-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/oa_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/openartifact_${pkgver}_linux_arm64.tar.gz"
                "oa-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/oa_${pkgver}_linux_arm64.tar.gz")
noextract=("$pkgname-$pkgver-$CARCH.tar.gz" "oa-$pkgver-$CARCH.tar.gz")
sha256sums=('bc1ec1cb88982f5c3bfc5a86505bcc8b87e6e83541609526b90b298ea2c473cb')
sha256sums_x86_64=('0936ea33cf97f1e15b5ec13967ce36e7afbf8b957ddbac91739ce4f4fac969fc'
                   '1e96934870a49c408cab03df255be2b3b184e541b48aa83b81c8c2664367c1a8')
sha256sums_aarch64=('a380d73ae545b73ef74d081bd783a24e0c9cd6d412a57a29f03c7bc958d413bc'
                    '21f96045da3da17b3411208c258f9669852e19cc5cc20752c7224559d0bc7474')

prepare() {
  mkdir -p server cli
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C server
  bsdtar -xf "oa-$pkgver-$CARCH.tar.gz" -C cli
}

package() {
  install -Dm755 server/openartifact "$pkgdir/usr/bin/openartifact"
  install -Dm755 server/resetpw "$pkgdir/usr/bin/openartifact-resetpw"
  install -Dm755 cli/oa "$pkgdir/usr/bin/oa"
  install -Dm644 server/openartifact.example.yaml "$pkgdir/etc/openartifact/openartifact.yaml"
  install -Dm644 server/.env.example "$pkgdir/usr/share/doc/$pkgname/env.example"
  install -Dm644 server/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 openartifact.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 server/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
