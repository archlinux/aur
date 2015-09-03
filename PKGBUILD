# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Matthias matthiaskrgr Krüger < matthias · krueger _strange_curverd_character_ famsik · de >
# Maintainer: aksr <aksr at t-com dot me>
pkgname=cppcheck-git
pkgver=1.69.673.gea11e28
pkgver() {
    cd cppcheck
    git describe --tags | sed -e 's/^cppcheck\-//' -e 's/-/./g'
}
pkgrel=1
pkgdesc='A tool for static C/C++ code analysis.'
arch=('i686' 'x86_64')
url='http://cppcheck.wiki.sourceforge.net'
license=('GPL3')
provides=('cppcheck')
conflicts=('cppcheck')
makedepends=('git' 'docbook-xsl' 'python-pygments') # 'gcc-multilib') # multilib needed for -m32 
depends=('gcc-libs' 'pcre' 'python')
optdeps=('qt4: to build and run cppcheck-gui')
source=('cppcheck::git://github.com/danmar/cppcheck.git')
sha1sums=('SKIP')


build() {
  cd "$srcdir"/cppcheck
  make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes
  make DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-1.78.1/manpages/docbook.xsl man
  #make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes reduce

  if [[ -z `pacman -T qt4` ]] ; then
    msg 'qt4 found!'
    msg 'Building cppcheck-gui'
    cd "$srcdir"/cppcheck/gui
    
    qmake-qt4 HAVE_RULES=yes
    lrelease-qt4 gui.pro
    make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes
  fi
}

check() {
  cd "$srcdir"/cppcheck
  # CFGDIR="$srcdir"/.../cfg does NOT work, it will make cppcheck depend on the build file
  mkdir -p make_check
  cd make_check
  cp -rp ../* . || true
  rm -r ./make_check # prevent recursively adding check dir
  make SRCDIR=build CFGDIR=./cfg HAVE_RULES=yes testrunner || make clean ; make SRCDIR=build CFGDIR=./cfg HAVE_RULES=yes testrunner
  ./testrunner ||  make clean ; make SRCDIR=build CFGDIR=./cfg HAVE_RULES=yes testrunner ; ./testrunner
}

package() {
  cd "$srcdir"/cppcheck
#    make DESTDIR="${pkgdir}" CFGDIR=/usr/share/cppcheck/cfg SRCDIR=build HAVE_RULES=yes install 
  make DESTDIR="${pkgdir}" SRCDIR=build HAVE_RULES=yes install # CFGDIR=/usr/share/cppcheck/cfg
  if [[ -z `pacman -T qt4` ]] ; then
    cd "$srcdir"/cppcheck/gui
#    make install BINDIR="${pkgdir}"/usr/bin DATADIR="${pkgbuild}"/usr/share/cppcheck
    install -Dm 755 ./cppcheck-gui "${pkgdir}"/usr/bin/cppcheck-gui # install binary
  #  mkdir -p "${pkgdir}"/usr/share/cppcheck/lang/ # create translation dir
  #  install -D cppcheck*.qm "${pkgdir}"/usr/share/cppcheck/lang/ # install translations
    "${pkgdir}"/usr/bin/cppcheck-gui --data-dir=/usr/share/cppcheck/cfg 
    cd ../ # in $srcdir/cppcheck now
  fi
   install -D -p -m 644 cppcheck.1 "${pkgdir}"/usr/share/man/man1/cppcheck.1
  mkdir -p "${pkgdir}"/usr/share/cppcheck/cfg # create the dir
  install -D ./cfg/* -t "${pkgdir}"/usr/share/cppcheck/cfg # copy all the cfgs into the dir
  #install -D -p -m 755 reduce "${pkgdir}"/usr/bin/cppcheck-reduce #not really needed
}

