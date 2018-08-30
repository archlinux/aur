# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=vipster-git
pkgver=r806.e00e69b
pkgrel=1
pkgdesc="Molecule editor based on Qt, specialized on periodic structures, development version"
arch=('x86_64')
url="https://sgsaenger.github.io/vipster"
license=('GPL3')
groups=()
depends=('qt5-base' 'python')
makedepends=('qbs' 'git')
conflicts=('vipster')
source=("git+https://github.com/sgsaenger/vipster#branch=testing")
md5sums=('SKIP')

pkgver() {
    cd vipster
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd vipster

  qbs setup-toolchains --settings-dir . `which g++` gcc
  qbs setup-qt --settings-dir . `which qmake` qt
  qbs config --settings-dir . profiles.qt.baseProfile gcc

  qbs build --settings-dir . profile:qt qbs.buildVariant:release project.pythonBuild:true --no-install
}

check() {
    cd vipster

    qbs run --settings-dir . --products test_libvipster
}

package() {
  cd vipster

  qbs install --settings-dir . --install-root $pkgdir/usr
}
