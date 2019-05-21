# Maintainer: Katherine Cumberbatch <stykers@stykers.moe>

pkgname=brave-git
pkgver=0.24.1.r236.g7e6875794
pkgrel=1
pkgdesc="A web browser that stops ads and trackers by default. Master branch."
arch=('x86_64') # Upstream supports x86_64 only
url="https://www.brave.com/"
license=('custom:MPL2' 'BSD' 'Apache' 'custom:others')
groups=('networking')
depends=('gtk2' 'nss' 'alsa-lib' 'gconf' 'libxtst' 'libgnome-keyring' 'libxss' 'ttf-font')
makedepends=('git' 'npm' 'python2' 'icu' 'glibc')
optdepends=('cups: To print stuff'
            'pepper-flash: Adobe Flash support')
provides=('brave' 'brave-browser')
conflicts=('brave')
source=('brave-browser::git://github.com/brave/brave-browser.git'
        'brave-launcher'
        'brave.desktop')
sha384sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/brave-browser"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/brave-browser"

  npm install home-path buffer-to-vinyl stream-combiner2
  npm install
  CHANNEL=dev npm run init

  if [[ ! (-r /proc/sys/kernel/unprivileged_userns_clone && $(< /proc/sys/kernel/unprivileged_userns_clone) == 1 && -n $(zcat /proc/config.gz | grep CONFIG_USER_NS=y) ) ]]; then
    echo "User namespaces are not detected as enabled on your system, brave will run with the sandbox disabled"
  fi
}

package() {
  cd "$srcdir/brave-browser"

  install -d -m0755 "$pkgdir"/usr/lib
  cp -a --reflink=auto brave-linux-x64 "$pkgdir/usr/lib/brave"

  install -Dm0755 "$srcdir/brave-launcher" "$pkgdir/usr/bin/brave"

  install -Dm0755 "$srcdir/brave.desktop" "$pkgdir/usr/share/applications/brave.desktop"

  install -Dm0644 res/nightly/app.png "$pkgdir"/usr/share/pixmaps/brave.png

  install -Dm0755 LICENSE.txt "$pkgdir"/usr/share/licenses/brave/MPL2

  cp -a --reflink=auto "$pkgdir"/usr/lib/brave/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave/
  ln -s /usr/lib/PepperFlash "$pkgdir"/usr/lib/pepperflashplugin-nonfree
}

# vim:set ts=2 sw=2 et:
