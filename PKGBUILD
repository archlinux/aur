# Contributor: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firefox-extension-localcdn
pkgver=2.6.87
_commit=fdc3800de603a7d218ca71f375d56938e5214e53
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
b2sums=('127902a7dd142c71293b48383ad47e260d7c9e39574dbb937cd4d11023ef39075beccb586058eb1d795db3d95fb037ad1fe86c1723788efe52fb3e6a2e37a06b')
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
