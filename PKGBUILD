# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Sebastiaan Tammer <sebastiaantammer at gmail dot com>
# Contributor: stocki <mail at firstname lastname dot de>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: zfo <zfoofz1@gmail.com>

pkgname=gcsfuse
pkgver=3.4.4
pkgrel=1
pkgdesc="A user-space file system for interacting with Google Cloud Storage"
url="https://github.com/GoogleCloudPlatform/gcsfuse"
arch=('x86_64')
license=('APACHE')
depends=('glibc' 'fuse')
makedepends=('git' 'go')
optdepends=('google-cloud-sdk: authentication helper')
source=("$pkgname-$pkgver::https://github.com/GoogleCloudPlatform/gcsfuse/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f1c25ba20044394538fa7704511669493465bccf11cd257bb745f7baa531142')
_gourl="github.com/googlecloudplatform/gcsfuse/v${pkgver%.[0-9].[0-9]}"

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

