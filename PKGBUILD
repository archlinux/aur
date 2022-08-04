# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=system76-io-dkms-git
pkgver=1.0.2.r0.g0217576
pkgrel=1
pkgdesc="DKMS module for controlling System76 Io board"
arch=('x86_64')
url="https://github.com/pop-os/system76-io-dkms"
license=('GPL3')
depends=('dkms')
conflicts=(system76-io-dkms)
provides=(system76-io-dkms)
source=("${pkgname}::git+https://github.com/pop-os/system76-io-dkms")
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

    # Edit and install dkms configuration
    sed "s/#MODULE_VERSION#/${pkgver}/" "debian/system76-io-dkms.dkms" > "${install_dir}/dkms.conf"

    # Load the module at boot
    install -Dm644 "usr/share/initramfs-tools/modules.d/${pkgname%%-git}.conf" \
        "${pkgdir}/usr/lib/modules-load.d/system76-io.conf"
}
