# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=cppcheck-nox
_pkgname=cppcheck
pkgver=1.74
pkgrel=1
pkgdesc="A tool for static C/C++ code analysis without the GUI"
arch=('i686' 'x86_64')
url="http://cppcheck.sourceforge.net/"
license=('GPL')
depends=('python-pygments')
makedepends=('docbook-xsl' 'python')
optdepends=('pcre: searching regex with cppcheck')
source=(https://github.com/danmar/cppcheck/archive/${pkgver}.tar.gz)
sha256sums=('a7f9657bf458190ea1c994b95333d31d09420198ad8cd010c05d2194cc547fa0')

build() {
  cd "${_pkgname}-${pkgver}"
  # Unicode fix
  LANG='en_US.UTF-8' make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes
  make DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-1.79.1/manpages/docbook.xsl CFGDIR=/usr/share/cppcheck/cfg man
}

check() {
  cd "${_pkgname}-${pkgver}"
  # LANG='en_US.UTF-8' make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes test
}

package() {
  cd "${_pkgname}-${pkgver}"
  LANG='en_US.UTF-8' make DESTDIR=${pkgdir} CFGDIR=/usr/share/cppcheck/cfg SRCDIR=build HAVE_RULES=yes install

  install -D -p -m 644 cppcheck.1 "${pkgdir}"/usr/share/man/man1/cppcheck.1

  install -d "${pkgdir}"/usr/share/cppcheck/cfg
  install -D ./cfg/* -t "${pkgdir}"/usr/share/cppcheck/cfg
}
