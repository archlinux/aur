# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jdownloader2-svn
pkgver=r48570
pkgrel=1
pkgdesc="Download manager for one-click hosting sites like Rapidshare and Megaupload"
arch=(x86_64)
url="https://jdownloader.org/"
license=(GPL)
depends=(
  java-runtime
  sh
)
makedepends=(
  ant
  java-environment
  subversion
)
optdepends=('phantomjs: needed for some remote capture solving')
source=(
  "AppWorkUtils::svn://svn.appwork.org/utils"
  "JDBrowser::svn://svn.jdownloader.org/jdownloader/browser"
  "JDownloader::svn://svn.jdownloader.org/jdownloader/trunk"
  "MyJDownloaderClient::svn://svn.jdownloader.org/jdownloader/MyJDownloaderClient"
  "jd-containers.desktop"
  "jdownloader"
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
  '4caf551a092a7c8467b334bb6f6f7c6750aa00b410ec4c857e7d0296405e4fdc'
  '901a874cb14389096ea54505dc9af48e99db310d937fce681417d2e00dd1d24f'
  'e8a07754c7e6c4036f9039d4f6b49513372a65f1d7d1c16cb517a24bef941ea7'
  'c4301592694b3273ed44814debcc03bf1e4fc85882954f5c03e55508c53c4491'
)
options=(!emptydirs)

_archive="JDownloader"

pkgver() {
  cd "$_archive"

  local ver
  ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]/}"
}

build() {
  cd "$_archive"

  cp build/newBuild/build_standalone.xml build.xml
  ant standalone
}

package() {
  cd "$_archive"

  install -Dm644 themes/themes/standard/org/jdownloader/images/logo/jd_logo_256_256.png "$pkgdir/usr/share/pixmaps/jdownloader.png"
  install -Dm644 "$srcdir/jdownloader.desktop" "$pkgdir/usr/share/applications/jdownloader.desktop"
  install -Dm644 "$srcdir/jd-containers.desktop" "$pkgdir/usr/share/applications/jd-containers.desktop"
  install -Dm644 "$srcdir/jdownloader.xml" "$pkgdir/usr/share/mime/packages/jdownloader.xml"

  install -Dm644 "$srcdir/jdownloader.sysusers" "$pkgdir/usr/lib/sysusers.d/jdownloader.conf"
  install -Dm644 "$srcdir/jdownloader.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/jdownloader.conf"

  install -dm755 "$pkgdir/opt/jdownloader/"
  cp --archive --no-preserve=ownership standalone/dist/* "$pkgdir/opt/jdownloader"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" standalone/dist/license.txt
  cp --archive --no-preserve=ownership standalone/dist/licenses/* "$pkgdir/usr/share/licenses/$pkgname"
  rm -r "$pkgdir/opt/jdownloader/tools"

  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/jdownloader"
}
