# Maintainer: Christoph Robbert <chrobbert@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: jrutila
# Contributor: grimi <grimi@poczta.fm>
# Contributor: jht <stefano@inventati.org>

pkgname=wxglade
pkgver=0.7.1
pkgrel=1
pkgdesc='GUI designer for wxWidgets that can generate Python, C++, Perl, Lisp and XRC code'
arch=('any')
license=('MIT')
url='http://wxglade.sourceforge.net/'
depends=('wxpython' 'desktop-file-utils')
makedepends=('python2' 'gendesk' 'imagemagick')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/sourceforge/wxglade/wxGlade-$pkgver.tar.gz"
        'wxglade.sh' )
sha256sums=('07fa3d1f09fa54af4a6a0d8ec7f60bd27b1f873b9289ae5ffb797e8e90e3a8b5'
            '4549c2034453475f06265fa1c845db3b4c006ab9b17d0386aecd2a276577a6e0' )

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec 'wxglade %F' \
    --name 'wxGlade' --mimetypes 'application/x-wxg'
  convert "wxGlade-$pkgver/icons/icon.xpm" "$pkgname.png"
}

package() {
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/wxGlade"

  install -Dm644 "wxGlade-$pkgver/docs/man/$pkgname.1" \
    "$pkgdir/usr/share/man/man1/$pkgname.1"
  rm -rf "wxGlade-$pkgver/docs/man"
  mv "wxGlade-$pkgver/docs/"* "$pkgdir/usr/share/doc/wxGlade/"
  cp -R "wxGlade-$pkgver/" "$pkgdir/usr/share/wxGlade/"

  python2 -m compileall "$pkgdir/usr/share/wxGlade/"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "wxGlade-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 "$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
