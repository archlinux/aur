# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>
# Maintainer: Kevin Perry <perry+aur@coffee-break.at>

_pkgbase=icu
_pkgmajor=50
_pkgminor=2
_pkgpatch=0
_libdir='/usr/lib'

pkgname=${_pkgbase}${_pkgmajor}
pkgver=${_pkgmajor}.${_pkgminor}.${_pkgpatch}
pkgrel=1
pkgdesc='International Components for Unicode library'
url='http://site.icu-project.org/'
license=('custom:icu')

arch=('i686' 'x86_64')
depends=('gcc-libs>=4.7.1-5' 'sh')
makedepends=('clang' 'make' 'patch')
source=(${_pkgbase}-${pkgver}.tar.gz::https://github.com/unicode-org/icu/archive/release-50-2.tar.gz
        'icu.8198.revert.icu5431.patch'
        'icu-positionNULLcheck.patch')
md5sums=('671a083d9e56e953e36f10c556531637'
         'ebd5470fc969c75e52baf4af94a9ee82'
         'c2ead5292460c386818d75b2b6a69a5f')

prepare() {
  cd ${srcdir}/${_pkgbase}-release-${_pkgmajor}-${_pkgminor}/icu4c/source

  # fix Malayalam encoding https://bugzilla.redhat.com/show_bug.cgi?id=654200
  patch -Rp3 -i ${srcdir}/icu.8198.revert.icu5431.patch

  # fix TestTwoDigitYear https://sourceforge.net/p/icu/mailman/message/32443311/
  # patch taken from CentOS 7 source package
  # http://vault.centos.org/7.2.1511/os/Source/SPackages/icu-50.1.2-15.el7.src.rpm
  patch -p2 -i ${srcdir}/icu-testtwodigityear.patch

  # fix position pointer being checked against > 0
  patch -p2 -i ${srcdir}/icu-positionNULLcheck.patch
}

build() {
  cd ${srcdir}/${_pkgbase}-release-${_pkgmajor}-${_pkgminor}/icu4c/source

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/share/man
  make
}

check() {
  cd ${srcdir}/${_pkgbase}-release-${_pkgmajor}-${_pkgminor}/icu4c/source
  make check
}

package() {
  cd ${srcdir}/${_pkgbase}-release-${_pkgmajor}-${_pkgminor}/icu4c/source

  # copy only version specific libs
  mkdir -p ${pkgdir}${_libdir}
  cp -a lib/libicu*${_pkgmajor}* ${pkgdir}${_libdir}

  # install license
  install -Dm644 ${srcdir}/${_pkgbase}/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}

# vim:set ts=2 sw=2 et:
