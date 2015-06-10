# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

_pkgname=cppcheck
pkgname=${_pkgname}-nogui
pkgver=1.69
pkgrel=1
pkgdesc="A tool for static C/C++ code analysis - CLI version without GUI"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cppcheck/"
license=('GPL')
depends=('pcre' 'python-pygments')
makedepends=('docbook-xsl' 'python')
source=(http://sourceforge.net/projects/cppcheck/files/cppcheck/${pkgver}/cppcheck-${pkgver}.tar.gz/download)
sha1sums=('75da97aca2991a88840d52993e012c95ded6f7ff')

build() {
   cd "${_pkgname}-${pkgver}"
   # Unicode fix
   LANG='en_US.UTF-8' make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes
   make DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-1.78.1/manpages/docbook.xsl CFGDIR=/usr/share/cppcheck/cfg man
}

check() {
   cd "${_pkgname}-${pkgver}"

#   LANG='en_US.UTF-8' make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes test
}

package() {
   cd "${_pkgname}-${pkgver}"
   LANG='en_US.UTF-8' make DESTDIR=${pkgdir} CFGDIR=/usr/share/cppcheck/cfg SRCDIR=build HAVE_RULES=yes install 

   install -D -p -m 644 cppcheck.1 "${pkgdir}"/usr/share/man/man1/cppcheck.1

   install -d "${pkgdir}"/usr/share/cppcheck/cfg
   install -D ./cfg/* -t "${pkgdir}"/usr/share/cppcheck/cfg
}
