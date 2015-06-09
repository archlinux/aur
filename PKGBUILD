# Contributor: holos
# Contributor: Michael Witten <mfwitten>
# Contributor: Vladimir Gorbunov <zaza>
# Contributor: Earnest
# Contributor: Attila Toth <menta>
# Contributor: Flu

pkgname=llpp-git
pkgver=21.r61.gdf146ab
pkgrel=1
pkgdesc='Fast, featureful PDF viewer based on MuPDF.'
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/llpp.git"
license=('custom')
provides=('llpp')
conflicts=('llpp')
install=llpp.install
depends=('desktop-file-utils' 'freetype2' 'glu' 'jbig2dec' 'openjpeg2'
         'libgl' 'libjpeg-turbo' 'libx11')
makedepends=('git' 'mupdf>=1.7' 'ninja' 'ocaml>=4.02' 'ocaml-lablgl')
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
source=('git://repo.or.cz/llpp.git'
        'fix-libs.patch')
sha256sums=('SKIP'
            'fdda445e28d93ecdc0ad03b24da9a2b890a287e34c307c8762944edeacf1ae91')

pkgver() {
  cd llpp
  git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd llpp
  patch -p1 < ../fix-libs.patch
}

build() {
  cd llpp
  sh configure.sh -n .
  ninja "$srcdir"/llpp/build/llpp.custom
  make -C misc/completions
}

package() {
  cd llpp
  install -Dm755 build/llpp.custom "$pkgdir"/usr/bin/llpp
  install -Dm755 misc/llppac "$pkgdir"/usr/bin/llppac
  install -Dm755 misc/gc.py "$pkgdir"/usr/lib/llpp/gc
  install -Dm644 misc/llpp.desktop "$pkgdir"/usr/share/applications/llpp.desktop
  install -Dm644 README "$pkgdir"/usr/share/licenses/llpp/README
  make -C misc/completions DESTDIR="$pkgdir" PREFIX=/usr install
}
