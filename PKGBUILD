# Maintainer: François Guerraz <kubrick@fgv6.net>
pkgname=payetools-rti
pkgver=21.1.21106.209
pkgrel=1
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
	)
noextract=( "$pkgname-$pkgver-linux.zip" )
sha256sums=(
	"a703cb47656b063bfade0722f16c7b4227bd50673d8cde541b1a6e310f46e5b8"
	)

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
  chrpath -d opt/HMRC/basic-paye-tools/libQt* 
  chrpath -d opt/HMRC/basic-paye-tools/PyQt4.Qt* 
  chrpath -d opt/HMRC/basic-paye-tools/imageformats/* 
  install -D -t ${pkgdir}/usr/share/licenses/payetools-rti/ ${pkgdir}/opt/HMRC/basic-paye-tools/license.txt
  sed -i "s#${pkgdir}##g" ${pkgdir}/tmp/.local/share/applications/*.desktop
  install -D -t ${pkgdir}/usr/share/applications/ ${pkgdir}/tmp/.local/share/applications/*.desktop
  rm -fr ${pkgdir}/tmp
  mv opt/HMRC/basic-paye-tools/rti.cfg opt/HMRC/basic-paye-tools/rti.cfg.template
}
