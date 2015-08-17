# Maintainer: Zachary Hill <zer0t3ch97@gmail.com>

pkgname='webvirtmgr-git'
pkgdesc='Web front-end for KVM virtual machines'
pkgver=v4.8.8.r147.g64528fa
pkgrel=1
arch=('i686' 'x86_64')
url='https://www.webvirtmgr.net/'
license=('Apache')
depends=('libvirt' 'libvirt-python' 'qemu' 'dnsmasq' 'bridge-utils' 'ebtables' 'dmidecode' 'python2' 'supervisor'
         'websockify')
makedepends=('git' 'python2-pip')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=('git+https://github.com/retspen/webvirtmgr.git'
        'webvirtmgr.ini'
        'webvirtmgr-novnc.service')
sha512sums=('SKIP'
            'a8a64325750a1a6815c1ff9222373682f2300d0d636bb88675ae113b027a0e6d058e949344ae22357ff1258025ec0d32ca32a4383a37cadb88c9e5d180d2d147'
            '78ae3aef65e4c362a7d70ff3a44d1c3ccd489ed7b77311d0ecb4d795aa587dc75e43356f56e4afbb180e0558859b64cbe78ca45bb234920ff3302b01e59716db')
PKGEXT='.pkg.tar.gz'

pkgver() {
  cd 'webvirtmgr'
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  outputdir="${pkgdir}/usr/lib/webvirtmgr"
  install -Dm0644 'webvirtmgr.ini' "${pkgdir}/etc/supervisor.d/webvirtmgr.ini"
  install -Dm0644 'webvirtmgr-novnc.service' "${pkgdir}/usr/lib/systemd/system/webvirtmgr-novnc.service"
  install -dm0755 "${outputdir}" "${pkgdir}/var/lib/webvirtmgr"
  cp -r "${srcdir}/webvirtmgr" "${pkgdir}/usr/lib"
  rm -rf "${outputdir}/.git"

  cd "${outputdir}"
  pip2 install -r 'requirements.txt' -t "${outputdir}/lib"
}
