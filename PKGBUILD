# Maintainer: lis
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>

pkgname=lilypond-devel
_pkgname=lilypond
pkgver=2.23.6
pkgrel=1
pkgdesc="Music engraving program (development version)"
arch=('x86_64')
url="https://lilypond.org"
license=('FDL1.3' 'GPL3' 'custom:OFL')
groups=('pro-audio')
# NOTE: use guile only with 2.24.x
depends=('gcc-libs' 'ghostscript' 'glibc' 'gsfonts' 'guile1.8')
makedepends=('fontconfig' 'fontforge' 'freetype2' 'glib2' 'imagemagick' 'pango'
'python' 'rsync' 't1utils' 'texinfo' 'texlive-core' 'tex-gyre-fonts'
'texlive-langcyrillic' 'zip')
optdepends=(
  'python: for lilypond-book and other scripts'
  'tex-gyre-fonts: for extra fonts'
  'ttf-dejavu: for extra fonts'
)
provides=('lilypond=${pkgver}')
conflicts=('lilypond')
source=("https://lilypond.org/downloads/sources/v${pkgver%.*}/$_pkgname-$pkgver.tar.gz")
sha512sums=('855d2dcdade51b3e403434b9d2a92643e636c797ac7c67fea8e11cbd58deeaf02e2fca9ec0e4979ab147ab4b943304494f3e5cf07832556ff42c924501a1e59d')
b2sums=('d3b4cbe4f9c55e9cd503be11e9e4037ae33b3b9692de87bc6eccf0e475f2589da89a642a8852f79d880d9fc9391bae40d9c4d9f9b7d650da65eaacd3bb36209f')

prepare() {
  cd "$_pkgname-$pkgver"
  autoconf --force --verbose
}

build() {
  cd "$_pkgname-$pkgver"
  export GUILE=guile1.8
  ./configure --prefix=/usr \
              --disable-texi2html
  make
}

package() {
  depends+=('libfontconfig.so' 'libfreetype.so' 'libglib-2.0.so'
  'libgobject-2.0.so' 'libpangoft2-1.0.so' 'libpango-1.0.so')
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" vimdir="/usr/share/vim/vimfiles" install
  install -vDm 644 LICENSE.OFL -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {AUTHORS,NEWS}.txt README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # delete copied fonts, they are relied upon as optdepends
  rm "${pkgdir}/usr/share/lilypond/${pkgver}/fonts/otf/"{C059,Nimbus,texgyre}*.otf
}
