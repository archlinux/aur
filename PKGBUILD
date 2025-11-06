# Maintainer: David Seus <cryptointerest at posteo dot de>
# Contributor: lis
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>

pkgname=lilypond-devel
_pkgname=lilypond
pkgver=2.25.30
pkgrel=1
pkgdesc="Lilypond music engraving program (development release)"
arch=('x86_64')
url="https://lilypond.org"
license=('FDL1.3' 'GPL3' 'custom:OFL')
groups=('pro-audio')
depends=('gcc-libs' 'ghostscript' 'glibc' 'gsfonts' 'guile')
makedepends=('fontconfig' 'fontforge' 'freetype2' 'glib2' 'imagemagick' 'pango'
'python' 'rsync' 't1utils' 'texinfo' 'texlive-core' 'tex-gyre-fonts'
'texlive-langcyrillic' 'texlive-metapost' 'texlive-fontutils'
'texlive-plaingeneric' 'zip')
optdepends=(
  'python: for lilypond-book and other scripts'
  'tex-gyre-fonts: for extra fonts'
  'ttf-dejavu: for extra fonts'
)
provides=('lilypond=${pkgver}')
conflicts=('lilypond')
source=("https://lilypond.org/downloads/sources/v${pkgver%.*}/$_pkgname-$pkgver.tar.gz")
sha512sums=('e48ea896ba6e092d84e28f75ee28983e51e17f417c60d638c7671cb3f16c6b0d71d3242029a5d0b3a113caeb2d84d55ba24325ba13891e1af1127397a8b988f8')
b2sums=('273a9cfa8d7b50a8cf8928bde69dfcc2f4c4bc8ac17cfb0693d291b995a444634c15e714c2d711d63729faa421bffcbba6e8047b4386229a1471af7d308f5812')

prepare() {
  cd "$_pkgname-$pkgver"
  autoconf --force --verbose
}

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr \
              GUILE_FLAVOR=guile-3.0
  make -j3
  make -j3 bytecode
}

package() {
  depends+=('libfontconfig.so' 'libfreetype.so' 'libglib-2.0.so'
  'libgobject-2.0.so' 'libpangoft2-1.0.so' 'libpango-1.0.so')
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install-bytecode
  make DESTDIR="$pkgdir" vimdir="/usr/share/vim/vimfiles" install
  install -vDm 644 LICENSE.OFL -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {AUTHORS,NEWS}.txt README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # delete copied fonts, they are relied upon as optdepends
  # rm "${pkgdir}/usr/share/lilypond/${pkgver}/fonts/otf/"{C059,Nimbus,texgyre}*.otf
}
