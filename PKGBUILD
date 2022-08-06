# Maintainer: François Guerraz <kubrick@fgv6.net>
pkgname=payetools-rti
pkgver=22.1.22165.249
pkgrel=1
pkgdesc="UK HMRC Basic PAYE Tools for Linux"
arch=('x86_64')
url="https://www.gov.uk/basic-paye-tools"
license=('custom')
groups=()
depends=()
makedepends=('unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
changelog=
source=(
	"https://www.gov.uk/government/uploads/uploaded/hmrc/$pkgname-$pkgver-linux.zip" 
	)
noextract=( "$pkgname-$pkgver-linux.zip" )
sha256sums=(
        "91a702c75afd44ac7fcd3e0d6dec95b6d8dafc89b498e23073185b2cf6e7b981"
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
  install -D -t ${pkgdir}/usr/share/licenses/payetools-rti/ ${pkgdir}/opt/HMRC/basic-paye-tools/license.txt
  sed -i "s#${pkgdir}##g" ${pkgdir}/tmp/.local/share/applications/*.desktop
  install -D -t ${pkgdir}/usr/share/applications/ ${pkgdir}/tmp/.local/share/applications/*.desktop
  rm -fr ${pkgdir}/tmp
  mv opt/HMRC/basic-paye-tools/rti.cfg opt/HMRC/basic-paye-tools/rti.cfg.template
}
