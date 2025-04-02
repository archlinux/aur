# Contributor: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firefox-extension-localcdn
pkgver=2.6.79
_commit=2ef7e4b753fef2262fffba8af1d2d1b591b274ab
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
b2sums=('5c27e5a5065fb622d290bf3f1ce1b584de73552e797dc5f6f242ce2a9c94851ef1165edcb8d4ebdf898025a02d32f32c1971ca57149336805e5d7321d709fc8b')
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
