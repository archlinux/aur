# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: coderkun <olli@derkun.de>

_upname=RSSOwl
pkgname="${_upname,,}"
pkgver=2.2.1
pkgrel=5
pkgdesc="A java based RSS feed reader with Google Reader synchronization"
arch=('x86_64')
url='http://rssowl.org/'
license=('EPL')
depends=('java-runtime' 'alsa-lib' 'gtk2' 'gconf' 'hunspell' 'libxt' 'nss')
install=rssowl.install
source=("https://github.com/$pkgname/$_upname/releases/download/$pkgver/$_upname.$pkgver.Linux-x64.zip"
        "$pkgname.desktop")
sha256sums=('ca79aca7f141d30d550f46d47616e5f1d5a816d7496a4cb76dfc7a0c281975d7'
            '197d0f1ffc59f5046dc455f485b7535ae2143315a498338911eafbf3cc62eb42')

build() {
  cd "$pkgname"

  echo -e "#!/bin/sh\n\n/usr/share/$pkgname/$_upname \"\${@}\"" > "$pkgname"
  sed -i -e 's:moz_libdir=.*:moz_libdir=/usr/share/rssowl/xulrunner:' xulrunner/xulrunner
}

package() {
  cd "$srcdir"
  # xulrunner 1.9 (shipped by RSSOwl) expects /lib/libhunspell-1.2.so.0
  if ! [ -e "libhunspell-1.2.so.0" ]; then
    ln -s "/usr/lib/libhunspell.so" "libhunspell-1.2.so.0"
  fi
  install -D "libhunspell-1.2.so.0" "$pkgdir/usr/lib/libhunspell-1.2.so.0"

  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r * "$pkgdir/usr/share/$pkgname"
  chmod +x "$pkgdir/usr/share/$pkgname/xulrunner/xulrunner"
  chmod +x "$pkgdir/usr/share/$pkgname/xulrunner/xulrunner-bin"
  chmod +x "$pkgdir/usr/share/$pkgname/xulrunner/run-mozilla.sh"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
