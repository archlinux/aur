# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Matthias matthiaskrgr Krüger < matthias · krueger _strange_curverd_character_ famsik · de >
# Maintainer: aksr <aksr at t-com dot me>
pkgname=cppcheck-git
pkgver=1.80.382.gd18e8466a
pkgrel=1
pkgdesc='A tool for static C/C++ code analysis.'
arch=('i686' 'x86_64')
url='http://cppcheck.wiki.sourceforge.net'
license=('GPL3')
provides=('cppcheck')
conflicts=('cppcheck')
makedepends=('git' 'docbook-xsl' 'qt5-tools' 'python')
depends=('qt5-base' 'python-pygments' 'gcc-libs')
optdeps=('qt5: to build and run cppcheck-gui')
source=("$pkgname::git://github.com/danmar/cppcheck.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -e 's/^cppcheck\-//' -e 's/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  LANG='en_US.UTF-8' make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes
  xsversion=$(pacman -Qi docbook-xsl | grep ^Version | sed -e 's/.*: //' -e 's/-[0-9]$//')
  make DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-${xsversion}/manpages/docbook.xsl man

  cd gui
  lrelease-qt5 gui.pro
  qmake-qt5 HAVE_RULES=yes
  make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes
}

check() {
  cd "$srcdir/$pkgname"
  #LANG='en_US.UTF-8' make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes test

  mkdir -p make_check
  cd make_check
  cp -rp ../* . || true
  rm -r ./make_check

  make SRCDIR=build CFGDIR=./cfg HAVE_RULES=yes testrunner || make clean
  make SRCDIR=build CFGDIR=./cfg HAVE_RULES=yes testrunner
  ./testrunner ||  make clean
  make SRCDIR=build CFGDIR=./cfg HAVE_RULES=yes testrunner
  ./testrunner
}

package() {
  cd "$srcdir/$pkgname"
  LANG='en_US.UTF-8' make DESTDIR="${pkgdir}" CFGDIR=/usr/share/cppcheck/cfg SRCDIR=build HAVE_RULES=yes install
  install -Dpm 644 cppcheck.1 "${pkgdir}"/usr/share/man/man1/cppcheck.1

  mkdir -p ${pkgdir}/usr/share/{applications,cppcheck/cfg/lang}/
  install -Dm755 gui/cppcheck-gui "${pkgdir}"/usr/bin/cppcheck-gui
  install -D ./cfg/* -t "${pkgdir}"/usr/share/cppcheck/cfg
  install -D gui/*.qm -t "${pkgdir}"/usr/share/cppcheck/cfg/lang/
}

