# Maintainer: itlxrd <ilyakm@icloud.com>
pkgname=psysonic-bin-rc
pkgver=1.44.0.rc.4
pkgrel=1
pkgdesc="Desktop music player for Subsonic API-compatible servers - release candidate (pre-built binary)"
arch=('x86_64')
url="https://github.com/Psychotoxical/psysonic"
license=('GPL-3.0-only')
provides=('psysonic')
conflicts=('psysonic' 'psysonic-bin')
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
source=("https://github.com/Psychotoxical/psysonic/releases/download/app-v${pkgver//.rc./-rc.}/Psysonic_${pkgver//.rc./-rc.}_amd64.deb")
sha256sums=('cfc490efc90d3b1ae05a0c12ad0b3c40481beca03de6f7a3b61d027964dbb4df')
package() {
    mkdir -p "${srcdir}/data"
    bsdtar -xf data.tar.* -C "${srcdir}/data"
    cp -dr --no-preserve=ownership "${srcdir}/data/usr" "${pkgdir}/"
    mv "${pkgdir}/usr/bin/psysonic" "${pkgdir}/usr/bin/psysonic-bin-rc"
    cat <<EOF > "${pkgdir}/usr/bin/psysonic"
#!/bin/sh
exec /usr/bin/psysonic-bin-rc "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/psysonic"
    local df=$(find "${pkgdir}/usr/share/applications" -name "*.desktop")
    if [ -f "$df" ]; then
        sed -i 's|^Exec=.*|Exec=psysonic %U|' "$df"
    fi
}
