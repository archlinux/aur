# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Daan van Rossum <d.r.vanrossum at gmx dot de>
# Contributor: menta <attila dot toth at ch dot bme dot hu>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=llpp
pkgver=24
_pkgver=1415638
pkgrel=1
pkgdesc='A graphical PDF viewer which aims to superficially resemble less(1).'
arch=('i686' 'x86_64')
url='http://repo.or.cz/w/llpp.git'
license=('custom')
provides=('llpp')
conflicts=('llpp-git')
depends=('openjpeg2' 'jbig2dec' 'freetype2' 'harfbuzz' 'libjpeg' 'openssl' 'zlib' 'desktop-file-utils' 'mesa' 'libgl')
makedepends=('ocaml' 'libmupdf')
optdepends=(
  'xsel: text selection'
  'xclip: text selection'
  'sdcv: dictionary lookup'
  'rofi: dictionary lookup'
  'adobe-source-code-pro-fonts: recommended font for dictionary lookup presentation (any font can be used)'
  'wget: llppac fetch remote urls (preferred)'
  'curl: llppac fetch remote urls (alternative)'
  'file: llppac automatic file type recognition'
  'xz: llppac xz archives'
  'gzip: llppac gzip archives'
  'bzip2: llppac bzip2 archives'
  'zip: llppac png and jpeg conversion'
  'djvulibre: llppac djvu conversion'
  'ghostscript: llppac postscript, dvi, and djvu conversion'
  'princexml: llppac html conversion'
  'unoconv: llppac office document conversion'
  'antiword: llppac .doc conversion (alternative)'
  'inkscape: llppac svg conversion (preferred)'
  'librsvg: llppac svg conversion (alternative)'
  'imagemagick: llppac image conversion'
  'pango: llppac font conversion'
  'pandoc: llppac text conversion'
  'texlive-core: llppac dvi conversion'
)
source=("http://repo.or.cz/llpp.git/snapshot/${_pkgver}.tar.gz")
md5sums=('d02a01aeb3c25e9ab7254257fe5b5ae4')
sha1sums=('4c95650d805ce9c23e8c74acb26de299b3a40cb1')
sha256sums=('eff5ab376582a11e7258e7aab0ed73c5baaabb11bd560f39e26b53568d95c407')
options=('!strip')

prepare() {
  cd $srcdir/${pkgname}-${_pkgver}
  sed -i -e 's+-I \$srcdir/mupdf/include -I \$srcdir/mupdf/thirdparty/freetype/include+-I /usr/include/freetype2+' build.sh
  sed -i -e 's+-lmupdfthird+-lmupdfthird -lz -lfreetype -ljpeg -ljbig2dec -lopenjp2+' build.sh
  sed -i -e 's+-L\$srcdir/mupdf/build/native ++' build.sh

  # /usr/lib/libharfbuzz.so.0: error adding symbols: DSO missing from command line
  sed -i -e 's+-lmupdf+-lmupdf -lharfbuzz+' build.sh

}

build() {
  cd $srcdir/${pkgname}-${_pkgver}
  sh build.sh build/
  cd misc/completions/
  make
}

package() {
  cd $srcdir/${pkgname}-${_pkgver}
  install -Dm755 build/llpp $pkgdir/usr/bin/llpp
  install -Dm644 misc/llpp.desktop $pkgdir/usr/share/applications/llpp.desktop
  install -Dm644 README $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # helper scripts
  cd misc/
  for i in dicx dllpp llppac; do
    install -Dm755 $i $pkgdir/usr/bin/$i
  done

  # custom key bindings: https://wiki.archlinux.org/index.php/Llpp#Custom_key_bindings
  install -Dm644 keys.txt "$pkgdir/usr/share/$pkgname/keys.txt"

  # CSS styles
  for i in epub.css prince.css; do
    install -Dm644 $i "$pkgdir/usr/share/$pkgname/$i"
  done

  # Wikipedia
  install -Dm644 wikipedia/wiki2.css "$pkgdir/usr/share/$pkgname/wiki2.css"
  install -Dm755 wikipedia/wpget "$pkgdir/usr/share/$pkgname/wpget"

  # shell completion
  cd completions/
  install -Dm644 bash/llpp "$pkgdir/usr/share/bash-completion/completions/llpp"
  install -Dm644 bash/llppac "$pkgdir/usr/share/bash-completion/completions/llppac"
  install -Dm644 zsh/llpp "$pkgdir/usr/share/zsh/site-functions/_llpp"
  install -Dm644 zsh/llppac "$pkgdir/usr/share/zsh/site-functions/_llppac"
}

