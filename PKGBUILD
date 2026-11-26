# Maintainer: Albert Sebastian <albertsebe2 at gmail dot com>
# Contributor: Vincent Långström <vincent dot langstrom at gmail dot com>

pkgname=furmark
pkgver=2.11.0.4
pkgrel=1
pkgdesc='Lightweight but intensive GPU stress test and benchmarking tool for OpenGL and Vulkan'
arch=('x86_64' 'aarch64')
url='https://www.geeks3d.com/furmark/v2/'
license=('custom:freeware')
depends=(gcc-libs opengl-driver glu libxcb)
optdepends=('vulkan-driver: Vulkan benchmark support')
makedepends=('7zip')
source=('furmark-gui.desktop' 'https://geeks3d.com/furmark/i/20240220-furmark-logo-02.png')
source_x86_64=("https://gpumagick.com/downloads/files/2026/fm2/FurMark_${pkgver}_linux64.7z")
source_aarch64=("https://gpumagick.com/downloads/files/2026/fm2/FurMark_${pkgver}_arm64.7z")
sha256sums=('5debb3a66411da54f1ab12b5ceb36d10698312f2d401541c63c647be786ef3f8'
            '12a8564204c4985ff601ca83c601adaf69b948c62ea76f213c4848eacb05c3b8')
sha256sums_x86_64=('265e6e3b06e5cb1311f3f1eeb942d347d261c809acbf4d9c5b84e8ed470a1cac')
sha256sums_aarch64=('1e1c713475d094d1d7baf6988ac2afe15862bf4bbbc2de8f6f3744535f37dd6a')

package(){
    install -d "$pkgdir/opt/$pkgname/"

    case "$CARCH" in
        x86_64)
            _extract_dir="FurMark_linux64"
            ;;
        aarch64)
            _extract_dir="FurMark_arm64"
            ;;
    esac
    cp -a "$srcdir/$_extract_dir/." "$pkgdir/opt/$pkgname/"

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
