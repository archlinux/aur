# Maintainer: lostmason <lostmason@tutamail.com>
# Contributor: cyprus187 <cyprus187 AT noreply DOT archlinux DOT org>
# Contributor: santost12 <santost12 AT noreply DOT archlinux DOT org>

pkgname=darkmx
pkgver=1.42
pkgrel=2
pkgdesc="Decentralized communication app that utilizes Tor hidden services to allow you to easily have an anonymous, reliable, and censorship-resistant presence on the internet."
arch=('x86_64')
url='https://darkmx.app/'
license=('custom:darkmx')
depends=('gtk3' 'libpng' 'dbus-glib')
makedepends=('patchelf')
optdepends=('gconf: for shell integration')
source=('LICENSE'
        'darkmx-pixbuf-fix.c')
source_x86_64=("https://download.darkmx.app/${pkgname}-${pkgver}-linux64.tar.gz")
sha256sums=('c4adbd46bfdeaf329fa03c578960b157f211a3626c532ae168be9d60514ef0d0'
            'dbf214252dc6b687064dc35c9dd4a9f036a4c38f616007b40bc5f0643657782b')
sha256sums_x86_64=('7608510f48df3289f6d16449ccf2e62b724d6f8058826bcf12c4c62c7efb00ce')

build() {
  gcc -shared -fPIC -o darkmx-pixbuf-fix.so "$srcdir/darkmx-pixbuf-fix.c" \
    $(pkg-config --cflags --libs gdk-pixbuf-2.0 libpng) -ldl
}

package() {
  cd "$srcdir/$pkgname-${pkgver}-linux64"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/darkmx-pixbuf-fix.so" \
    "$pkgdir/usr/lib/$pkgname/darkmx-pixbuf-fix.so"

  patchelf --add-rpath /usr/lib/$pkgname \
    --add-needed darkmx-pixbuf-fix.so \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
