# Maintainer: Please see AUR page for current maintainer and contact information.

pkgname=brave-browser-git
_pkgname=browser-laptop
pkgver=0.7.12dev.46
pkgrel=1
pkgdesc="A chromium-based web browser that stops ads and trackers by Brendan Eich and Co. Development master branch."
arch=('i686' 'x86_64')
url="https://www.brave.com/"
license=('custom')
groups=('networking')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'libxtst' 'desktop-file-utils')
optdepends=('cups: To use your printer.')
makedepends=('git' 'npm')
provides=('brave')
conflicts=('brave')
options=(!strip)
install=$pkgname.install
source=("git://github.com/brave/browser-laptop.git" 'brave-browser.desktop')
md5sums=('SKIP'
         'f4f18f97af634fc60639591a9691ca0e')

pkgver() {
  cd "$srcdir/$_pkgname"

# I'm leaving this here in case there is a need for a more complex version number. Versioning
# policy in a project the size and clout of Brave is not going to change without due warning.
#  printf %s.r%s $(git describe --tags | sed -e 's/^v//' | sed -e 's/-/./' | sed -e 's/-.\+//') \
#    $(git rev-list --count HEAD)

  printf %s $(git describe --tags | sed -e 's/^v//' | sed -e 's/-/./' | sed -e 's/-.\+//')
}

build() {
  cd "$srcdir/$_pkgname"

  #npm install node-gyp@3.2.1  # Upstream asks for node-gyp@3.2.1 but... I cry scaremongering!
                               # Let me know if I'm wrong.
  npm install
  npm run build-package
}

package() {
  cd "$srcdir/$_pkgname"

  case $CARCH in
    'i686') _arch='x86';;
    'x86_64') _arch='x64';;
  esac;

  install -d -m0755 "$pkgdir"/opt

  cp -a --reflink=auto Brave-linux-"$_arch" "$pkgdir"/opt/$pkgname

  install -d -m0755 "${pkgdir}/usr/bin"

  ln -s "/opt/$pkgname/Brave" "${pkgdir}/usr/bin/brave-browser"

  install -D -m0644 "$startdir"/brave-browser.desktop "$pkgdir"/usr/share/applications/brave-browser.desktop

  install -D -m0644 "res/app.png" "$pkgdir"/usr/share/pixmaps/brave-browser.png

  install -d -m0755 "$pkgdir"/usr/share/licenses/$pkgname

  mv "$pkgdir"/opt/$pkgname/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
