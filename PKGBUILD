# Maintainer: Christoph Robbert <chrobbert@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: jrutila
# Contributor: grimi <grimi@poczta.fm>
# Contributor: jht <stefano@inventati.org>

pkgname=wxglade
pkgver=0.9.0
pkgrel=1
pkgdesc='GUI designer for wxWidgets that can generate Python, C++, Perl, Lisp and XRC code'
arch=('any')
license=('MIT')
url='http://wxglade.sourceforge.net/'
depends=('python2' 'wxpython' 'desktop-file-utils')
makedepends=('gendesk' 'imagemagick')
install="$pkgname.install"
source=("https://github.com/wxGlade/wxGlade/archive/v$pkgver.tar.gz"
        'wxglade.sh')
sha256sums=('f4e2ce40e5dbe5d7b659df1f68bf1b8019bea49ddd90653b526a302825366f27'
            '4549c2034453475f06265fa1c845db3b4c006ab9b17d0386aecd2a276577a6e0')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec 'wxglade %F' \
    --name 'wxGlade' --mimetypes 'application/x-wxg'
  convert "wxGlade-$pkgver/icons/icon.xpm" "$pkgname.png"
}

package() {
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/wxGlade"

  # TODO: Update man pages upstream
  #install -Dm644 "wxGlade-$pkgver/docs/man/$pkgname.1" \
  #  "$pkgdir/usr/share/man/man1/$pkgname.1"
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
