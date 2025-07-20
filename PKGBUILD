# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
pkgbase=nwjs-bin
pkgname=(nwjs{,-sdk}-bin)
pkgver=0.101.2
pkgrel=2
pkgdesc='Runtime based on Chromium and node.js'
arch=("x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=(gtk3 nss libxss)
optdepends=(
  "nodejs: npm package support"
  "nw-gyp: native add-on build tool for node-webkit"
)
provides=(nwjs)
conflicts=(nwjs)
source=("https://dl.nwjs.io/v${pkgver}/nwjs-sdk-v${pkgver}-linux-x64.tar.gz")
sha256sums=('8c2b46e3dae39b1339120ed78fb9a376ee3bb205a16fabb663b81a6efd8da878')
prepare(){
  install -d sdk
  cd nwjs-sdk-v${pkgver}-linux-x64
  rm locales/*.info
  mv locales/en-US.pak "$srcdir"/
  mv chromedriver credits.html minidump* nwjc locales "${srcdir}"/sdk
}
package_nwjs-bin() {
  install -Dm644 en-US.pak -t "${pkgdir}"/usr/lib/nwjs/locales
  mv nwjs-sdk-v${pkgver}-linux-x64/* "${pkgdir}"/usr/lib/nwjs/ # breaks --repackage
  install -d "${pkgdir}"/usr/bin
  ln -sf /usr/lib/nwjs/nw "${pkgdir}"/usr/bin/nw
  # aac,h264.  fetch-soname-ffmpeg-chromium.sh
  depends+=(vivaldi-ffmpeg-codecs)
  ln -svf /opt/vivaldi/libffmpeg.so.7.5 "${pkgdir}"/usr/lib/nwjs/lib/libffmpeg.so
}
package_nwjs-sdk-bin() {
  depends+=(nwjs)
  provides=(nwjs-sdk)
  conflicts=(nwjs-sdk)
  install -d "${pkgdir}"/usr/lib
  mv sdk "${pkgdir}"/usr/lib/nwjs
}
