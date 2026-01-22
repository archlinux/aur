# Maintainer: ChinaNuke <chinanuke@nuke666.cn>

pkgname=zhixin
pkgver=3.3.6.0
pkgrel=1
pkgdesc="致信 (ZhiXin) - Enterprise instant messaging client"
arch=('x86_64')
url="https://www.zhixin.com"
license=('LicenseRef-Proprietary')
depends=(
    'gtk2'
    'gconf'
    'nss'
    'libxss'
    'libxtst'
    'cups'
    'alsa-lib'
    'libxcomposite'
    'libxrandr'
    'libxdamage'
)
source=("local://UOS_Hygon.zip")
sha256sums=('SKIP')
options=('!strip')

prepare() {
    cd "$srcdir"

    # Extract deb from zip
    unzip -o UOS_Hygon.zip

    # Extract deb contents
    ar -x UOS_Hygon/zxsetup_amd.deb

    # Extract data
    mkdir -p data
    tar -xf data.tar.xz -C data
}

package() {
    cd "$srcdir"

    # Install application files
    install -dm755 "$pkgdir/usr/lib/zhixin"
    cp -r data/usr/lib/zhixin/* "$pkgdir/usr/lib/zhixin/"

    # Fix permissions - some dirs in the deb have 700 instead of 755
    find "$pkgdir/usr/lib/zhixin" -type d -exec chmod 755 {} \;

    # Make main binary executable
    chmod 755 "$pkgdir/usr/lib/zhixin/zhixin"

    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/zhixin" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH="/usr/lib/zhixin:$LD_LIBRARY_PATH"
exec /usr/lib/zhixin/zhixin "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/zhixin"

    # Install icon
    install -Dm644 data/usr/share/pixmaps/zhixin.png \
        "$pkgdir/usr/share/pixmaps/zhixin.png"

    # Install desktop file (fix extra space in Icon path)
    install -dm755 "$pkgdir/usr/share/applications"
    sed 's/^Icon= /Icon=/' data/usr/share/applications/zhixin.desktop \
        > "$pkgdir/usr/share/applications/zhixin.desktop"
    chmod 644 "$pkgdir/usr/share/applications/zhixin.desktop"
}
