# Maintainer: Sandwich <sandwich@archworks.co>
#
# KVM modules patched for architectural conformance, built by DKMS against
# every installed kernel of _kver's release. Three VMAware checks stop firing
# as a direct consequence, because the fix is to raise the exception the
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
# module srcversion is identical on linux and linux-cachyos-bore 7.2.3 and
# 7.2.9), so one source tree serves all of them.
#
# THE PIN: the sources are one stable release's and DKMS refuses every other.
# Stable updates change KVM too: 7.2.9 moved declarations out of the installed
# headers into arch/x86/kvm, so 7.2.3's tree stopped compiling, and 7.2.10
# changes svm.c and x86.c without touching a header, so 7.2.9's tree would
# build there and silently drop those fixes. After any kernel upgrade the stock
# modules load silently and the three checks come back. Bump _kver here.

pkgname=vfio-native-kvm-dkms
_pkgbase=vfio-native-kvm
_kver=7.2.9
_tag=1.4.3
pkgver=${_kver}
pkgrel=1
pkgdesc="KVM modules patched to raise the exceptions the architecture specifies (DKMS, ${_kver} kernels)"
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
            'b4c5dfbe51a364a6c7f03869200f88c8e1f77403539005f14b7fc6bc91b8d8ba'
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
    install -dm755 "${pkgdir}/usr/share/libalpm/hooks"
    sed "s/@PKGVER@/${pkgver}/g" kvm-native.hook > "${pkgdir}/usr/share/libalpm/hooks/90-vfio-native-kvm.hook"
}
