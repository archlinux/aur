# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Sebastiaan Tammer <sebastiaantammer at gmail dot com>
# Contributor: stocki <mail at firstname lastname dot de>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: zfo <zfoofz1@gmail.com>

pkgname=gcsfuse
pkgver=3.5.3
pkgrel=4
pkgdesc="A user-space file system for interacting with Google Cloud Storage"
url="https://github.com/GoogleCloudPlatform/gcsfuse"
arch=('x86_64')
license=('APACHE')
depends=('glibc' 'fuse')
makedepends=('git' 'go')
optdepends=('google-cloud-sdk: authentication helper')
source=("$pkgname-$pkgver::https://github.com/GoogleCloudPlatform/gcsfuse/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0d154c15a88482f70a01483d00e56238aa5cdd2f195553be7efc8bf0761998e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go install ./tools/build_gcsfuse
  $GOPATH/bin/build_gcsfuse . "$srcdir" "$pkgver"
  #go build -o ../bin/gcsfuse
  #go build -o ../sbin/mount.gcsfuse ./tools/mount_gcsfuse

}

package() {
  install -Dm 755 bin/gcsfuse "${pkgdir}/usr/bin/gcsfuse"
  install -Dm 755 sbin/mount.gcsfuse "${pkgdir}/usr/bin/mount.gcsfuse"
  cd "${pkgdir}/usr/bin" && ln -s mount.gcsfuse mount.fuse.gcsfuse
}

