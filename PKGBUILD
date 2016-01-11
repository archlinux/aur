# Contributor: holos
# Contributor: Michael Witten <mfwitten>
# Contributor: Vladimir Gorbunov <zaza>
# Contributor: Earnest
# Contributor: Attila Toth <menta>
# Contributor: Flu

pkgname=llpp-git
pkgver=22.r71.g2bf99be
pkgrel=1
pkgdesc='Fast, featureful PDF viewer based on MuPDF.'
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/llpp.git"
license=('custom')
provides=('llpp')
conflicts=('llpp')
depends=('mupdf' 'freetype2' 'jbig2dec' 'openjpeg2'
         'libgl' 'libjpeg-turbo' 'glu' 'desktop-file-utils')
makedepends=('git' 'mupdf>=1.7' 'ocaml>=4.02')
source=('git://repo.or.cz/llpp.git')
sha256sums=('SKIP')
install=llpp.install
optdepends=(
  'xsel: Text selection'
  'file: llppac file type recognition'
  'gzip: llppac gzip archives'
  'xz: llppac xz archives'
  'bzip2: llpac bzip2 archives'
  'djvulibre: llppac djvu conversion'
  'ghostscript: llppac postscript, dvi, and djvu conversion'
  'princexml: llppac html conversion'
  'unoconv: llppac office document conversion'
  'librsvg: llppac svg conversion (preferred)'
  'inkscape: llppac svg conversion (alternative)'
  'imagemagick: llppac image conversion'
)
options=('!strip')

pkgver() {
  cd llpp
  git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd llpp
  sed -i -e 's+-I \$srcdir/mupdf/include -I \$srcdir/mupdf/thirdparty/freetype/include+-I /usr/include/freetype2+' build.sh
  sed -i -e 's+-lmupdfthird+-lmupdfthird -lz -lfreetype -ljpeg -ljbig2dec -lopenjp2+' build.sh
  sed -i -e 's+-L\$srcdir/mupdf/build/native ++' build.sh
  sh build.sh build/
}

package() {
  cd llpp
  install -Dm755 build/llpp "$pkgdir"/usr/bin/llpp

  install -Dm644 misc/llpp.desktop "$pkgdir"/usr/share/applications/llpp.desktop
  install -Dm644 README "$pkgdir"/usr/share/licenses/llpp-git/README
  #make -C misc/completions DESTDIR="$pkgdir" PREFIX=/usr install
}
