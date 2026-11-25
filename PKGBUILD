# Maintainer: gaou-piou <i.am.piou@gmail.com>
#
# xBrowserSync is packaged from upstream's rolling "nightly" GitHub release (the last tagged
# release, 1.5.2, is from 2020). Each nightly build REPLACES the previous assets, so the
# source URLs below stop working once upstream publishes a newer build: run
# ./update-nightly.sh to bump.
#
# Chromium: private key generated with `openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -traditional`.
# Only its public half is used: it goes into manifest.json as "key", so the unpacked
# extension always gets the same id (fakjahadieaofbjbamolhoeliigapkga) and keeps its data.
# xBrowserSync is a Manifest V2 extension: it works in Chromium builds that still load MV2
# (e.g. ungoogled-chromium), but NOT in Google Chrome >= 139, which removed MV2 support.
#
# Firefox family: one copy of the XPI per browser (plain copies: hard links across
# directories break when one of them is on another filesystem); a browser that is not
# installed just gets an unused directory. Where it goes depends on how the browser was built:
#  - Arch/CachyOS Firefox is built with --allow-addon-sideload, so it loads new add-ons
#    from <install dir>/browser/extensions (application scope) directly.
#  - Firefox Nightly (Mozilla binary), LibreWolf and Floorp are not
#    (AppConstants.MOZ_ALLOW_ADDON_SIDELOAD=false): they never pick up a new add-on from
#    browser/extensions. They do install <install dir>/distribution/extensions/*.xpi into
#    the profile at the next start, and on later browser updates replace it with a newer
#    version from there. Once installed it is a normal profile add-on (removing this
#    package does not remove it from the profile).
# The nightly XPI is NOT signed by Mozilla:
#  - Firefox (Arch/CachyOS builds) loads it: they are configured with unsigned add-on
#    scopes app,system (AppConstants.MOZ_UNSIGNED_APP_SCOPE).
#  - Floorp defaults to xpinstall.signatures.required=false.
#  - LibreWolf and Firefox Nightly default it to true: set it to false in about:config,
#    otherwise the copied add-on is rejected as "not correctly signed" and removed.

pkgbase=extension-xbrowsersync-dist
pkgname=('chromium-extension-xbrowsersync-dist'
         'firefox-extension-xbrowsersync-dist')
_extension=xbrowsersync
_tag=1.8.0-beta.262
pkgver=${_tag/-/}
pkgrel=1
pkgdesc='xBrowserSync: free, open-source, anonymous and secure bookmark sync (upstream nightly build)'
arch=('any')
url='https://www.xbrowsersync.org'
license=('GPL-3.0-only')
makedepends=('jq' 'openssl')
_rel='https://github.com/xbrowsersync/app/releases/download/nightly'
source=("$_extension-$pkgver-chromium.zip::$_rel/xbrowsersync_${_tag}_chromium.zip"
        "$_extension-$pkgver.xpi::$_rel/xbrowsersync_${_tag}_firefox.xpi"
        "$_extension.pem")
noextract=("$_extension-$pkgver-chromium.zip"
           "$_extension-$pkgver.xpi")
sha256sums=('704dce19d377a5142f7af71fe9cdf1d656198d30cf8a27d37fec8479cc85541c'
            '12afcaa4b8a89cd969414b4a34346d82ed603baccb876ed1b53370d508b5b528'
            '10b0a0b5575f1c5b3cd94b3cd5420a380857e56bde59edb4d1835bcc8a865998')

_firefox_id='{019b606a-6f61-4d01-af2a-cea528f606da}'
# install directory under /usr/lib : extensions directory inside it
_firefox_browsers=(firefox:browser/extensions
                   librewolf:distribution/extensions
                   floorp:distribution/extensions
                   firefox-nightly:distribution/extensions)

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

package_chromium-extension-xbrowsersync-dist() {
  pkgdesc='xBrowserSync: free, open-source, anonymous and secure bookmark sync (Chromium extension, nightly build, loaded unpacked)'
  optdepends=('chromium: a Chromium build that still supports Manifest V2 extensions')
  provides=('chromium-extension-xbrowsersync')
  conflicts=('chromium-extension-xbrowsersync')
  install="${pkgname}.install"

  install -d "$pkgdir/usr/share/$pkgname"
  # source maps only matter for debugging and are ~60% of the size
  cp -r --no-preserve=ownership "$_extension-$pkgver"/. "$pkgdir/usr/share/$pkgname/"
  find "$pkgdir/usr/share/$pkgname" -name '*.map' -delete
  find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
}

package_firefox-extension-xbrowsersync-dist() {
  pkgdesc='xBrowserSync: free, open-source, anonymous and secure bookmark sync (Firefox/LibreWolf/Floorp extension, nightly build)'
  groups=('firefox-addons')
  optdepends=('firefox: installed for the system Firefox'
              'librewolf: installed for LibreWolf'
              'floorp: installed for Floorp'
              'firefox-nightly: installed for Firefox Nightly (needs unsigned add-ons allowed)')
  provides=('firefox-extension-xbrowsersync' 'librewolf-extension-xbrowsersync' 'floorp-extension-xbrowsersync')
  conflicts=('firefox-extension-xbrowsersync'
             'librewolf-extension-xbrowsersync' 'floorp-extension-xbrowsersync')
  install="${pkgname}.install"

  local b
  for b in "${_firefox_browsers[@]}"; do
    install -Dm644 "$srcdir/$_extension-$pkgver.xpi" \
      "$pkgdir/usr/lib/${b%%:*}/${b#*:}/$_firefox_id.xpi"
  done
}
