# Maintainer: Sandwich <sandwich@archworks.co>
#
# KVM modules patched for architectural conformance, built by DKMS against
# whichever 7.2.x kernels are installed. Three VMAware checks stop firing as a
# direct consequence, because the fix is to raise the exception the
# architecture specifies:
#
#   SVM_EXCEPTIONS    a CPL>0 SVM instruction must raise #UD, not #GP
#   KVM_INTERCEPTION  a CPL>0 VMCALL/hypercall must raise #UD, not #GP or nothing
#   DBVM              an ICEBP #DB must report the RIP after the instruction
#
# The experimental CPUID-passthrough patch is built in as well but is OFF by
# default (module parameter cpuid_passthrough). It clears the last software
# check, TIMER, on a 1:1-pinned guest; vm-native-setup prints how to enable it.
#
# KVM is in-tree, so the DKMS tree carries arch/x86/kvm and virt/kvm from the
# vanilla kernel of the same version and builds them against the installed
# headers; the two Makefile paths that assume an in-tree build are redirected.
# The KVM sources do not differ between the Arch flavours of one version (the
# module srcversion is identical on linux and linux-cachyos-bore 7.2.3), so one
# source tree serves all of them.
#
# THE PIN: the sources are 7.2.3's. They build against any 7.2.x headers and
# are refused for anything else, so after a kernel upgrade past 7.2 the stock
# modules load silently and the three checks come back. Bump _kver here.

pkgname=vfio-native-kvm-dkms
_pkgbase=vfio-native-kvm
_kver=7.2.3
_tag=1.1.0
pkgver=${_kver}
pkgrel=1
pkgdesc="KVM modules patched to raise the exceptions the architecture specifies (DKMS, 7.2.x kernels)"
arch=('x86_64')
url="https://git.archworks.co/sandwich/vfio-native"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
optdepends=('vfio-native: the setup and verification tooling')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=("git+${url}.git#tag=v${_tag}"
        "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kver}.tar.xz"
        'dkms.conf'
        'dkms-out-of-tree.patch'
        'kvm-native.hook')
noextract=("linux-${_kver}.tar.xz")
sha256sums=('SKIP'
            '8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    tar -xf "linux-${_kver}.tar.xz" --wildcards \
        "linux-${_kver}/arch/x86/kvm/*" "linux-${_kver}/virt/kvm/*"
    cd "linux-${_kver}"
    for p in "${srcdir}"/vfio-native/patches/kvm/000[1234]-KVM-*.patch \
             "${srcdir}"/vfio-native/patches/kvm/EXPERIMENTAL-0006-*.patch; do
        msg2 "applying ${p##*/}"
        patch -Np1 -i "$p"
    done
    patch -Np1 -i "${srcdir}/dkms-out-of-tree.patch"
}

package() {
    local dest="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    install -dm755 "${dest}/arch/x86" "${dest}/virt"
    cp -r "linux-${_kver}/arch/x86/kvm" "${dest}/arch/x86/"
    cp -r "linux-${_kver}/virt/kvm"     "${dest}/virt/"
    sed "s/@PKGVER@/${pkgver}/" dkms.conf > "${dest}/dkms.conf"
    install -Dm644 kvm-native.hook "${pkgdir}/usr/share/libalpm/hooks/90-vfio-native-kvm.hook"
}
