# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Matthias matthiaskrgr Krüger < matthias · krueger _strange_curverd_character_ famsik · de >
# Maintainer: aksr <aksr at t-com dot me>
pkgname=cppcheck-git
pkgver=1.89.205.g0011fb5a3
pkgrel=1
pkgdesc='A tool for static C/C++ code analysis.'
arch=('i686' 'x86_64')
url='http://cppcheck.wiki.sourceforge.net'
license=('GPL3')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
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
  export CXXFLAGS+=" -DNDEBUG"
  LANG='en_US.UTF-8' make CFGDIR=/usr/share/cppcheck/cfg \
                          USE_MATCHCOMPILER=yes HAVE_RULES=yes
  xsversion=$(pacman -Qi docbook-xsl | grep ^Version | sed -e 's/.*: //' -e 's/-[0-9]$//')
  make DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-${xsversion}/manpages/docbook.xsl man

  cd gui
  lrelease-qt5 gui.pro
  qmake-qt5 HAVE_RULES=yes
  make CFGDIR=/usr/share/cppcheck/cfg USE_MATCHCOMPILER=yes HAVE_RULES=yes
}

#check() {
#  cd "$srcdir/$pkgname"
#  #LANG='en_US.UTF-8' make CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes USE_MATCHCOMPILER=yes test
#
#  mkdir -p make_check
#  cd make_check
#  cp -rp ../* . || true
#  rm -r ./make_check
#
#  make CFGDIR=./cfg USE_MATCHCOMPILER=yes HAVE_RULES=yes testrunner || make clean
#  make CFGDIR=./cfg USE_MATCHCOMPILER=yes HAVE_RULES=yes testrunner
#  ./testrunner || make clean
#  make CFGDIR=./cfg USE_MATCHCOMPILER=yes HAVE_RULES=yes testrunner
#  ./testrunner
#}

package() {
  cd "$srcdir/$pkgname"
  LANG='en_US.UTF-8' make DESTDIR="${pkgdir}" \
                          FILESDIR=/usr/share/cppcheck \
                          CFGDIR=/usr/share/cppcheck/cfg \
                          USE_MATCHCOMPILER=yes HAVE_RULES=yes install
  install -D -p -m644 cppcheck.1 "${pkgdir}"/usr/share/man/man1/cppcheck.1
  mkdir -p ${pkgdir}/usr/share/{applications,cppcheck/cfg/lang}/
  install -D -m755 gui/cppcheck-gui "${pkgdir}"/usr/bin/cppcheck-gui
  install -D ./cfg/* -t "${pkgdir}"/usr/share/cppcheck/cfg
  install -D gui/*.qm -t "${pkgdir}"/usr/share/cppcheck/cfg/lang/
}

