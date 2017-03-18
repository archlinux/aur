# Maintainer: Please see AUR page for current maintainer and contact information.

## Note: Sometime the build will break at the first attemp, if so, try again with
##       "makepkg -e" to finish it.

pkgname=brave-git
pkgver=0.13.5.5787
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
source=("$pkgname::git://github.com/brave/browser-laptop.git" 
        'brave-git.desktop'
        'brave-git.sh')
sha384sums=('SKIP'
            '89c0a58919cba3921d6d519803dda5fe28edaed7318f219ab96f322347a9a39d2f341f33e9b04e361735f66fd42fcda9'
            '4bae9ca3d100502d888679a1902f9a58d1a990c85cbb8aec98e07d42a5bdec35d427d3175a56ac73a03a9da37ff889cf')

pkgver() {
  cd "$srcdir/$pkgname"

  local relver=$( grep version package.json | cut -d ":" -f 2 | sed -e 's/,//' -e 's/"//g' )

  cd "$startdir/$pkgname"

  local numrev=$( git rev-list --count master )

  printf %s.%s $relver $numrev
}

build() {
  cd "$srcdir/$pkgname"

  npm install 
  CHANNEL=dev npm run build-package
}

package() {
  cd "$srcdir/$pkgname"

  install -d -m0755 "$pkgdir"/usr/lib
  cp -a --reflink=auto Brave-linux-x64 "$pkgdir"/usr/lib/"$pkgname"
  install -Dm0755 "$srcdir"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
  install -Dm0755 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm0644 res/app.png "$pkgdir"/usr/share/pixmaps/brave.png
  install -Dm0755 LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/MPL2
  cp -a --reflink=auto "$pkgdir"/usr/lib/"$pkgname"/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/"$pkgname"/
  ln -s /usr/lib/PepperFlash "$pkgdir"/usr/lib/pepperflashplugin-nonfree 
}

# vim:set ts=2 sw=2 et:
