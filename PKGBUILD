# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

set -u
pkgname='tcpslice'
pkgver='1.8'
pkgrel='1'
pkgdesc="A tool for extracting portions of packet-trace files generated using tcpdump's -w flag."
arch=('i686' 'x86_64')
url='https://www.tcpdump.org/'
_giturl="https://github.com/the-tcpdump-group/${pkgname}"
license=('BSD')
depends=('glibc' 'libpcap' 'libnids')
optdepends=(
  'libosip2: track SIP calls'
  #'libooh323c: track H323 calls'
)
_srcdir="${pkgname}-${pkgver}"
source=(
  #"ftp://ftp.ee.lbl.gov/${pkgname}-${pkgver}.tar.gz"
  "${_giturl}/archive/refs/tags/${_srcdir}.tar.gz"
  'LICENSE'
)
_srcdir="${pkgname}-${_srcdir}"
md5sums=('e5bf5893741d0ec919ac352f5af05b61'
         'a8c9bb95fd32da1c9fdf4b5825ba7628')
sha256sums=('2d69ec18fa5d517c4ee4aa317cbf3be0c1a7a962a4a38d6b082096df177d01d0'
            '6f4b64754b831217eee983f787d3b278ae7e73e4563c52bfe69cf7b07566f588')

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    ./autogen.sh
  fi
  if [ ! -s 'Makefile' ]; then
    ./configure --sbindir='/usr/bin' --prefix='/usr'
  fi
  make -s -j1 # too small to need this
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 install DESTDIR="${pkgdir}"
  install -Dpm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" '../LICENSE'
  set +u
}
set +u
