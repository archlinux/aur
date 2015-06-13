# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=nx-all
pkgver=3.5.0
pkgrel=9
pkgdesc="NoMachine nxclient, nxnode, and nxserver in one package"
arch=('i686' 'x86_64')
url="https://www.nomachine.com/"
license=('custom:nomachine')
depends=('libcups' 'psmisc')
makedepends=('python-html2text')
optdepends=('openssh: SSH server for NX server'
            'tigervnc: VNC (RFB) client support'
            'rdesktop: RDP client support')
provides=('nxclient' 'nxnode' 'nxserver')
conflicts=('freenx' 'nxclient')
install="${pkgname}.install"
source=("license.html"::"https://www.nomachine.com/licensing-3-5"
        "nxsensor.service"
        "nxserver.service"
        "nxnode-arch.patch"
        "nxserver-arch.patch")
source_i686=("https://dl.dropboxusercontent.com/u/99802211/External_Sources/NoMachine%20NX/nxclient-3.5.0-7.i386.tar.gz"
           "https://dl.dropboxusercontent.com/u/99802211/External_Sources/NoMachine%20NX/nxnode-3.5.0-9.i386.tar.gz"
           "https://dl.dropboxusercontent.com/u/99802211/External_Sources/NoMachine%20NX/nxserver-3.5.0-11.i386.tar.gz")
source_x86_64=("https://dl.dropboxusercontent.com/u/99802211/External_Sources/NoMachine%20NX/nxclient-3.5.0-7.x86_64.tar.gz"
           "https://dl.dropboxusercontent.com/u/99802211/External_Sources/NoMachine%20NX/nxnode-3.5.0-9.x86_64.tar.gz"
           "https://dl.dropboxusercontent.com/u/99802211/External_Sources/NoMachine%20NX/nxserver-3.5.0-11.x86_64.tar.gz")
sha256sums=('SKIP'
            '5ffb4b9981b305ed1dbd2cc24589607d585ece95f8739d84026e05c6909e9a7a'
            '7e284776f876b5a65a478b7dca5e056284c6dcf31d070a970e2898de94df1100'
            'e32ff6b79c5bace2faf63bf9e333f66b3c283e5641c08abaf55ffef5be83a997'
            '7efdf6c07dbb56b76608729849af866b3df60f9533e0e162b1bf2f2df270a5b2')
sha256sums_i686=('3e4c5882f07ea408b3cf0e96aba6a06745a8838cccead8914ef2c96ba6a19953'
                 '93310cd78617ca3619fbf093d6760c00459367ebf824ec643c1c5f20202d8488'
                 '860a5de07e247e38d951f77b87f4dae3eb338120d768f2098df6332e63910074')
sha256sums_x86_64=('e1037f3bd5ccfaa376a6e6dca1c52d666bfd7ea813d3971e85a086e541141e71'
                   '555ed1d18280825075c617effec2cfdc83fd2d8be189b08b09288abefbe86238'
                   '05b462bf6b888dbdd22246a521a0b6ed18ba5d55de673a53c5ae9d9c6dd68c63')

prepare() {
  # Prepare license file
  html2text --ignore-links --ignore-images --ignore-emphasis --body-width=80 < \
    license.html | sed -n '/End-User License Agreement/,/for any updates/p' > LICENSE
  # Patch nxnode and nxserver launchers
  patch -Np2 -i "nxnode-arch.patch"
  patch -Np2 -i "nxserver-arch.patch"
  # Fix configuration files
  cd "NX/etc"
  install "node-debian.cfg.sample" "node-arch.cfg.sample"
  sed -i 's,^CommandFuser =.*$,CommandFuser = "/usr/bin/fuser",' "node-arch.cfg.sample"
  install "server-debian.cfg.sample" "server-arch.cfg.sample"
  sed -i 's/^#SSHAuthorizedKeys = .*$/SSHAuthorizedKeys = "authorized_keys"/' "server-arch.cfg.sample"
}

package() {
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" "nxsensor.service" "nxserver.service"

  install -m 755 -d "${pkgdir}/usr/NX"
  cp -a "${srcdir}/NX" "${pkgdir}/usr/"
  install -m 755 -d "${pkgdir}/usr/bin/"

  ln -s -t "${pkgdir}/usr/bin/" /usr/NX/bin/{nxclient,nxkill,nxnode,nxprint,nxserver}
}

