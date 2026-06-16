# Maintainer: itlxrd
pkgname=psysonic-bin
pkgver=1.48.0
pkgrel=1
pkgdesc="Desktop music player for Subsonic API-compatible servers (pre-built binary)"
arch=('x86_64')
url="https://github.com/Psychotoxical/psysonic"
license=('GPL-3.0-only')
provides=('psysonic')
conflicts=('psysonic')
options=('!debug')
depends=(
    'alsa-lib'
    'gtk3'
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
    'nss'
    'at-spi2-core'
    'libxtst'
    'xorg-xwayland'
)
source=("https://github.com/Psychotoxical/psysonic/releases/download/app-v${pkgver}/Psysonic_${pkgver}_amd64.deb")
sha256sums=('8c50f9967f7fe66d99363cbe3e2b177e80178b720b13f526b6d3971c697ae0c7')

package() {
    mkdir -p "${srcdir}/data"
    bsdtar -xf data.tar.* -C "${srcdir}/data"
    cp -dr --no-preserve=ownership "${srcdir}/data/usr" "${pkgdir}/"
    mv "${pkgdir}/usr/bin/psysonic" "${pkgdir}/usr/bin/psysonic-bin"
    cat <<EOF > "${pkgdir}/usr/bin/psysonic"
#!/bin/sh
exec /usr/bin/psysonic-bin "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/psysonic"
    local df=$(find "${pkgdir}/usr/share/applications" -name "*.desktop")
    if [ -f "$df" ]; then
        sed -i 's|^Exec=.*|Exec=psysonic %U|' "$df"
        sed -i 's/^StartupWMClass=.*/StartupWMClass=psysonic-bin/' "$df"
    fi
}
