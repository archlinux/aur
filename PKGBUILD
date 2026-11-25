# Maintainer: gaou-piou <i.am.piou@gmail.com>
# Private key generated with `openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -traditional`
# Only its public half is used: it goes into manifest.json as "key", so the unpacked
# extension always gets the same id (fakjahadieaofbjbamolhoeliigapkga) and keeps its data.
#
# xBrowserSync is a Manifest V2 extension: it works in Chromium builds that still load MV2
# (e.g. ungoogled-chromium), but NOT in Google Chrome >= 139, which removed MV2 support.
#
# Packaged from upstream's rolling "nightly" GitHub release (the last tagged release, 1.5.2,
# is from 2020). Each nightly build REPLACES the previous assets, so the source URL below
# stops working once upstream publishes a newer build: run ./update-nightly.sh to bump.

pkgname=chromium-extension-xbrowsersync
_extension=xbrowsersync
_tag=1.8.0-beta.261
pkgver=${_tag/-/}
pkgrel=1
pkgdesc='xBrowserSync: free, open-source, anonymous and secure bookmark sync (Chromium extension, nightly build, loaded unpacked)'
arch=('any')
url='https://www.xbrowsersync.org'
license=('GPL-3.0-only')
optdepends=('chromium: a Chromium build that still supports Manifest V2 extensions')
makedepends=('jq' 'openssl')
install=$pkgname.install
source=("$_extension-$pkgver-chromium.zip::https://github.com/xbrowsersync/app/releases/download/nightly/xbrowsersync_${_tag}_chromium.zip"
        "$_extension.pem")
noextract=("$_extension-$pkgver-chromium.zip")
sha256sums=('40474e204ef67a3297382d9bfffc5b9ec0b5f2a8843e76fb346d8b609de8d582'
            '10b0a0b5575f1c5b3cd94b3cd5420a380857e56bde59edb4d1835bcc8a865998')

prepare() {
  rm -rf "$_extension-$pkgver"
  mkdir "$_extension-$pkgver"
  bsdtar -xf "$_extension-$pkgver-chromium.zip" -C "$_extension-$pkgver"

  # ChromiumBookmarkService finds the root bookmark folders by the hard-coded ids
  # "1" (bookmarks bar) and "2" (other bookmarks). Recent Chromium no longer guarantees
  # those ids (e.g. other bookmarks can be "1056"), which fails every sync with
  # ContainerNotFound. Match on BookmarkTreeNode.folderType instead, preferring the local
  # (non-account) node, and keep the old id check for browsers without folderType.
  cd "$_extension-$pkgver/assets"
  local f
  for f in background.js app.js; do
    sed -i -E \
      -e 's/find\(([[:alnum:]_$]+)=>\1\.id===this\.otherBookmarksNodeId\)/find(\1=>\1.folderType?\1.folderType==="other"\&\&!\1.syncing:\1.id===this.otherBookmarksNodeId)/' \
      -e 's/find\(([[:alnum:]_$]+)=>\1\.id===this\.toolbarBookmarksNodeId\)/find(\1=>\1.folderType?\1.folderType==="bookmarks-bar"\&\&!\1.syncing:\1.id===this.toolbarBookmarksNodeId)/' \
      "$f"
    [[ $(grep -o 'folderType?' "$f" | wc -l) == 2 ]] \
      || { error "container-id patch did not apply to $f"; return 1; }
    ! grep -qE '=>[[:alnum:]_$]+\.id===this\.(other|toolbar)BookmarksNodeId' "$f"
  done
}

build() {
  local pubkey
  pubkey="$(openssl rsa -in "$srcdir/$_extension.pem" -pubout -outform DER 2>/dev/null | base64 -w0)"
  echo "extension id: $(printf '%s' "$pubkey" | base64 -d | sha256sum | head -c32 | tr '0-9a-f' 'a-p')"

  cd "$_extension-$pkgver"
  jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
  mv manifest.json.new manifest.json
}

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  # source maps only matter for debugging and are ~60% of the size
  cp -r --no-preserve=ownership "$_extension-$pkgver"/. "$pkgdir/usr/share/$pkgname/"
  find "$pkgdir/usr/share/$pkgname" -name '*.map' -delete
  find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
}
