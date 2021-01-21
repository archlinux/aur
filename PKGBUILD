# Maintainer: Sebastiaan Tammer <sebastiaantammer at gmail dot com>
# Contributor: stocki <mail at firstname lastname dot de>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: zfo <zfoofz1@gmail.com>

pkgname=gcsfuse
pkgver=0.33.0
pkgrel=1
pkgdesc="A user-space file system for interacting with Google Cloud Storage"
url="https://github.com/GoogleCloudPlatform/gcsfuse"
arch=('x86_64')
license=('APACHE')
depends=('glibc' 'fuse')
makedepends=('git' 'go')
optdepends=('google-cloud-sdk: authentication helper')
source=("$pkgname-$pkgver::https://github.com/GoogleCloudPlatform/gcsfuse/archive/v$pkgver.tar.gz")
sha256sums=('ffac505cb4c9233f40d3cd0592d3c34157613fb4cc319afdc03181471be61f49')
_gourl=github.com/googlecloudplatform/gcsfuse

prepare() {
  export GOPATH="$srcdir/go"  
  mkdir -p "$GOPATH/src/$(dirname $_gourl)"
  ln -sf "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_gourl"
}

build() {
  export GOPATH="$srcdir/go"  
  go build "$_gourl"
  CGO_ENABLED=1 go build -buildmode=pie -o "mount.gcsfuse" "$_gourl/tools/mount_gcsfuse"
}

package() {
  install -Dm 755 gcsfuse "${pkgdir}/usr/bin/gcsfuse"
  install -Dm 755 mount.gcsfuse "${pkgdir}/usr/bin/mount.gcsfuse"
  cd "${pkgdir}/usr/bin" && ln -s mount.gcsfuse mount.fuse.gcsfuse
}

