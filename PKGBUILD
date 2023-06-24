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
pkgver=2.25.6
pkgrel=1
pkgdesc="Lilypond music engraving program (development release)"
arch=('x86_64')
url="https://lilypond.org"
license=('FDL1.3' 'GPL3' 'custom:OFL')
groups=('pro-audio')
# NOTE: use guile only with 2.24.x
depends=('gcc-libs' 'ghostscript' 'glibc' 'gsfonts' 'guile2.2')
makedepends=('fontconfig' 'fontforge' 'freetype2' 'glib2' 'imagemagick' 'pango'
'python' 'rsync' 't1utils' 'texinfo' 'texlive-core' 'tex-gyre-fonts'
'texlive-langcyrillic' 'texlive-metapost' 'texlive-fontutils' 'zip')
optdepends=(
  'python: for lilypond-book and other scripts'
  'tex-gyre-fonts: for extra fonts'
  'ttf-dejavu: for extra fonts'
)
provides=('lilypond=${pkgver}')
conflicts=('lilypond')
source=("https://lilypond.org/downloads/sources/v${pkgver%.*}/$_pkgname-$pkgver.tar.gz")
sha512sums=('8e7a30bccdc2eee4a4cc00318d39e5838a8bfbdd909fd191be8620467a0e24ab15eb0c25d8fcab7fce7828ed6f1f177bae5796fe6a50605abeefb213ac6d4006')
b2sums=('ab3bbe96650eba20363c368825602593d760001d820e7884c79664a1fbf1cdf4806ab6a5c3ead4c15c06ea800a6ea1aab715524fd4bbea0d9fb35c15e666a959')

prepare() {
  cd "$_pkgname-$pkgver"
  autoconf --force --verbose
}

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr \
              GUILE_FLAVOR=guile-2.2
  make
  make bytecode
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
