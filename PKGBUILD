# Maintainer : Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor : Raansu <Gero3977 "at" gmail {dot} com>
# Contributor : adytzu2007 <adybac "at" gmail {dot} com>
# Contributor : Shaumux <shaumya "at" gmail {dot} com>
# Contributor : Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
# Contributor : Willy Sudiarto Raharjo < willysr "at" slackware-id {dot} com>

# We should probably find something other than VMMON_VERSION to base pkgver on,
# as VMMON_VERSION doesn't seem to change much.

pkgname=vmware-modules-dkms
_pkgbase=vmware-modules
pkgver=308.0
pkgrel=10
pkgdesc="VMware Workstation kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="http://www.vmware.com/"
license=('GPL2')
conflicts=('open-vm-tools-modules')

_vmware_location=/lib/vmware/modules/source

depends=('dkms')
makedepends=('linux')
optdepends=('linux-headers: needed to build the module')
options=('!buildflags')
install=${pkgname}.install
source=('Makefile'
        '60-vmware.rules'
        'dkms.conf.in'
        'vmblock.patch'
        'vmci.patch'
        'vmmon.patch'
        'vmnet.patch'
        'vsock.patch'
        'NOTES')
sha256sums=('9041b85cea2e2c35b27629d47bee2e37b913635e5ace54a46fd9c45f90c4f1d4'
            '7baecdfd979d57aed7dac0db57e0165fc1730b15ed6bf42ed25571e68ec34b52'
            '707596776b0b232f7f5de4a0ddff12262df3bc934180afd956ea2ee45ac4db9e'
            'b81a2c26a6af145a934118a0d19d22ff7a73464dfa849d24ba0dd785f119ae7e'
            '84ddf2d77039ca558466682a23280ecbb0ec4b6bf9a5b4561f161c78e32b57a1'
            '663dbccace714d719e3d27337fc5acabded61dbe5889af7c3bd28e0fbcef115e'
            '31c626d7686f9d8d50b3ab09ada45f6bdcaf97c47f62de3ff2494c99b19f90d0'
            '50bf86f3306fbdafa0a5d5947fb64c06e2a236be84e2ba3f7057f84cc49f7828'
            'SKIP')

build()
{
    cd ${srcdir}

    # create dkms.conf
    sed -e "s/@PKGNAME@/$_pkgbase/; s/@PKGVER@/$pkgver/" < ${srcdir}/dkms.conf.in > ${srcdir}/dkms.conf
}

package()
{
    # make folder for dkms
    install -m755 -d ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

    install -D -m0644 ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    install -D -m0644 ${srcdir}/Makefile ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile
    install -D -m0644 ${srcdir}/vmblock.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vmblock.patch
    install -D -m0644 ${srcdir}/vmci.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vmci.patch
    install -D -m0644 ${srcdir}/vmmon.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vmmon.patch
    install -D -m0644 ${srcdir}/vmnet.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vmnet.patch
    install -D -m0644 ${srcdir}/vsock.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vsock.patch

    install -D -m0644 ${srcdir}/60-vmware.rules ${pkgdir}/etc/udev/rules.d/60-vmware.rules
}
