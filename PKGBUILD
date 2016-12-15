# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

set -u
pkgname='ipsumdump'
pkgver='1.86'
pkgrel='1'
pkgdesc='A tool that summarizes TCP/IP dump files into a self-describing ASCII format easily readable by humans and programs'
arch=('i686' 'x86_64')
#url='http://www.cs.ucla.edu/~kohler/ipsumdump/'
url="http://www.read.seas.harvard.edu/~kohler/${pkgname}/"
license=('GPL2' 'custom:Click')
depends=('gcc-libs' 'libpcap' 'gzip' 'iproute2' 'bzip2')
optdepends=('iptables')
_verwatch=("${url}" 'ipsumdump-\([0-9\.]\+\)\.tar\.gz' 'l')
source=("${url}${pkgname}-${pkgver}.tar.gz" 'LICENSE')
sha256sums=('e114cd01b04238b42cd1d0dc6cfb8086a6b0a50672a866f3d0d1888d565e3b9c'
            '5824ab84c843681a0c7b3a71fcaf2412d0cb4c38baf6883e77eb19e41499557f')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e 's:/usr/sbin/:/usr/bin/:g' -e 's:/sbin/:/usr/bin/:g' 'src/kernelfilter.cc' 'libclick-2.1/libsrc/addressinfo.cc'
  sed -i -e 's:"/bin/:"/usr/bin/:g' -e 's:/sbin/:/usr/bin/:g' 'libclick-2.1/libsrc/userutils.cc'
  #local _CPPFLAGS_OLD="${CPPFLAGS}" # fixed between 1.82 and 1.85
  #export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/}" # messes up configure
  ./configure --prefix='/usr' --mandir='/usr/share/man' --sbindir='/usr/bin'
  #export CPPFLAGS="${_CPPFLAGS_OLD}"
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j $(nproc)
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dpm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
