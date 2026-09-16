# Maintainer: Integral <integral@member.fsf.org>

pkgname=maxhub-exceedshare-bin
_pkgname=exceedshare
pkgver=5.10.45.0
pkgrel=5
pkgdesc="MAXHUB 传屏助手 - Wireless screen sharing software (binary release)"
arch=('x86_64')
url="https://www.maxhub.com"
license=('custom: commercial')
depends=(
    'glibc'
    'gcc-libs'
    'libx11'
    'libxcb'
    'libxau'
    'libxdmcp'
    'libgl'
    'libpulse'
    'zlib'
    'libice'
    'libsm'
    'libgpg-error'
    'util-linux-libs'
)
makedepends=('qt5-base')
optdepends=(
    'kmod: for kernel module loading (snd-dummy, uinput)'
    'systemd: for udev rules and systemd user service'
)
provides=('exceedshare')
conflicts=('exceedshare')
options=('!strip')
install="${pkgname}.install"
source=("https://github.com/panmingjun/maxhub-exceedshare/releases/download/${pkgver}/com.cvte.exceedshare_${pkgver}_amd64.deb")
sha256sums=('85ef50fbc2056b13431fcd4cd8e76d136a2918fc8b8695a5d40a2254ba5afe44')

package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}/"

    cp -L /usr/lib/libQt5Concurrent.so.5 \
        "${pkgdir}/opt/apps/com.cvte.exceedshare/files/lib/libQt5Concurrent.so.5"

    chmod -R 755 "${pkgdir}/opt/"

    install -d "${pkgdir}/usr/lib/udev/rules.d" "${pkgdir}/usr/lib/modules-load.d"
    mv "${pkgdir}/etc/udev/rules.d/"*.rules "${pkgdir}/usr/lib/udev/rules.d/"
    mv "${pkgdir}/etc/modules-load.d/"*.conf "${pkgdir}/usr/lib/modules-load.d/"
    rmdir -p "${pkgdir}/etc/udev/rules.d" "${pkgdir}/etc/modules-load.d" 2>/dev/null || true

    find "${pkgdir}/usr" -type f -exec chmod 644 {} +

    install -d "${pkgdir}/usr/lib/maxhub-exceedshare"
    cat > "${pkgdir}/usr/lib/maxhub-exceedshare/uwst-service" <<'EOF'
#!/bin/sh
if [ -z "${XDG_SESSION_TYPE}" ]; then
    if [ -n "${WAYLAND_DISPLAY}" ]; then
        XDG_SESSION_TYPE=wayland
    elif [ -n "${DISPLAY}" ]; then
        XDG_SESSION_TYPE=x11
    else
        XDG_SESSION_TYPE=x11
    fi
    export XDG_SESSION_TYPE
fi
exec /opt/apps/com.cvte.exceedshare/files/bin/UWSTService
EOF
    chmod 755 "${pkgdir}/usr/lib/maxhub-exceedshare/uwst-service"

    install -d "${pkgdir}/usr/lib/systemd/user/com.cvte.exceedshare.service.d"
    cat > "${pkgdir}/usr/lib/systemd/user/com.cvte.exceedshare.service.d/10-session-type.conf" <<'EOF'
[Service]
ExecStart=
ExecStart=/usr/lib/maxhub-exceedshare/uwst-service
EOF
}
