# Maintainer: stocki <mail at firstname lastname dot de>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: zfo <zfoofz1@gmail.com>
pkgname=gcsfuse
pkgver=0.29.0
pkgrel=3
pkgdesc="A user-space file system for interacting with Google Cloud Storage"
url="https://github.com/GoogleCloudPlatform/gcsfuse"
arch=('x86_64')
license=('APACHE')
depends=('glibc')
makedepends=('git' 'go-pie')
optdepends=('google-cloud-sdk: authentication helper')
source=("$pkgname-$pkgver::https://github.com/GoogleCloudPlatform/gcsfuse/archive/v$pkgver.tar.gz")
sha256sums=('4f994d694a12691b7ea5bd293c50ba4a37bc329cf531780015daf0a5fd265b30')
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
  install -Dm755 gcsfuse "${pkgdir}/usr/bin/gcsfuse"
  install -Dm755 mount.gcsfuse "${pkgdir}/usr/bin/mount.gcsfuse"
  cd "${pkgdir}/usr/bin" && ln -s mount.gcsfuse mount.fuse.gcsfuse
}
