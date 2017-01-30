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
pkgrel=13
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
sha256sums=('493ff26082307ff58f19b391c5a72625d7071ad12fed9232f0f2e2d4339c3a45'
            '7baecdfd979d57aed7dac0db57e0165fc1730b15ed6bf42ed25571e68ec34b52'
            '489ab58c7bc605588271f41e563c4e97ea65798fbc4ab7ec5b2135c79df5de1a'
            'b81a2c26a6af145a934118a0d19d22ff7a73464dfa849d24ba0dd785f119ae7e'
            'f24586ccb45106322bcff9dff92ef2caf9f32c73f2ec1c67f178c7ee2559ac0e'
            '270493aac68667a78e3aab54316a4548d15e610c19c5791f7b6cc2e7483be6da'
            '43619d79462df490c275b41865089450e8c7682dc4d0df465a1c2fe380aa05af'
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
