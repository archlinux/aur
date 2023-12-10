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
pkgver=2.25.11
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
sha512sums=('fd2fa08101f6cefdd7d4ccac6e7c38f6b50c64f168ee307caed0265d6659ea7691c571437e401c7067a6879efef9d63479f9c5804237e997344c42611e3bc6c6')
b2sums=('8fe1c1f5eac0c3ce550a48be9da94f51271a360e2ce6a4e2ba20cccd2fb4cf074fffef7f89f6cc43e60cf2177f28626e2f83b3f084dc8a30b958c311cd7cc299')

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
