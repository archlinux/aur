# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

set -u
pkgname='tcpslice'
pkgver='1.2a3'
pkgrel='1'
pkgdesc="A tool for extracting portions of packet-trace files generated using tcpdump's -w flag."
arch=('i686' 'x86_64')
url='https://www.tcpdump.org/'
_giturl="https://github.com/the-tcpdump-group/${pkgname}"
license=('BSD')
depends=('libpcap')
_srcdir="${pkgname}-${pkgver}"
source=(
  #"ftp://ftp.ee.lbl.gov/${pkgname}-${pkgver}.tar.gz"
  "${_giturl}/archive/refs/tags/${_srcdir}.tar.gz"
  'tcpslice-CVS.20010207-bpf.patch'
  'tcpslice-1.2a3-time.patch'
  '0000-add-x64-cpu.patch'
  '0001-util-stdlib.patch'
  'LICENSE'
)
_srcdir="${pkgname}-${_srcdir}"
md5sums=('e329cbeb7e589f132d92c3447c477190'
         'd09da8cba8d72acc1bfcbca3244f7f0d'
         '21ab0242869433d0e2b1b4f183dafcef'
         'f553efd84cf415064b082471afc55d23'
         '7787c37a16a81d6a58e89a92206ca27a'
         'a8c9bb95fd32da1c9fdf4b5825ba7628')
sha256sums=('4096e8debc898cfaa16b5306f1c42f8d18b19e30e60da8d4deb781c8f684c840'
            '51f10963a0e84bdaddce76cdcf52a833a348eaea1073c614c6a6c478967e058e'
            '8a4b60b0833e297958a166c28911259ad314ca5b0a2e0e3d8cb7d96a69914923'
            '3d25564e12a77200fc30cf358fe685fa2a7e71b9c5259bf0acabbf3492257085'
            '79690d882d5d016349ece906a2c3905ed64914839310f94ea8c798e6eb23d926'
            '6f4b64754b831217eee983f787d3b278ae7e73e4563c52bfe69cf7b07566f588')

prepare() {
  set -u
  chmod -R 'u+w' "${_srcdir}"
  cd "${_srcdir}"

  patch -Nup1 -i '../tcpslice-CVS.20010207-bpf.patch'
  patch -Nup1 -i '../tcpslice-1.2a3-time.patch'

  # cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0000-add-x64-cpu.patch'
  patch -Nup1 -i '../0000-add-x64-cpu.patch'

  # cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0001-util-stdlib.patch'
  patch -Nup1 -i '../0001-util-stdlib.patch'

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./configure --sbindir='/usr/bin'
  fi
  make -s -j1 # too small to need this
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm755 'tcpslice' "${pkgdir}/usr/bin/tcpslice"
  install -Dpm544 'tcpslice.1' "${pkgdir}/usr/share/man/man1/tcpslice.1"

  install -Dpm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
