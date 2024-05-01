# Maintainer: François Guerraz <kubrick@fgv6.net>

pkgname=payetools-rti
pkgver=24.1.24086.542
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
options=(!strip !debug)
changelog=
source=(
	"https://www.gov.uk/government/uploads/uploaded/hmrc/$pkgname-$pkgver-linux.zip" 
	)
noextract=( "$pkgname-$pkgver-linux.zip" )
sha256sums=(
        "40e5ba2e8aa0d34d4072a597fd3387eb0bc8dae018e2a37216f43309511ef155"
)

prepare() {
  rm -fr ${srcdir}/opt || true
  unzip -o "$pkgname-$pkgver-linux.zip"
}

build() {
  export HOME=${srcdir}/tmp
  ./$pkgname-$pkgver-linux --prefix ${srcdir}/opt/HMRC/basic-paye-tools --check_for_updates 0 --mode unattended --debuglevel 4
  sed -i "s#${srcdir}##g" ${srcdir}/tmp/.local/share/applications/*.desktop
}

package() {
  install -d ${pkgdir}/opt/HMRC/
  cp -fr ${srcdir}/opt/HMRC/basic-paye-tools ${pkgdir}/opt/HMRC/
  install -D -t ${pkgdir}/usr/share/licenses/payetools-rti/ ${srcdir}/opt/HMRC/basic-paye-tools/license.txt
  install -D -t ${pkgdir}/usr/share/applications/ ${srcdir}/tmp/.local/share/applications/*.desktop
  mv ${pkgdir}/opt/HMRC/basic-paye-tools/rti.cfg ${pkgdir}/opt/HMRC/basic-paye-tools/rti.cfg.template
}
