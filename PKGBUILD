# Maintainer : Raansu <Gero3977 "at" gmail {dot} com>
# Contributor : adytzu2007 <adybac "at" gmail {dot} com>
# Contributor : Shaumux <shaumya "at" gmail {dot} com>
# Contributor : Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
# Contributor : Willy Sudiarto Raharjo < willysr "at" slackware-id {dot} com>

pkgname=vmware-modules-dkms
_pkgbase=vmware-modules
pkgver=271.1
pkgrel=8
pkgdesc="VMware Workstation kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="http://www.vmware.com/"
license=('GPL2')
conflicts=('open-vm-tools-modules')

_vmware_location=/opt/vmware/lib/vmware/modules/source
_vmware_module_list="vmblock vmci vmmon vmnet vsock"

depends=('dkms')
makedepends=('linux')
optdepends=('linux-headers: needed to build the module')
options=('!buildflags')
install=${pkgname}.install
source=('modules.patch'
        '60-vmware.rules'
        'dkms.conf.in')
sha256sums=('0d74d3a8b5f9e02d1a1c7ae38cbe39597532c8dbcb42cf4ea9d8fb40d329a99b'
            '654a11be0b0a6f0f4f8fdc32f8a92542cec637e0f6c62dd7097d3cf679c06f4d'
            '09d440a0740ebd93da790b3f27de6b224825f6639b6a1066f86ae368d71cdb30')

build()
{
    # copy modules from vmware-workstation directory
    for mod in ${_vmware_module_list}; do
        tar -xf ${_vmware_location}/${mod}.tar -C ${srcdir}
    done

    cd ${srcdir}

    # apply patches
    patch -p1 < ${srcdir}/modules.patch

    # create dkms.conf
    sed -e "s/@PKGNAME@/$_pkgbase/; s/@PKGVER@/$pkgver/" < ${srcdir}/dkms.conf.in > ${srcdir}/dkms.conf
}

package()
{
    # make folder for dkms
    install -m755 -d ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    for mod in ${_vmware_module_list}; do
        cp -r ${srcdir}/${mod}-only ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/${mod}
    done

    install -D -m0644 ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    install -D -m0644 ${srcdir}/60-vmware.rules ${pkgdir}/etc/udev/rules.d/60-vmware.rules
}
