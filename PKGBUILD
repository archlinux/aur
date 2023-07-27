# Userspace binary that manages MiSTer on the ARM side
# Maintainer: Alexandru M Stan <alex@hypertriangle.com>

# This package is repackaged from the files at
# https://github.com/MiSTer-devel/Main_MiSTer/tree/master/releases
# hence this is why it has a -bin suffix, as opposed to us compiling
# the releases ourselves.

buildarch=4

pkgname=mister-bin
pkgver=20230716
pkgrel=1
pkgdesc="Userspace binary that manages MiSTer on the ARM side, prebuilt"
arch=('armv7h')
provides=('mister')
conflicts=('mister')
url='https://github.com/MiSTer-devel/Main_MiSTer/'
license=('GPL3')
depends=("imlib2" "bluez-libs")
optdepends=('linux-mister: MiSTer userspace probably needs custom kernel drivers'
            'mister-menu: MiSTer needs an FPGA core to talk to')
source=("git+https://github.com/MiSTer-devel/Main_MiSTer.git"
        'mister-bin.install'
        'MiSTer.service'
        'tmpfiles.d')
sha256sums=('SKIP'
            'cab7d3dfc8b0fd15deaef00dd5931b66da3a59e721fba6f957de7f4a915b8c98'
            '6f9a9a14420078c5fc5afeab364aba4a0be55992e95b897b913ed76e4fbe2971'
            '4e786d340f81762878251e02288630beb7e6caa0ec8a7d7f9e13a5dcdb96f342')

pkgver() {
  cd "Main_MiSTer/releases"
  last_file=$(ls | tail -n 1)
  echo ${last_file} | sed "s/MiSTer_//"
}

package() {
  install=mister-bin.install

  install Main_MiSTer/releases/MiSTer_${pkgver} -m744 -D "${pkgdir}"/usr/bin/MiSTer
  install MiSTer.service -Dt "${pkgdir}"/usr/lib/systemd/system

  install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mister.conf

  # TODO: add MiSTer.ini?
}
