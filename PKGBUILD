# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=jdownloader2-svn
_pkgname=JDownloader
pkgver=r50760
pkgrel=1
pkgdesc="Download manager for one-click hosting sites like Rapidshare and Megaupload"
arch=(x86_64)
url="https://jdownloader.org/"
license=(GPL-3.0-or-later)
depends=(java-runtime)
makedepends=(
  ant
  java-environment
  subversion
)
provides=(jdownloader2)
conflicts=(jdownloader2)
options=(!emptydirs)
source=(
  "AppWorkUtils::svn://svn.appwork.org/utils"
  "JDBrowser::svn://svn.jdownloader.org/jdownloader/browser"
  "JDownloader::svn://svn.jdownloader.org/jdownloader/trunk"
  "MyJDownloaderClient::svn://svn.jdownloader.org/jdownloader/MyJDownloaderClient"
  "jd-containers.desktop"
  "jdownloader"
  "jdownloader-headless"
  "jdownloader.desktop"
  "jdownloader.sysusers"
  "jdownloader.tmpfiles"
  "jdownloader.xml"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'bd8e68c6d9cff95a6d99a58991a14219e9bbcfa28a841c917e46f5594690e427'
  '87c1e675507e0476bbf30cb624dd9e628f2452b3899c237e39cd8bb64edde733'
  '5d7b893c98c0a194d17b7b3ae9975c3c97cf0622735f8dc479053a6e91f7f2fc'
  '4caf551a092a7c8467b334bb6f6f7c6750aa00b410ec4c857e7d0296405e4fdc'
  '901a874cb14389096ea54505dc9af48e99db310d937fce681417d2e00dd1d24f'
  'e8a07754c7e6c4036f9039d4f6b49513372a65f1d7d1c16cb517a24bef941ea7'
  'c4301592694b3273ed44814debcc03bf1e4fc85882954f5c03e55508c53c4491'
)

pkgver() {
  cd $_pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]/}"
}

build() {
  cd $_pkgname
  cp build/newBuild/build_standalone.xml build.xml
  ant standalone
}

package() {
  cd $_pkgname
  install -vDm644 themes/themes/standard/org/jdownloader/images/logo/jd_logo_256_256.png \
    "$pkgdir/usr/share/pixmaps/jdownloader.png"
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/jdownloader.desktop"
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/jd-containers.desktop"
  install -vDm644 -t "$pkgdir/usr/share/mime/packages" "$srcdir/jdownloader.xml"

  install -vDm644 "$srcdir/jdownloader.sysusers" "$pkgdir/usr/lib/sysusers.d/jdownloader.conf"
  install -vDm644 "$srcdir/jdownloader.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/jdownloader.conf"

  install -vdm755 "$pkgdir/opt/jdownloader"
  cp -av -t "$pkgdir/opt/jdownloader" standalone/dist/*

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" standalone/dist/license.txt
  cp -av -t "$pkgdir/usr/share/licenses/$pkgname" standalone/dist/licenses/*

  # Remove license files from /opt
  rm -vr "$pkgdir/opt/jdownloader/licenses"
  rm -v "$pkgdir/opt/jdownloader/license.txt" "$pkgdir/opt/jdownloader/license_german.txt"

  # Remove bundled ffmpeg
  rm -vr "$pkgdir/opt/jdownloader/tools"

  install -vDm755 -t "$pkgdir/usr/bin" "$srcdir/jdownloader"
  install -vDm755 -t "$pkgdir/usr/bin" "$srcdir/jdownloader-headless"
}
