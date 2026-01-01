# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=irmplircd
pkgver=20210317
_gitver=70fef522424c1f1b0aaeb34699196479c27c9ce0
pkgrel=1
pkgdesc="zeroconf LIRC daemon that reads IRMP events from the USB IR Remote Receiver"
url="https://github.com/realglotzi/irmplircd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs')
makedepends=('git')
backup=("etc/irmp_stm32.map")
install=irmplircd.install
source=("git+https://github.com/realglotzi/irmplircd.git#commit=$_gitver"
        'irmplircd.tmpfiles'
        'irmplircd.service'
        '80-irmp.rules')
sha256sums=('3585bbb0ac7412f655f4d46ee3f517ccf1d7635b1cfbb5b549a96a13171f1f9a'
            'b8eb6ff2a542a9a3b20fe259fe36aece941db8d309598d2eeb1815b779e2f838'
            '23fcb3943a056df64f1447908b110dc6b57ad2f34cad22183f1cdf51ba01db50'
            'df405ab692eff3865578d84e85282d6b25b52edc6f6302c3ef72cfd2e3fcfc4d')

pkgver() {
  cd "${srcdir}/irmplircd"
  git log -1 --pretty=format:%ad --date=short | sed 's/-//g'
}

build() {
  cd "${srcdir}/irmplircd"
  CFLAGS+=" -Ic_hashmap"
  make
}

package() {
  cd "${srcdir}/irmplircd"
  make BINDIR="${pkgdir}/usr/bin" SHAREDIR="${pkgdir}/usr/share" install

  install -Dm644 "${srcdir}/irmplircd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/irmplircd.conf"
  install -Dm644 "${srcdir}/80-irmp.rules" "$pkgdir/usr/lib/udev/rules.d/80-irmp.rules"
  install -Dm644 "${srcdir}/irmplircd.service" "$pkgdir/usr/lib/systemd/system/irmplircd.service"

  mkdir -p "${pkgdir}/etc"
  echo -n > "${pkgdir}/etc/irmp_stm32.map"
}
