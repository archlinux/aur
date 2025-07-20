# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
pkgbase=nwjs-bin
pkgname=(nwjs{,-sdk}-bin)
pkgver=0.101.2
pkgrel=3
pkgdesc='Runtime based on Chromium and node.js'
arch=("x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=(alsa-lib at-spi2-core cairo dbus expat gcc-libs glibc glib2 gtk3 libcups
 libxdamage libx11 libxkbcommon libxext libxrandr libxcomposite libxcb libxfixes
 mesa nspr nss pango libxss systemd-libs)
optdepends=(
  "nodejs: npm package support"
  "nw-gyp: native add-on build tool for node-webkit"
)
provides=(nwjs)
conflicts=(nwjs)
source=("https://dl.nwjs.io/v${pkgver}/nwjs-sdk-v${pkgver}-linux-x64.tar.gz")
sha256sums=('8c2b46e3dae39b1339120ed78fb9a376ee3bb205a16fabb663b81a6efd8da878')
checkdepends=(jq grep curl)
check(){
  _chromium=$(curl -s https://nwjs.io/versions.json | jq -r ".versions[] | select(.version==\"v${pkgver}\") | .components.chromium")
  echo ffmpeg soname of Chromium $_chromium is
  _commit=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${_chromium}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
  for _h in libav{codec,format}/version_major.h libavutil/version.h; do
    curl -sL https://chromium.googlesource.com/chromium/third_party/ffmpeg/+/${_commit}/${_h}?format=TEXT|base64 -d|grep -E 'VERSION_MAJOR +[0-9]'
  done
}
prepare(){
  install -d sdk
  chmod -R 755 nwjs-sdk-v${pkgver}-linux-x64
  cd nwjs-sdk-v${pkgver}-linux-x64
  rm locales/*.info
  mv locales/en-US.pak "$srcdir"/
  mv chromedriver credits.html minidump* nwjc locales "${srcdir}"/sdk
}
package_nwjs-bin() {
  install -Dm644 en-US.pak -t nwjs-sdk-v${pkgver}-linux-x64/locales
  install -d "${pkgdir}"/usr/{bin,lib}
  mv nwjs-sdk-v${pkgver}-linux-x64 "${pkgdir}"/usr/lib/nwjs # breaks --repackage
  ln -sf /usr/lib/nwjs/nw "${pkgdir}"/usr/bin/nw
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
