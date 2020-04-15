# Maintainer: François Guerraz <kubrick@fgv6.net>
pkgname=payetools-rti
pkgver=20.0.20083.454
pkgrel=3
pkgdesc="UK HMRC Basic PAYE Tools for Linux"
arch=('x86_64')
url="https://www.gov.uk/basic-paye-tools"
license=('custom')
groups=()
depends=('lib32-fontconfig' 'lib32-krb5' 'lib32-libxext' 'lib32-libxrender' 'lib32-libpng12' 'lib32-sqlite' 'lib32-libxml2')
makedepends=('unzip' 'lib32-fakeroot' 'chrpath')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=payetools-rti.install
changelog=
source=(
	"https://www.gov.uk/government/uploads/uploaded/hmrc/$pkgname-$pkgver-linux.zip" 
	"https://archive.org/download/archlinux_pkg_lib32-krb5/lib32-krb5-1.17.1-1-x86_64.pkg.tar.zst"
	)
noextract=( "$pkgname-$pkgver-linux.zip" )
sha256sums=(
	"4d1058f939c152946f6beae5e83bec4a8085a569ac9281b731e403203bd788ca"
	"a40bc137d02a17d759eacb7576bcf720202c9178318aae363a4814ba16eb739b"
	)

prepare() {
  unzip "$pkgname-$pkgver-linux.zip"
  mkdir lib32-krb5 || true
  tar --zstd -xvf lib32-krb5-1.17.1-1-x86_64.pkg.tar.zst -C lib32-krb5 usr/lib32
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
  chrpath -d opt/HMRC/basic-paye-tools/libQt* 
  chrpath -d opt/HMRC/basic-paye-tools/PyQt4.Qt* 
  chrpath -d opt/HMRC/basic-paye-tools/imageformats/* 
  cp -v ${srcdir}/lib32-krb5/usr/lib32/lib* opt/HMRC/basic-paye-tools/
  install -D -t ${pkgdir}/usr/share/licenses/payetools-rti/ ${pkgdir}/opt/HMRC/basic-paye-tools/license.txt
  sed -i "s#${pkgdir}##g" ${pkgdir}/tmp/.local/share/applications/*.desktop
  install -D -t ${pkgdir}/usr/share/applications/ ${pkgdir}/tmp/.local/share/applications/*.desktop
  rm -fr ${pkgdir}/tmp
  mv opt/HMRC/basic-paye-tools/rti.cfg opt/HMRC/basic-paye-tools/rti.cfg.template
}
