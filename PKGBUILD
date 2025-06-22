# Contributor: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firefox-extension-localcdn
pkgver=2.6.80
_commit=e4bb7a69ae83dfd40f3a9106ef5d4846fa7491a7
pkgrel=1
pkgdesc='LocalCDN addon for Firefox'
arch=(any)
url=https://www.localcdn.org/
license=(MPL-2.0)
groups=(firefox-addons)
makedepends=(git zip strip-nondeterminism)
provides=('librewolf-extension-localcdn')
conflicts=('librewolf-extension-localcdn')
source=("git+https://codeberg.org/nobody/LocalCDN.git#commit=$_commit?signed")
b2sums=('d7c4626ac472a94a8ff13b2e5e7b86b32564df6310079f92cb430cf35bd37bab11897f3a08bda20bae77a8d72bcbcdf6ee6f0743a8c92323b28a0002cbe17c70')
validpgpkeys=(3F59043BE267E1B1177688AC8F6DE3D614FCFD7A) # nobody <nfo@localcdn.org>

pkgver() {
  cd LocalCDN
  git describe --tags | sed 's/^v//'
}

package() {
  cd LocalCDN
  # Prevent release notes from being opened during update/installation
  # sed -i '/main\._showReleaseNotes/d' core/main.js

  install -d "$pkgdir"/usr/lib/firefox/browser/extensions
  zip -r \
    "$pkgdir/usr/lib/firefox/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi" \
    * -x '.git*' 'audit/*'
  /usr/bin/vendor_perl/strip-nondeterminism -t zip "$pkgdir"/usr/lib/firefox/browser/extensions/*.xpi

  # create symlink for librewolf
  install -d "$pkgdir/usr/lib/librewolf/browser/extensions/"
  ln -sf "/usr/lib/firefox/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi" "$pkgdir/usr/lib/librewolf/browser/extensions/"
}
