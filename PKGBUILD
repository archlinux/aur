# Maintainer: gaou-piou <i.am.piou@gmail.com>
#
# Packaged from upstream's rolling "nightly" GitHub release (the last tagged release, 1.5.2,
# is from 2020). Each nightly build REPLACES the previous assets, so the source URL below
# stops working once upstream publishes a newer build: run ./update-nightly.sh to bump.
#
# One copy of the XPI per browser (plain copies: hard links across directories break when
# one of them is on another filesystem); a browser that is not installed just gets an
# unused directory. Where it goes depends on how the browser was built:
#  - Arch/CachyOS Firefox is built with --allow-addon-sideload, so it loads new add-ons
#    from <install dir>/browser/extensions (application scope) directly.
#  - Firefox Nightly (Mozilla binary), LibreWolf and Floorp are not
#    (AppConstants.MOZ_ALLOW_ADDON_SIDELOAD=false): they never pick up a new add-on from
#    browser/extensions. They do install <install dir>/distribution/extensions/*.xpi into
#    the profile at the next start, and on later browser updates replace it with a newer
#    version from there. Once installed it is a normal profile add-on (removing this
#    package does not remove it from the profile).
#
# The nightly XPI is NOT signed by Mozilla:
#  - Firefox (Arch/CachyOS builds) loads it: they are configured with unsigned add-on
#    scopes app,system (AppConstants.MOZ_UNSIGNED_APP_SCOPE).
#  - Floorp defaults to xpinstall.signatures.required=false.
#  - LibreWolf and Firefox Nightly default it to true: set it to false in about:config,
#    otherwise the copied add-on is rejected as "not correctly signed" and removed.

pkgname=firefox-extension-xbrowsersync
_extension=xbrowsersync
_tag=1.8.0-beta.261
pkgver=${_tag/-/}
pkgrel=3
pkgdesc='xBrowserSync: free, open-source, anonymous and secure bookmark sync (Firefox/LibreWolf/Floorp extension, nightly build)'
arch=('any')
url='https://www.xbrowsersync.org'
license=('GPL-3.0-only')
groups=('firefox-addons')
optdepends=('firefox: installed for the system Firefox'
            'librewolf: installed for LibreWolf'
            'floorp: installed for Floorp'
            'firefox-nightly: installed for Firefox Nightly (needs unsigned add-ons allowed)')
provides=("librewolf-extension-$_extension" "floorp-extension-$_extension")
conflicts=("librewolf-extension-$_extension" "floorp-extension-$_extension")
install=$pkgname.install
source=("$_extension-$pkgver.xpi::https://github.com/xbrowsersync/app/releases/download/nightly/xbrowsersync_${_tag}_firefox.xpi")
noextract=("$_extension-$pkgver.xpi")
sha256sums=('f416b19970ae303c9c3727c23ee76e3627bd0a6667f94bc02780b3bdf59027a2')
_extid='{019b606a-6f61-4d01-af2a-cea528f606da}'
# install directory under /usr/lib : extensions directory inside it
_browsers=(firefox:browser/extensions
           librewolf:distribution/extensions
           floorp:distribution/extensions
           firefox-nightly:distribution/extensions)

package() {
  local b
  for b in "${_browsers[@]}"; do
    install -Dm644 "$_extension-$pkgver.xpi" "$pkgdir/usr/lib/${b%%:*}/${b#*:}/$_extid.xpi"
  done
}
