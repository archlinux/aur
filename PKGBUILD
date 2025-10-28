# Maintainer: Vincent Långström <vincent dot langstrom at gmail dot com>
# Contributor: Albert Sebastian <albertsebe2 at gmail dot com>

pkgname=furmark
pkgver=2.10.2
pkgrel=1
pkgdesc='Lightweight but intensive GPU stress test and benchmarking tool for OpenGL and Vulkan'
arch=('x86_64' 'aarch64')
url='https://www.geeks3d.com/furmark/v2/'
license=('custom:freeware')
depends=(gcc-libs opengl-driver glu libxcb)
optdepends=('vulkan-driver: Vulkan benchmark support')
makedepends=('7zip')
source=('furmark-gui.desktop' 'https://geeks3d.com/furmark/i/20240220-furmark-logo-02.png')
source_x86_64=("https://gpumagick.com/downloads/files/2025/fm2/2_10_dbc69dd0a08da5ff09169a4fc759ddaa/FurMark_${pkgver}_linux64.7z")
# For some reason, the arm64 version is again stuck at a lower version than the rest (2.10.1)
source_aarch64=("https://gpumagick.com/downloads/files/2025/fm2/2_10_dbc69dd0a08da5ff09169a4fc759ddaa/FurMark_2.10.1_arm64.7z")
sha256sums=('SKIP' '12A8564204C4985FF601CA83C601ADAF69B948C62EA76F213C4848EACB05C3B8')
sha256sums_x86_64=('B3D0048FDAFB90184F18F537EB91E0C52F6D132AE6ED48CBB68C43DB5A42AEDB')
sha256sums_aarch64=('5D0B8AE948193A3C2AA443641D562CA221BDCF26406CD8D1FBAE618FD76F018F')

package(){
    install -d "$pkgdir/opt/$pkgname/"
    cp -a "$srcdir/FurMark_linux64/." "$pkgdir/opt/$pkgname/"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/furmark" "$pkgdir/usr/bin/furmark"
    ln -s "/opt/$pkgname/FurMark_GUI" "$pkgdir/usr/bin/furmark-gui"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"


    # Create config directory
    install -dm757 "$pkgdir/etc/opt/$pkgname"

    # Copy config files into writeable directory
    cp "$pkgdir/opt/$pkgname/settings.lua"  "$pkgdir/etc/opt/$pkgname/settings.lua"
    cp "$pkgdir/opt/$pkgname/conf.xml"      "$pkgdir/etc/opt/$pkgname/conf.xml"
    # Delete original defaults
    rm "$pkgdir/opt/$pkgname/settings.lua"
    rm "$pkgdir/opt/$pkgname/conf.xml"
    # Set permissions
    chmod 646 "$pkgdir/etc/opt/$pkgname/settings.lua"
    chmod 646 "$pkgdir/etc/opt/$pkgname/conf.xml"

    # Create log directory
    install -dm757 "$pkgdir/var/log/$pkgname"

    ln -s "/var/log/$pkgname/furmark.log"   "$pkgdir/opt/$pkgname/_furmark_log.txt"
    ln -s "/var/log/$pkgname/geexlab.log"   "$pkgdir/opt/$pkgname/_geexlab_log.txt"
    ln -s "/etc/opt/$pkgname/settings.lua"  "$pkgdir/opt/$pkgname/settings.lua"
    ln -s "/etc/opt/$pkgname/conf.xml"      "$pkgdir/opt/$pkgname/conf.xml"

    # touch imgui.ini # idk what this is, probably not needed

    # Install icon
    install -Dm644 "$srcdir/20240220-furmark-logo-02.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    # Install desktop entry (uses the icon)
    # We could use gendesk to generate the desktop entry,
    # but that requires it as an additional build dependency...
    # (see https://wiki.archlinux.org/title/Desktop_entries)
    # gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec "furmark-gui" --categories "Graphics" --name "FurMark GUI"
    install -Dm644 "$srcdir/furmark-gui.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# Save config files if modified by the user
backup=("etc/opt/$pkgname/settings.lua" "etc/opt/$pkgname/conf.xml")
