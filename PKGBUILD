# Maintainer: Please see AUR page for current maintainer and contact information.

pkgname=brave-browser-git
_pkgname=browser-laptop
pkgver=0.8.2.8
pkgrel=1
pkgdesc="A web browser that stops ads and trackers by default. Master branch."
arch=('x86_64') # No 32-bit electron-prebuilt for you! (Upstream doesn't provide one).
url="https://www.brave.com/"
license=('custom:several')
groups=('networking')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'libxtst' 'desktop-file-utils')
makedepends=('git' 'npm' 'xdg-utils' 'python2' )
optdepends=('cups:          To print stuff.')
provides=('brave')
conflicts=('brave')
install=$pkgname.install
source=("git://github.com/brave/browser-laptop.git" 
        'brave.desktop')
sha384sums=('SKIP'
            '69a0586e32d39c0775848cbfcb2a3cfcad01e5093597861ca195a7945918a60e60869ecce6c0bdbabf134a407edd7d8b')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf %s \
   $(git describe --tags | sed -e 's/^v//' -e 's/dev//' -e 's/-/./' -e 's/-.\+//') # It's fragile, needs work.
}

build() {
  cd "$srcdir/$_pkgname"

  npm install node-gyp@3.2.1
  npm install
  CHANNEL=dev npm run build-package
}

package() {
  cd "$srcdir/$_pkgname"

  install -d -m0755 "$pkgdir"/usr/lib

  # Yes, btrfs, Thanks for asking.
  cp -a --reflink=auto Brave-linux-x64 "$pkgdir"/usr/lib/$pkgname

  install -d -m0755 "$pkgdir"/usr/bin

  ln -s /usr/lib/"$pkgname"/brave "$pkgdir"/usr/bin/brave

  install -dm0755 "$pkgdir"/usr/share/applications

  cp --reflink=auto "$srcdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

  install -Dm0644 res/app.png "$pkgdir"/usr/share/pixmaps/brave.png

  install -d -m0755 "$pkgdir"/usr/share/licenses/$pkgname

  cp --reflink=auto LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/MPL2

  mv "$pkgdir"/usr/lib/$pkgname/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
