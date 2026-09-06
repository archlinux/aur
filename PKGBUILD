# Maintainer: Sandwich <sandwich@archworks.co>
#
# Platform-fidelity corrections and VFIO tuning for libvirt guests.
#
# Three packages:
#   vfio-native            scripts, patches, ACPI tables and the benchmark
#   vfio-native-kvm-dkms   the patched KVM modules, rebuilt by DKMS per kernel
#   vfio-native-qemu       QEMU 11.1.1 with the platform-identity patches, in /opt

pkgname=vfio-native
pkgver=1.3.0
pkgrel=1
pkgdesc="Present a libvirt guest as a self-consistent physical machine, and tune it"
arch=('any')
url="https://git.archworks.co/sandwich/vfio-native"
license=('GPL-2.0-only')
depends=('libvirt' 'qemu-base' 'python' 'openssh' 'bash' 'ethtool')
makedepends=('git')
optdepends=('mingw-w64-gcc: build the in-guest benchmark and the TIMER probe'
            'cpupower: set the host CPU governor'
            'vfio-native-kvm-dkms: patched KVM modules for the full level'
            'vfio-native-qemu: patched QEMU for the full level')
install=vfio-native.install
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 scripts/setup-vm.sh        "${pkgdir}/usr/bin/vm-native-setup"
    install -Dm755 scripts/verify-perf.sh     "${pkgdir}/usr/bin/vm-native-verify"
    install -Dm755 scripts/gpu-passthrough.sh "${pkgdir}/usr/bin/vm-native-gpu"
    install -Dm755 scripts/cpuid-passthrough.sh "${pkgdir}/usr/bin/vm-native-cpuid"

    local share="${pkgdir}/usr/share/vfio-native"
    install -Dm644 bench/vmbench.c    "${share}/bench/vmbench.c"
    install -Dm644 bench/timerprobe.c "${share}/bench/timerprobe.c"
    install -Dm755 scripts/install-modules.sh   "${share}/scripts/install-modules.sh"
    install -Dm755 scripts/restore-stock-kvm.sh "${share}/scripts/restore-stock-kvm.sh"
    install -Dm755 scripts/generate-tables.py   "${share}/scripts/generate-tables.py"
    install -Dm755 scripts/libvirt-hook-cpuid-passthrough.sh "${share}/scripts/libvirt-hook-cpuid-passthrough.sh"
    install -Dm755 scripts/cpuid-passthrough-watch          "${share}/scripts/cpuid-passthrough-watch"
    install -Dm644 -t "${share}/acpi" acpi/*.aml acpi/*.dsl
    install -dm755 "${share}/patches"
    cp -r patches/. "${share}/patches/"
    install -Dm644 -t "${share}/doc" README.md docs/*.md

    # libvirt runs every executable in qemu.d/ after the main qemu hook, so
    # this coexists with whatever hook the host already has.
    install -Dm755 scripts/libvirt-hook-cpu-isolation.sh \
        "${pkgdir}/etc/libvirt/hooks/qemu.d/10-cpu-isolation.sh"
    install -Dm755 scripts/libvirt-hook-vnet-offload.sh \
        "${pkgdir}/etc/libvirt/hooks/qemu.d/20-vnet-offload.sh"
}
