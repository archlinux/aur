# Maintainer: Zachary Hill <zer0t3ch97@gmail.com>

pkgname='webvirtmgr-git'
pkgdesc='Web front-end for KVM virtual machines'
pkgver=v4.8.9.r22.g79c8a8b
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
        'webvirtmgr-novnc.service'
        'webvirtmgr.nginx.conf.sample')
sha512sums=('SKIP'
            '09469b807ab79177220f62316c2cbb7da72b4577f17c5a104d106a2392090753422740dc9dfb4f952e2d40e74ca7209ece911f7993dae0720659239d25c28d01'
            '9c7398213e13f7568bac5dbe996ee4ad0608d851612b2664d923cd82b109bcd4ae93ac7419e031c53f919c440f1fb5beaa7142e684007452f3950bfd0a812499'
            'a81460d838ccefadbd3758fff492b6048c48dfd8d66be4494d91af5ebe8a0ab64627abac4ab83a3dfa541223120159cb79afee642fcf72f91f688729de6bff27')

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

  install -dm0755 "${pkgdir}/etc/nginx/conf.d"
  install -Dm0644 "${srcdir}/webvirtmgr.nginx.conf.sample" "${pkgdir}/etc/nginx/conf.d/webvirtmgr.nginx.conf.sample"
}
