# Maintainer: xiota / aur.chaotic.cx

if [ x"$SRCDEST" == "x" ] ; then
  : ${YARN_CACHE_FOLDER:=$startdir/yarn}
else
  : ${YARN_CACHE_FOLDER:=$SRCDEST/yarn}
fi

_pkgname="vdhcoapp"
pkgname="$_pkgname-git"
pkgver=1.6.3.r57.ge86fb9a
pkgrel=1
pkgdesc="Companion application for Video DownloadHelper browser add-on"
arch=('x86_64')
url="https://github.com/aclap-dev/vdhcoapp"
license=('GPL2')
depends=()
makedepends=(
  'git'
  'gulp'
  'nodejs'
  'npm'
  'yq'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=("$_pkgname")
  conflicts=("$_pkgname")
fi

options=(!strip)

_commit='e86fb9abbf93016d87514692a1676ad7f4518dd8'
source=(
  "$_pkgname"::"git+$url#commit=$_commit"

  "vdhcoapp-fix-paths.patch"
  "vdhcoapp-fix-esm.patch"
)
sha256sums=(
  'SKIP'

  '2ac3273ac5f1250e06ee4a4df14c63c7e60dc36a6122f6047800275dc830072e'
  '6b81e5adcfc2745251a5125396a4a774134579e2c2d7989cc9870d148a0998ab'
  )

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  npm install

  gulp
}

package() {
  depends+=('ffmpeg')

  cd "$srcdir/$_pkgname"

  install -Dm755 bin/net.downloadhelper.coapp-* "$pkgdir/usr/bin/vdhcoapp"
  install -Dm644 config.json "$pkgdir/usr/share/vdhcoapp/config.json"

  install -dm755 "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/opt/chrome/native-messaging-hosts/"
  install -dm755 "$pkgdir/etc/chromium/native-messaging-hosts/"
}
