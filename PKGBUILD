# Maintainer: Pyrotiger <65628850+pyrotiger@users.noreply.github.com>

pkgbase=x3d-toggle
pkgname=('x3d-toggle' 'x3d-toggle-gui')
pkgver=2.0.0
pkgrel=1
arch=('x86_64')
url="https://github.com/X3D-Toggle/x3d-toggle-main"
license=('GPL-3.0-or-later')
makedepends=(
    'clang'
    'llvm'
    'make'
    'bpf'
    'libbpf'
    'pkgconf'
    'glib2-devel'
    'gtk4'
    'libadwaita'
)
# Do not strip bpf.o or the custom -nostdlib binaries
options=('!strip' '!lto')

source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ee1163b87e35f91b4d3f1481b6b5ea0bf8b4c32f9c681426bf882a3aed695b55')

build() {
    cd "${srcdir}/x3d-toggle-main-${pkgver}"

    # The core CLI/daemon/eBPF targets use -nostdlib and custom syscall wrappers;
    # clear makepkg's fortified/stack-protector flags for the core make build.
    # Run framework generation before parallel build so build/vmlinux.h exists first.
    mkdir -p bin build
    env -u CFLAGS -u CPPFLAGS -u LDFLAGS make framework
    env -u CFLAGS -u CPPFLAGS -u LDFLAGS make build SKIP_FRAMEWORK=1

    # Build the GTK4/libadwaita frontend (bin/x3d-gui)
    X3D_EXEC=1 sh ./scripts/framework/gui.sh
}

package_x3d-toggle() {
    pkgdesc="AMD Ryzen X3D V-Cache CCD priority optimizer daemon and CLI (POSIX C / eBPF)"
    depends=(
        'glibc'
        'libbpf'
        'systemd-libs'
    )
    optdepends=(
        'x3d-toggle-gui: GTK4/libadwaita desktop dashboard'
        'polkit: Passwordless x3d-toggle group service control'
        'ethtool: NIC IRQ coalescing tuning'
        'gzip: Diagnostic session log archiving'
    )
    backup=(
        'etc/x3d-toggle.d/settings.conf'
        'etc/x3d-toggle.d/games.conf'
        'etc/x3d-toggle.d/irq.conf'
        'etc/x3d-toggle.d/networking.conf'
        'etc/x3d-toggle.d/advanced.conf'
        'etc/x3d-toggle.d/daemon.conf'
    )
    install="x3d-toggle.install"

    cd "${srcdir}/x3d-toggle-main-${pkgver}"

    env -u CFLAGS -u CPPFLAGS -u LDFLAGS make DESTDIR="${pkgdir}" USR="/usr" install

    # Desktop entry and icons belong to x3d-toggle-gui
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps" "${pkgdir}/usr/share/icons"

    # Remove build-directory path reference so $srcdir is not embedded in the package
    rm -f "${pkgdir}/etc/x3d-toggle.d/source_root"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_x3d-toggle-gui() {
    pkgdesc="GTK4/libadwaita desktop dashboard for X3D Toggle"
    depends=(
        "x3d-toggle=${pkgver}-${pkgrel}"
        'gtk4'
        'libadwaita'
    )
    optdepends=(
        'lact: AMD GPU clocks, voltages, power limits, and fan curves'
        'corectrl: Application-specific AMD GPU performance profiles'
    )

    cd "${srcdir}/x3d-toggle-main-${pkgver}"

    install -Dm755 bin/x3d-gui "${pkgdir}/usr/bin/x3d-gui"
    install -Dm644 packaging/x3d-toggle.desktop "${pkgdir}/usr/share/applications/x3d-toggle.desktop"
    install -Dm644 assets/x3d-toggle.jpg "${pkgdir}/usr/share/pixmaps/x3d-toggle.jpg"
    install -Dm644 assets/x3d-toggle.png "${pkgdir}/usr/share/pixmaps/x3d-toggle.png"
    install -Dm644 assets/x3d-toggle.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/x3d-toggle.svg"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
