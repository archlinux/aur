# Maintainer:
# Contributor: Yvaniak <Yvaniak 11 at gmail dot com>
# Contributor: Vladimir Svyatski <vsvyatski@yandex.ru>
# Contributor: Edoardo Brogiolo <edoardo@brogiolo.eu>
# Contributor: Dimitris Kiziridis <ragouel@outlook.com>

_pkgname="peazip"
pkgname="$_pkgname-gtk2-bin"
pkgver=10.2.0
pkgrel=1
pkgdesc="Cross-platform file and archive manager (GTK2)"
url="https://github.com/peazip/PeaZip"
license=('LGPL-3.0-or-later')
arch=('x86_64')

depends=(
  '7zip'
  'brotli'
  'gtk2'
  'zstd'
)
optdepends=(
  'arc: Arc file archiver and compressor'
  'paq8o: PAQ8 series of archivers, resurrected by new maintainers'
  'quad: High-performance file compressor that utilizes an advanced LZ-based compression algorithm'
  'upx: Extendable, high-performance executable packer for several executable formats'
  'zpaq: Programmable file compressor, library and utilities'
)

options=('!debug' '!emptydirs')

provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-debug")

source=("$url/releases/download/$pkgver/peazip-$pkgver.LINUX.GTK2-1.$CARCH.rpm")
sha256sums=('25eeb581ec5ee08e068c50751479d3465e399581938f773a9ab9029a1c736b7e')

prepare() {
  cd usr/share/peazip
  rm -r lang-wincontext
  rm -r batch/{Windows,'macOS service menus',bat}
  rm -r batch/freedesktop_integration/KDE-servicemenus/{KDE3*,KDE4*}
  rm icons/peazip_seven.icl
  rm readme/readme_{Windows,macOS}.txt
  cd "$srcdir/usr/lib/peazip/res/bin"
  ln -sf /usr/bin/7z 7z/7z
  ln -sf /usr/bin/brotli brotli/brotli
  ln -sf /usr/bin/zstd zstd/zstd
  rm 7z/7z.sfx
  chmod -x 7z/Codecs/*.so
}

package() {
  mkdir -p "$pkgdir/usr/"{bin,lib/peazip,share/{doc/peazip,peazip,licenses/peazip,icons/hicolor/256x256/apps}}
  cd usr
  mv bin/peazip "$pkgdir/usr/bin"
  install -Dm755 lib/peazip/{peazip,pea} "$pkgdir/usr/lib/peazip"
  mv lib/peazip/res "$pkgdir/usr/lib/peazip"
  cd share
  mv applications "$pkgdir/usr/share"
  mv pixmaps/* "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  cd peazip
  mv peazip_help.pdf "$pkgdir/usr/share/doc/peazip"
  mv copying/* "$pkgdir/usr/share/licenses/peazip"
  mv readme/readme_Linux.txt "$pkgdir/usr/share/doc/peazip/readme.txt"
  rm -r readme
  mv ../peazip "$pkgdir/usr/share"
  ln -s /usr/lib/peazip/pea "$pkgdir/usr/bin"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
