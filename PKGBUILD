# Contributor: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firefox-extension-localcdn
pkgver=2.6.75
_commit=0cea53e03e2215edadff357d3b3770157712105d
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
b2sums=('f6fa79f9823523e9a2b5094fba80cd979c231d6bdefaa03c78cc6cd12c4fd42a71540b989d610b19d4c556f71b95182f5779ae3928e8ef79b87330161440aabd')
validpgpkeys=(3F59043BE267E1B1177688AC8F6DE3D614FCFD7A) # nobody <nfo@localcdn.org>

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
