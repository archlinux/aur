# Maintainer: Gianluca Boiano <morf3089@gmail.com>
pkgname=openartifact-bin
pkgver=0.13.1 # renovate: datasource=github-releases depName=openartifact/openartifact extractVersion=^v(?<version>\d.+)$
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
sha256sums_x86_64=('1bfaaa811c892cc4a735ecd3141d81715a246020b88116c0e37ce7084bb5679a'
                   '511e5c93735f298a6131498e334a06d389864ceb8c80d58994bdc0ff2acfed2f')
sha256sums_aarch64=('b0227c9564dd076ce6528d66c97b8c099df072fee53c82a1fb7f0687f94fb9bf'
                    'ef43910f3c6c6871502735cc1f2ea73320156b3bdf9db08e116b8bcb7c15ce13')

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
