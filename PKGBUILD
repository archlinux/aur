# Maintainer: Please see AUR page for current maintainer and contact information.

pkgname=brave-git
_pkgname=browser-laptop
pkgver=0.13.1.5213
pkgrel=1
pkgdesc="A web browser that stops ads and trackers by default. Master branch."
arch=('x86_64') # Upstream supports x86_64 only
url="https://www.brave.com/"
license=('custom:MPL2' 'BSD' 'Apache' 'custom:others')
groups=('networking')
depends=('gtk2' 'nss' 'alsa-lib' 'gconf' 'libxtst' 'libgnome-keyring' 'libxss' 'ttf-font')
makedepends=('git' 'npm')
optdepends=('cups: To print stuff'
            'pepper-flash: Adobe Flash support')
provides=('brave' 'brave-browser')
conflicts=('brave')
source=("git://github.com/brave/browser-laptop.git" 
        'brave.desktop'
        'brave')
sha384sums=('SKIP'
            'f950675fb4a3f9e48374f8a2667e7a45889206a3062c8182e474143607fc26bd17e852a1ef494607dbd3ff4de325e05f'
            'f35c8ecba3fbda22e72c8935ee2126e14df7bd30830d8a983bbc267cdd7694e2a42ad4c7fed21b78c69f56b95ef4c965')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  # Version tracking is somewhat of a mess.
  # 
  # Upstream has a defined tagging and versioning policy, often. But...
  # Version extraction is fragile and needs work. E.g., final releases have
  # a lower lexicographical value than pre-releases. Not good. Thusly, the 
  # version extracted below never matches a true release even if already tagged.
  #
  # echo $(git describe --tags | sed -e 's/^v//' -e 's/dev//' -e 's/-/./' -e 's/-.\+//')
  #
  # Found out where the version number is kept, finally! Let's hope this works
  # as a long term fix.
  #
  printf %s.%s \
    $(grep version package.json | awk '{print $2}' | sed -e 's/,//' -e 's/"//g')\
    $(git rev-list --count master)
}

build() {
  cd "$srcdir/$_pkgname"

  npm install 
  CHANNEL=dev npm run build-package
}

package() {
  cd "$srcdir/$_pkgname"

  install -d -m0755 "$pkgdir"/usr/lib

  cp -a --reflink=auto Brave-linux-x64 "$pkgdir"/usr/lib/brave

  install -Dm0755 "$srcdir"/brave "$pkgdir"/usr/bin/brave

  install -Dm0755 "$srcdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

  install -Dm0644 res/app.png "$pkgdir"/usr/share/pixmaps/brave.png

  install -Dm0755 LICENSE.txt "$pkgdir"/usr/share/licenses/brave-git/MPL2

  cp -a --reflink=auto "$pkgdir"/usr/lib/brave/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave-git/

  ln -s /usr/lib/PepperFlash "$pkgdir"/usr/lib/pepperflashplugin-nonfree 
}

# vim:set ts=2 sw=2 et:
