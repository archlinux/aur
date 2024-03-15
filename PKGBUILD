# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Sebastiaan Tammer <sebastiaantammer at gmail dot com>
# Contributor: stocki <mail at firstname lastname dot de>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: zfo <zfoofz1@gmail.com>

pkgname=gcsfuse
pkgver=2.0.0
pkgrel=1
pkgdesc="A user-space file system for interacting with Google Cloud Storage"
url="https://github.com/GoogleCloudPlatform/gcsfuse"
arch=('x86_64')
license=('APACHE')
depends=('glibc' 'fuse')
makedepends=('git' 'go')
optdepends=('google-cloud-sdk: authentication helper')
source=("$pkgname-$pkgver::https://github.com/GoogleCloudPlatform/gcsfuse/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('310f76100c4a5fe9234cbdf4e6885aea7157b91c5953bfc0cb836ecbd63f0840')
_gourl=github.com/googlecloudplatform/gcsfuse

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" 
  go build "$_gourl"
  CGO_ENABLED=1 go build -buildmode=pie -o "mount.gcsfuse" "$_gourl/tools/mount_gcsfuse"
}

package() {
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/gcsfuse" "${pkgdir}/usr/bin/gcsfuse"
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/mount.gcsfuse" "${pkgdir}/usr/bin/mount.gcsfuse"
  cd "${pkgdir}/usr/bin" && ln -s mount.gcsfuse mount.fuse.gcsfuse
}

