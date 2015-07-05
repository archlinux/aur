# Maintainer: Yichao Yu <yyc1992@gmail.com>
# Contributor: David Manouchehri <david@davidmanouchehri.com>

pkgname=eagle
pkgver=7.3.0
pkgrel=1
pkgdesc="A powerful suite for schematic capture and printed circuit board design (aka eaglecad)"
arch=('i686' 'x86_64')
url="http://www.cadsoft.de/"
license=('custom')
depends=(
  'libxrender'
  'libxrandr'
  'libxcursor'
  'freetype2'
  'fontconfig'
  'libxext'
  'libx11'
  'libxi'
  'openssl'
  'zlib'
  'gcc-libs')
_fname32=$pkgname-lin32-$pkgver.run
_fname64=$pkgname-lin64-$pkgver.run
[[ $CARCH = i686 ]] && {
  _fname=$_fname32
} || {
  _fname=$_fname64
}
# depends=(
#   'lib32-libxrender'
#   'lib32-libxrandr'
#   'lib32-libxcursor'
#   'lib32-freetype2'
#   'lib32-fontconfig'
#   'lib32-libxext'
#   'lib32-libx11'
#   'lib32-libxi'
#   'lib32-openssl'
#   'lib32-zlib'
#   'lib32-gcc-libs'
# )
source=(ftp://ftp.cadsoft.de/$pkgname/program/${pkgver%.*}/$_fname32
        ftp://ftp.cadsoft.de/$pkgname/program/${pkgver%.*}/$_fname64
        $pkgname.desktop
        $pkgname.sh
        $pkgname.install
        $pkgname.xml)
md5sums=('9aa8b67100226d1455920f63c1902726'
         '32ddeb345b477aec20dad47a5e360ad5'
         '191fc21122f21b827244b6f761d3d599'
         'c6ab1922cd76bae647a20eadfc97ded2'
         'ad1e992269e84e7ba2f622a536baefe9'
         '2068b18ac6caf7c07b48acee09f40247')
options=('!emptydirs' '!upx')
install=eagle.install

package() {
  cd "$srcdir"

  msg2 "Extracting package content (this may take a while)..."
  install -dm755 "$pkgdir/opt"
  sed -e '1,/^__DATA__$/d' "$_fname" | \
      tar --no-same-owner -xjC "$pkgdir/opt"

  msg2 "Fixing path name and permission..."
  mv "$pkgdir/opt/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
  chmod -R a-s "$pkgdir/opt/$pkgname/"

  cd "$srcdir"

  msg2 "Installing wrapper scripts..."
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" \
          "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.xml" \
          "$pkgdir/usr/share/mime/packages/$pkgname.xml"
  install -dm755 "$pkgdir"/usr/share/{man/man1,licenses/$pkgname}
  ln -sf /opt/$pkgname/doc/$pkgname.1 \
     "$pkgdir/usr/share/man/man1/$pkgname.1"
  ln -sf /opt/$pkgname/doc/license_en.txt \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # copy icon
  install -Dm644 "$pkgdir/opt/$pkgname/bin/eagleicon50.png" \
          "$pkgdir/usr/share/pixmaps/eagle.png"
}
