# Maintainer: Please see AUR page for current maintainer and contact information.

pkgname=brave-browser-git
_pkgname=browser-laptop
pkgver=0.8.2.15
pkgrel=1
pkgdesc="A web browser that stops ads and trackers by default. Master branch."
arch=('x86_64') # Upstream supports x86_64 only
url="https://www.brave.com/"
license=('custom:MPL2' 'BSD' 'Apache' 'custom:others')
groups=('networking')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'libxtst' 'desktop-file-utils')
makedepends=('git' 'npm' 'xdg-utils' 'python2')
optdepends=('cups:                To print stuff'
            'libgnome-keyring:    fd.o keyring support')
provides=('brave' 'brave-browser')
conflicts=('brave')
install=$pkgname.install
source=("git://github.com/brave/browser-laptop.git" 
        'brave.desktop')
sha384sums=('SKIP'
            '69a0586e32d39c0775848cbfcb2a3cfcad01e5093597861ca195a7945918a60e60869ecce6c0bdbabf134a407edd7d8b')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  # Please note that this version hack works here because this package will track master *always*
  printf %s \
   $(git describe --tags | sed -e 's/^v//' -e 's/dev//' -e 's/-/./' -e 's/-.\+//') # It's fragile, needs work.
}

build() {
  cd "$srcdir/$_pkgname"

  npm install
  CHANNEL=dev npm run build-package
}

package() {
  cd "$srcdir/$_pkgname"

  install -d -m0755 "$pkgdir"/usr/lib

  # Yes, btrfs, Thanks for asking.
  cp -a --reflink=auto Brave-linux-x64 "$pkgdir"/usr/lib/brave-browser

  install -d -m0755 "$pkgdir"/usr/bin

  ln -s /usr/lib/brave-browser/brave "$pkgdir"/usr/bin/brave

  install -dm0755 "$pkgdir"/usr/share/applications

  cp --reflink=auto "$srcdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

  install -Dm0644 res/app.png "$pkgdir"/usr/share/pixmaps/brave.png

  install -d -m0755 "$pkgdir"/usr/share/licenses/brave-browser

  cp --reflink=auto LICENSE.txt "$pkgdir"/usr/share/licenses/brave-browser/MPL2

  mv "$pkgdir"/usr/lib/brave-browser/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave-browser
}

# vim:set ts=2 sw=2 et:
