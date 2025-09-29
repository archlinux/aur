# Maintainer: Maki <maki@hotmilk.space>

pkgname=pony-house-bin
pkgver=1.5.0
pkgrel=2
pkgdesc="A Matrix client, focused on being a completely customizable open source superapp"
arch=("x86_64")
url="https://github.com/Pony-House/Client"
license=("AGPL-3.0-only")

depends=("electron")
makedepends=("asar")

provides=("pony-house=${pkgver}")
conflicts=("pony-house")

options=("!strip")

_filename="Pony.House-$pkgver.AppImage"

source=(
	"https://github.com/Pony-House/Client/releases/download/$pkgver/$_filename"
	"https://raw.githubusercontent.com/Pony-House/Client/$pkgver/LICENSE"
)

sha256sums=(
	"c6f17d82850eec8bd0206422f118c6a83801154907415d56c1cca4737ee2b986"
	"4df3c306dddaaf4baffdff5ca820cc679ac8cd6dc263c6a74517783e42fa7a3b"
)

_install_name="pony-house"

# tried to do this similar to
# https://archlinux.org/packages/extra/x86_64/element-desktop

asar_patches() {
    sed -i -E 's| \+ appName| \+ "'$_install_name'"|g' \
        app/node_modules/auto-launch/dist/AutoLaunchLinux.js
    
    sed -i -E 's| \+ appPath| \+ "\/usr\/bin\/'$_install_name'"|g' \
        app/node_modules/auto-launch/dist/AutoLaunchLinux.js
}

package() {
    # extract AppImage
    chmod +x "$_filename"
    ./$_filename --appimage-extract &>/dev/null

    # install app.asar and app.asar.unpacked

    install -Dm644 squashfs-root/resources/app.asar \
        "$pkgdir/usr/lib/$_install_name/app.asar"

    cp -r squashfs-root/resources/app.asar.unpacked \
        "$pkgdir/usr/lib/$_install_name/"

    # no other resources need to be installed

    # patch app.asar

    cd "$pkgdir/usr/lib/$_install_name"
    asar extract app.asar app
    rm -f app.asar

    asar_patches

    asar pack app app.asar
    rm -rf app app.asar.unpacked
    cd "$srcdir"

    # create executable
    mkdir -p "$pkgdir/usr/bin/"
    cat << EOF > "$pkgdir/usr/bin/$_install_name"
#!/bin/sh
exec electron /usr/lib/$_install_name/app.asar "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$_install_name"

    # install icon
    install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/pony-house-matrix.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_install_name.png"
    
    # install desktop file
    install -Dm644 squashfs-root/pony-house-matrix.desktop \
        "$pkgdir/usr/share/applications/$_install_name.desktop"

    # fix desktop file

    sed -i -E "s/Icon=pony-house-matrix/Icon="$_install_name"/i" \
        "$pkgdir/usr/share/applications/$_install_name.desktop"

    sed -i -E "s/Exec=.+$/Exec=\/usr\/bin\/"$_install_name" %U/i" \
        "$pkgdir/usr/share/applications/$_install_name.desktop"

    # install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_install_name/LICENSE"
}
