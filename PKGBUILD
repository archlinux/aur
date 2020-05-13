# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: Felix Singer
# Contributor: Lari Tikkanen <lartza@wippies.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Otto Allmendinger <otto.allmendinger@googlemail.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>

pkgname=murmur-snapshot-ice
_pkgname=murmur
pkgver=1.3.1_rc1
_pkgver=1.3.1
pkgrel=1
epoch=1
pkgdesc="The voice chat application server for Mumble (snapshot)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://wiki.mumble.info/wiki/"
license=('BSD')
depends=('avahi' 'gcc-libs' 'glibc' 'grpc' 'libcap' 'libprotobuf.so'
'lsb-release' 'openssl' 'qt5-base' 'zeroc-ice')
makedepends=('boost' 'python' 'qt5-tools')
conflicts=('murmur' 'murmur-static' 'murmur-ice' 'murmur-snapshot-noice')
provides=('murmur')
backup=("etc/murmur.ini")
install="murmur.install"
#source=("https://dl.mumble.info/mumble-${pkgver//_/\~}~snapshot.tar.gz"{,.sig} # git snapshots
source=("https://dl.mumble.info/mumble-${pkgver//_/-}.tar.gz"{,.sig}
	a48aea18b6c7ee534cd21f7febfe253e31b33eda.patch
	"murmur.dbus.conf"
	"murmur.service"
	"murmur.sysusers"
	"murmur.tmpfiles")
sha512sums=('b05533545aaecb24f403f1876b8b1eb771d39724b1a4db65776cfbc09419b81f4c1017ec99aad7f0e4b5d16e6962d72817467e7a3dec628b4a9b66ab8de555cc'
            'SKIP'
            '2f379e355227e37f2d23d984d3a59779e3b7a2206865db8c9e4c9cb4eba563ca468744d862e29892919d8d2798576d2e011c658b48ca0acdde63e8a5cc577119'
            '97c7effdddec324e40195c36ef4927950a5de26d2ee2d268d89df6fb547207bbbe30292773316cae6f57ec9923244f205fb0edc377b798771ba7385e3c11d86a'
            '2059eeac32cc078168a2ea56fe3034df69814516303adeffb8062c7b90a88177a536e6a6742196ee90370084d4e536f825b1744f8bed2bb704159a8a8bccb606'
            '5af28d0c2b2b072cfbd500b5f63549e88a86cf3fc15e4d2df89e787c4d2bafdecbe078a518e0d1b25d82f9873cb06838ec1c9ebed625ffb7e8c80fcd942ebf74'
            '411784e8e0dcf6c163780ae895ae1a6bdad0bb2dd2b128911c484ac3eff073d95c5791b625493a2b8296d24bd7e6ac72d3c42180817e48b29f0c6a8fd841807c')
validpgpkeys=('56D0B23AE00B1EE9A8BAAC0F5B8CF87BB893449B') # Mumble Automatic Build Infrastructure 2019 <mumble-auto-build-2019@mumble.info>

prepare() {
  mv -v ${srcdir}/"${_pkgname}-${pkgver}" ${srcdir}/"${pkgname}-${pkgver}"
  cd ${srcdir}/"${pkgname}-${pkgver}"
  # setting default configuration
  sed -e "1i; vi:ft=cfg" \
      -e "s|database=|database=/var/db/murmur/murmur.sqlite|" \
      -e "s|;logfile=murmur.log|logfile=|" \
      -e "s|;uname=|uname=murmur|" \
      -i scripts/murmur.ini

  # See https://github.com/mumble-voip/mumble/pull/4032
  patch -Np1 -i "$srcdir"/a48aea18b6c7ee534cd21f7febfe253e31b33eda.patch
}

build() {
  cd $srcdir/mumble-${_pkgver}

  qmake-qt5 main.pro CONFIG+="no-client grpc"
  make release
}

package() {
    cd $srcdir/mumble-${_pkgver}

  # murmur has no install target: https://github.com/mumble-voip/mumble/issues/1029
  install -vDm 755 release/murmurd -t "${pkgdir}"/usr/bin
  install -vDm 640 scripts/murmur.ini -t "${pkgdir}"/etc
  install -vDm 644 "${srcdir}"/murmur.dbus.conf "${pkgdir}"/usr/share/dbus-1/system.d/murmur.conf
  install -vDm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 man/murmur*.1 -t "${pkgdir}/usr/share/man/man1/"
  install -vDm 644 "${srcdir}"/murmur.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 "${srcdir}"/murmur.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm 644 "${srcdir}"/murmur.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -vDm 644 src/murmur/{Murmur.ice,MurmurRPC.proto} -t "${pkgdir}/usr/share/${pkgname}"
}
