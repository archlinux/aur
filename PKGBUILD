# Maintainer: Diramix <39developer@diram1x.ru>

pkgname=pulsesync
pkgver=2.10.2
pkgrel=1
pkgdesc="PulseSync integrates with Yandex Music and supports Discord RPC, themes and scripts."
arch=('x86_64')
url="https://pulsesync.dev/"
license=('https://github.com/PulseSync-LLC/PulseSync-client/blob/main/LICENSE')

depends=(
    'glibc'
    'gtk3'
    'alsa-lib'
)

provides=('pulsesync')
conflicts=('pulsesync')

source=(
    "https://s3.pulsesync.dev/builds/app/beta/pulsesync-app-${pkgver}-beta-amd64.deb"
)

sha256sums=('SKIP')

package() {
    cd "${srcdir}"

    bsdtar -xf "pulsesync-app-${pkgver}-beta-amd64.deb"
    bsdtar -xf data.tar.*

    [[ -d usr ]] && cp -a usr "${pkgdir}/"
    [[ -d opt ]] && cp -a opt "${pkgdir}/"

    # --- Выдаём права всем пользователям ---

    # PulseSync
    if [[ -d "${pkgdir}/opt/PulseSync" ]]; then
        find "${pkgdir}/opt/PulseSync" -type d -exec chmod 755 {} \;
        find "${pkgdir}/opt/PulseSync" -type f -exec chmod 755 {} \;
    fi

    # Яндекс Музыка (путь с пробелом)
    if [[ -d "${pkgdir}/opt/Яндекс Музыка" ]]; then
        find "${pkgdir}/opt/Яндекс Музыка" -type d -exec chmod 755 {} \;
        find "${pkgdir}/opt/Яндекс Музыка" -type f -exec chmod 755 {} \;
    fi

    # Launcher
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/pulsesync" << 'EOF'
#!/bin/bash
exec "/opt/PulseSync/pulsesync" "$@"
EOF
}
