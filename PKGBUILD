# Maintainer: zhenxin <qgzhenxin@qq.com>
pkgname=crossdesk-bin
_pkgname=crossdesk
pkgver=1.1.11
_tag_date=20251128
_tag_hash=feb9f2f
pkgrel=1
pkgdesc="A lightweight, cross-platform remote desktop software (Binary Release)"
arch=('x86_64')
url="https://github.com/kunkundi/crossdesk"
license=('LGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=(
    'gtk3' 'libx11' 'libxcb' 'libxv' 'libxtst' 
    'alsa-lib' 'sndio' 'libpulse' 
    'glibc' 'gcc-libs' 'hicolor-icon-theme'
)
optdepends=('cuda: Hardware encoding/decoding support (NVIDIA)')
makedepends=('binutils')

_full_tag="v${pkgver}-${_tag_date}-${_tag_hash}"
_deb_filename="crossdesk-linux-amd64-${_full_tag}.deb"
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/${_full_tag}/${_deb_filename}")
sha256sums=('99932416ffa9566976c1b4673bb4529ddf5c1e818ce715674b3a57455d1ee457')

package() {
    msg2 "Extracting Debian package..."
    ar x "${srcdir}/${_pkgname}-${pkgver}.deb"

    if [ -f data.tar.zst ]; then
        tar -xf data.tar.zst -C "${pkgdir}"
    elif [ -f data.tar.xz ]; then
        tar -xf data.tar.xz -C "${pkgdir}"
    elif [ -f data.tar.gz ]; then
        tar -xf data.tar.gz -C "${pkgdir}"
    fi

    mkdir -p "${pkgdir}/opt/crossdesk"

    if [ -f "${pkgdir}/usr/bin/crossdesk" ]; then
        msg2 "Moving binary to /opt/crossdesk..."
        mv "${pkgdir}/usr/bin/crossdesk" "${pkgdir}/opt/crossdesk/crossdesk"
        chmod 755 "${pkgdir}/opt/crossdesk/crossdesk"
    else
        error "Could not find original binary in usr/bin/crossdesk!"
        return 1
    fi

    msg2 "Creating wrapper script..."
    cat > "${pkgdir}/usr/bin/crossdesk" <<EOF
#!/bin/bash
# CrossDesk Wrapper for Arch Linux

CERT_SRC="/opt/crossdesk/certs/crossdesk.cn_root.crt"
USER_CERT_DIR="\$HOME/.config/CrossDesk/certs"
USER_CERT_FILE="\$USER_CERT_DIR/crossdesk.cn_root.crt"

if [ ! -f "\$USER_CERT_FILE" ]; then
    if [ -f "\$CERT_SRC" ]; then
        mkdir -p "\$USER_CERT_DIR"
        cp "\$CERT_SRC" "\$USER_CERT_FILE"
    fi
fi

exec /opt/crossdesk/crossdesk "\$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/crossdesk"

    if [ -f "${pkgdir}/usr/share/applications/crossdesk.desktop" ]; then
        sed -i 's|Exec=.*|Exec=/usr/bin/crossdesk %U|' "${pkgdir}/usr/share/applications/crossdesk.desktop"
    fi
}
