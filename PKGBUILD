# Contributor: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firefox-extension-localcdn
pkgver=2.6.86
_commit=ade7a974432c8e8bf319d16a657e2957e8b987d2
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
b2sums=('bdb2df1b0beb6a8b0905f0964a20d395c157561aad219a8692dd6dab21d9c6d6ab43229ddfb2bdc1ca906ca22a35f5a42c593c320de068039903959e105d1bc6')
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
