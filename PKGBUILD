# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=vipster
pkgver=1.11a
pkgrel=1
pkgdesc="Molecule editor based on Qt, specialized on periodic structures"
arch=('x86_64')
url="https://sgsaenger.github.io/vipster"
license=('GPL3')
groups=()
depends=('qt5-base' 'python')
makedepends=('qbs')
source=("https://github.com/sgsaenger/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('bf8c241a548b83d54c3d1599d1d805a1')

build() {
  cd "$pkgname-$pkgver"

  qbs setup-toolchains --settings-dir . `which g++` gcc
  qbs setup-qt --settings-dir . `which qmake` qt
  qbs config --settings-dir . profiles.qt.baseProfile gcc

  qbs build --settings-dir . profile:qt qbs.buildVariant:release project.pythonBuild:true --no-install
}

check() {
    cd "$pkgname-$pkgver"

    qbs run --settings-dir . --products test_libvipster
}

package() {
  cd "$pkgname-$pkgver"

  qbs install --settings-dir . --install-root $pkgdir/usr
}
