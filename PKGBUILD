# Maintainer: gaou-piou <i.am.piou@gmail.com>
# Private key generated with `openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -traditional`
# Only its public half is used: it goes into manifest.json as "key", so the unpacked
# extension always gets the same id (fakjahadieaofbjbamolhoeliigapkga) and keeps its data.
#
# xBrowserSync is a Manifest V2 extension: it works in Chromium builds that still load MV2
# (e.g. ungoogled-chromium), but NOT in Google Chrome >= 139, which removed MV2 support.

pkgname=chromium-extension-xbrowsersync
_extension=xbrowsersync
pkgver=1.5.2
pkgrel=2
pkgdesc='xBrowserSync: free, open-source, anonymous and secure bookmark sync (Chromium extension, loaded unpacked)'
arch=('any')
url='https://www.xbrowsersync.org'
license=('GPL-3.0-only')
optdepends=('chromium: a Chromium build that still supports Manifest V2 extensions')
makedepends=('jq' 'openssl')
install=$pkgname.install
source=("$_extension-$pkgver-chrome.zip::https://github.com/xbrowsersync/app/releases/download/v$pkgver/xbrowsersync_${pkgver}_chrome.zip"
        "$_extension.pem")
noextract=("$_extension-$pkgver-chrome.zip")
sha256sums=('b5b50654fbc9eac4f8a40b5e50c9e6aa077ef55bc958b91452753cf41c26ef04'
            '10b0a0b5575f1c5b3cd94b3cd5420a380857e56bde59edb4d1835bcc8a865998')

prepare() {
  rm -rf "$_extension-$pkgver"
  mkdir "$_extension-$pkgver"
  bsdtar -xf "$_extension-$pkgver-chrome.zip" -C "$_extension-$pkgver"

  # 1.5.2 finds the root bookmark folders by the hard-coded ids "1" (bookmarks bar) and
  # "2" (other bookmarks). Recent Chromium no longer guarantees those ids (e.g. other
  # bookmarks can be "1056"), which fails every sync with [10113] LocalContainerNotFound.
  # Match on BookmarkTreeNode.folderType instead, preferring the local (non-account) node,
  # and keep the old id check for browsers without folderType.
  cd "$_extension-$pkgver/js"
  local f n=0
  for f in *.js; do
    grep -q "x\.id === [\"']2[\"'];" "$f" || continue
    sed -i -E \
      -e "s/return x\.id === [\"']2[\"'];/return x.folderType ? x.folderType === 'other' \&\& !x.syncing : x.id === '2';/" \
      -e "s/return x\.id === [\"']1[\"'];/return x.folderType ? x.folderType === 'bookmarks-bar' \&\& !x.syncing : x.id === '1';/" \
      "$f"
    n=$((n + 1))
  done
  # background.min.js + app.min.js are loaded; the rest are unminified copies
  (( n >= 2 )) || { error "container-id patch did not apply"; return 1; }
  ! grep -qE "return x\.id === [\"'][12][\"'];" *.js
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
  cp -r --no-preserve=ownership "$_extension-$pkgver"/. "$pkgdir/usr/share/$pkgname/"
  find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
}
