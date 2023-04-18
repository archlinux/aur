# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=system76-acpi-dkms-git
pkgver=1.0.2.r10.ged01124
pkgrel=1
pkgdesc="This provides the system76_acpi in-tree driver for systems missing it."
arch=('x86_64')
url='https://github.com/pop-os/system76-acpi-dkms'
license=('GPL')
conflicts=('system76-acpi-dkms')
provides=('system76-acpi-dkms')
depends=('dkms')
makedepends=('git')
source=("${pkgname}::git+https://github.com/pop-os/system76-acpi-dkms.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
    cd "${srcdir}/${pkgname}"

    # Installation directory
    local install_dir="${pkgdir}/usr/src/${pkgname%%-git}-${pkgver}"

    # Install source files
    for file in {Makefile,*.c,*.h}; do
        [ -f "$file" ] || continue
        install -D -m644 -t "${install_dir}/" "${file}"
    done

	# Install udev hwdb files
	install -Dm644 -t "${pkgdir}/usr/lib/udev/hwdb.d/" lib/udev/hwdb.d/*

    # Edit and install dkms configuration
    sed "s/#MODULE_VERSION#/${pkgver}/" "debian/system76-acpi-dkms.dkms" > "${install_dir}/dkms.conf"

    # Load the module at boot
    install -Dm644 "usr/share/initramfs-tools/modules.d/${pkgname%%-git}.conf" \
        "${pkgdir}/usr/lib/modules-load.d/system76-acpi.conf"
}
