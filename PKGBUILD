# Maintainer: Gianluca Boiano <morf3089@gmail.com>
pkgname=openartifact-bin
pkgver=0.2.0
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
sha256sums_x86_64=('6c618b0a3e279e89ed4d1e19fdaa0d6707edddcb62207b5246f554e1cf8fd126'
                   '07b2ed73c3bc2b6a2d6dde9ab0c8db2c0185f4c7e5dc97675706eecbaa99dde8')
sha256sums_aarch64=('a85124768b994c5a2883bc5667194dbf5a21915d643e50d30bb5a2923d371bee'
                    '7ce447fe7339637e26370bd063ff37c7b955fd8d2d3683a19c733e7cddc2e983')

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
