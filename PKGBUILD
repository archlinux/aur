# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Mateusz Paluszkiewcz <aifam96 at gmail dot com>
# Contributor: Christopher Reimer <vdr4arch at creimer dot net>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

pkgname=poco
pkgver=1.6.0
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, complete edition with debug libraries"
arch=('i686' 'x86_64' 'armv6h')
url="http://www.pocoproject.org/"
license=('custom:boost')
depends=('libmariadbclient' 'openssl' 'unixodbc')
makedepends=('chrpath')
source=("http://pocoproject.org/releases/poco-${pkgver%p?}/poco-${pkgver}-all.tar.bz2"
        'poco-1.6.0-patch-for-libpcre.diff')
sha256sums=('17506e0f7abc2a6e933ef0f46a6c5ca6f7cb599370b11979f4e61b604ada240f'
            '163b7f26425128218128174d0349d3fabe7cb1068e59c20533124e84b46be910')
conflicts=('poco-dev')
provides=('poco-dev')
replaces=('poco-dev')

prepare()
{
  cd "${srcdir}/poco-${pkgver}-all"
  patch -p1 -i "$srcdir/poco-1.6.0-patch-for-libpcre.diff"
}

build()
{
  cd "${srcdir}/poco-${pkgver}-all"
  ./configure --prefix=/usr --no-samples --no-tests --unbundled
  make ODBCLIBDIR="/usr/lib"
}

package()
{
  cd "${srcdir}/poco-${pkgver}-all"
  make ODBCLIBDIR="/usr/lib" DESTDIR="${pkgdir}" install
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/poco/LICENSE"

  chrpath -d "${pkgdir}/usr/bin/cpspc"
  chrpath -d "${pkgdir}/usr/bin/cpspcd"
  chrpath -d "${pkgdir}/usr/bin/f2cpspd"
  chrpath -d "${pkgdir}/usr/bin/f2cpsp"
}
