# Maintainer: taotieren <admin@taotieren.com>

pkgname=loongson-debugger-bin
pkgver=20250621
pkgrel=1
epoch=
pkgdesc="loongson-debugger contains binary debugging tools and supporting documentation."
arch=('x86_64')
url="https://gitee.com/Zhou---wei/ctcisz"
license=('MIT')
groups=()
depends=(
    sh
    glibc
    perl
)
makedepends=(libarchive)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !debug)
install=$pkgname.install
changelog=
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.tar.xz"
    "$pkgname.install"
)
noextract=(${pkgname%-bin}-${pkgver}.tar.xz)
sha256sums=('328e50a8af4e23e344c7109019785b91e73767c7f2864d05dfd00605be0cb1e9'
            'c8c9181558e763bcb1a6451da90f9650737702c462d6ba60c25db7bee856113f')
#validpgpkeys=()

package() {
    install -vdm755 "${pkgdir}/opt/${pkgname%-debugger-bin}/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.xz" --no-same-owner --no-same-permissions --strip-components=1 -C "${pkgdir}/opt/${pkgname%-debugger-bin}/${pkgname%-bin}"

    install -vDm644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.csh" <<EOF
setenv PATH "\${PATH}:/opt/${pkgname%-debugger-bin}/${pkgname%-bin}"
EOF
    install -vDm644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/bash
# /etc/profile.d/${pkgname%-bin}.sh
# Add ${pkgname%-bin} to PATH

if [[ ":\$PATH:" != *":/opt/${pkgname%-debugger-bin}/${pkgname%-bin}:"* ]]; then
    export PATH="\$PATH:/opt/${pkgname%-debugger-bin}/${pkgname%-bin}"
fi
EOF

    install -vDm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/60-${pkgname%-bin}.rules" << 'EOF'
# Loongson Debugger USB Device Rules
# Vendor ID: 2961 (Loongson)
# Product ID: 6688 (Debugger)

# Grant access to USB device
SUBSYSTEM=="usb", ATTRS{idVendor}=="2961", ATTRS{idProduct}=="6688", TAG+="uaccess", MODE="0666"

# Grant access to serial port device
SUBSYSTEM=="tty", ATTRS{idVendor}=="2961", ATTRS{idProduct}=="6688", TAG+="uaccess", MODE="0666"

# Symbolic link for easy access
SUBSYSTEM=="usb", ATTRS{idVendor}=="2961", ATTRS{idProduct}=="6688", SYMLINK+="loongson-debugger-%d"

EOF
}
