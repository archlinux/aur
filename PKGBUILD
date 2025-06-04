# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=openbuilds-control-bin
pkgver=1.0.390
pkgrel=1
pkgdesc="Grbl Host / Interface for all CNC style machines running Grbl"
url="https://github.com/OpenBuilds/OpenBuilds-CONTROL"
license=(GPL-3.0-only)
arch=(x86_64)
provides=(openbuilds-control)
conflicts=(openbuilds-control)
_electron=electron23
depends=(
    $_electron dbus libxdamage nss at-spi2-core cairo alsa-lib libdrm gtk3
    libxcomposite expat libx11 glib2 libxfixes libcups libxrandr pango nspr
    python libxcb mesa libxext libxkbcommon hicolor-icon-theme
)
source=("$url/releases/download/v$pkgver/OpenBuildsCONTROL_${pkgver}_amd64.deb")
sha512sums=('b729b40e34a85353d2805a819184bf4e95b44e0742665bd794ace30c77f6f6769f932b8ce039fc4ea029d7299b195cd461318944228130f64783139754d888c0')
prepare() {
    cd $srcdir
    tar -pxf data.tar.xz
    sed -i 's|Exec=.*|Exec=/usr/bin/openbuildscontrol %U|' usr/share/applications/openbuildscontrol.desktop
    sed -i 's/OpenBuildsCONTROL/OpenBuilds CONTROL/' usr/share/applications/openbuildscontrol.desktop
}

package() {
    cd $srcdir
    cp -ar "usr" "$pkgdir/"
    install -Dm644 "opt/OpenBuildsCONTROL/resources/app.asar" -t "$pkgdir/usr/lib/openbuilds-control/"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/openbuildscontrol" <<EOF
#!/usr/bin/sh
exec $_electron /usr/lib/openbuilds-control/app.asar "\$@"
EOF
}
