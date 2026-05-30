# Author:         David Rosca <nowrep@gmail.com>
# Maintainer:  Martin Stibor <martin.von.reichenberg@gmail.com>

pkgname=dualsensectl-git
pkgver=0.7.r10.d3ae2fa
pkgrel=1
pkgdesc='Tool for controlling SONY PlayStation DualSense gamepad on Linux'
arch=('x86_64' 'aarch64' 'riscv64' 'loong64')
url='https://github.com/nowrep/dualsensectl'
license=('GPL-2.0-only')
depends=('dbus' 'hidapi' 'libusb')
makedepends=('git' 'gcc' 'meson')
provides=('dualsensectl')
conflicts=('dualsensectl')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    arch-meson build
    meson compile -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    meson install -C build --destdir "${pkgdir}"

    install -Dm644 "${srcdir}/${pkgname}/completion/dualsensectl" \
                -t            "${pkgdir}/usr/share/bash-completion/completions/"

    install -Dm644 "${srcdir}/${pkgname}/completion/_dualsensectl" \
                -t            "${pkgdir}/usr/share/zsh/site-functions/"
}
