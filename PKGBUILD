# Maintainer: François Guerraz <kubrick@fgv6.net>
pkgname=payetools-rti
pkgver=17.3.17151.465
pkgrel=1
pkgdesc="UK HMRC Basic PAYE Tools for Linux"
arch=('x86_64')
url="https://www.gov.uk/basic-paye-tools"
license=('custom')
groups=()
depends=('lib32-bzip2' 'lib32-e2fsprogs' 'lib32-fontconfig' 'lib32-freetype2' 
	'lib32-gcc-libs' 'lib32-glib2' 'lib32-glibc' 'lib32-harfbuzz' 'lib32-keyutils'
	'lib32-krb5' 'lib32-libffi' 'lib32-libice' 'lib32-libpng' 'lib32-libsm'
	'lib32-libx11' 'lib32-libxau' 'lib32-libxcb' 'lib32-libxdmcp' 'lib32-libxext'
	'lib32-libxrender' 'lib32-pcre' 'lib32-readline' 'lib32-libpng12' 'lib32-sqlite' )
makedepends=('unzip' 'lib32-fakeroot')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=payetools-rti.install
changelog=
source=( "https://www.gov.uk/government/uploads/uploaded/hmrc/$pkgname-$pkgver-linux.zip" )
noextract=( "$pkgname-$pkgver-linux.zip" )
sha256sums=('1c16b4e5cf6a72c8e9544b223a039896eaa99d646af5a00f0c1974fe9880160c')

prepare() {
  unzip "$pkgname-$pkgver-linux.zip"
}

build() {
  true
}

package() {
  export HOME=${pkgdir}/tmp
  mv $pkgname-$pkgver-linux ${pkgdir}
  cd ${pkgdir}
  ./$pkgname-$pkgver-linux --prefix ${pkgdir}/opt/HMRC/basic-paye-tools --check_for_updates 0 --mode unattended --debuglevel 4
  rm $pkgname-$pkgver-linux
  install -D -t ${pkgdir}/usr/share/licenses/payetools-rti/ ${pkgdir}/opt/HMRC/basic-paye-tools/license.txt
  sed -i "s#${pkgdir}##g" ${pkgdir}/tmp/.local/share/applications/*.desktop
  install -D -t ${pkgdir}/usr/share/applications/ ${pkgdir}/tmp/.local/share/applications/*.desktop
  rm -fr ${pkgdir}/tmp
}
