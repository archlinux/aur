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
pkgver=2.25.25
pkgrel=1
pkgdesc="Lilypond music engraving program (development release)"
arch=('x86_64')
url="https://lilypond.org"
license=('FDL1.3' 'GPL3' 'custom:OFL')
groups=('pro-audio')
# NOTE: use guile only with 2.24.x
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
sha512sums=('ec7451b64523885ca75ec4df23e254cd330ae67607dd4ded16ae53b43e2eaeabac3232a4959fabe25ed55dca5cf81fd5b7a97ee4432c4d42aa2525e2b301e4d7')
b2sums=('2fb355fca75cf8298493bba05077338a505f1676fb9a98bfc9f13c3cd99d3a9c7dfafc32dc6e7e6055cf4c7ea7d6a77a15efe8ee4c8cfc778d112df4656ebd7f')

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
  make DESTDIR="$pkgdir" vimdir="/usr/share/vim/vimfiles" install
  make DESTDIR="$pkgdir" install-bytecode
  install -vDm 644 LICENSE.OFL -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {AUTHORS,NEWS}.txt README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # delete copied fonts, they are relied upon as optdepends
  # rm "${pkgdir}/usr/share/lilypond/${pkgver}/fonts/otf/"{C059,Nimbus,texgyre}*.otf
}
