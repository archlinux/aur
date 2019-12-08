# Contributor: Matthias Lisin <ml@visu.li>
# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=ubports-installer
pkgver=0.4.13b
_ver=${pkgver/b/-beta}
pkgrel=1
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=('x86_64' 'i686')
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'electron4' 'e2fsprogs')
makedepends=('jq' 'npm' 'moreutils')
conflicts=('ubports-installer-git' 'ubports-installer-bin')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/ubports/ubports-installer/archive/$_ver.tar.gz")
sha512sums=('4ca9af81109db5ce8bc52261148759eb848de9d028c81f69b6a37273a8023517132911c79dfd328a9e6418455667079f124e07819a858a51936b67c55f87dec3')

prepare() {
    local cache="$srcdir/npm-cache"
    local dist=/usr/lib/electron4

    cd "$pkgname-$_ver"
    jq '.electronDist = $dist | .electronVersion = $version' \
        --arg dist "$dist" \
        --arg version "$(sed s/^v// $dist/version)" \
        buildconfig-generic.json | sponge buildconfig-generic.json

    npm uninstall --no-audit --cache "$cache" electron{-packager,-view-renderer} spectron
}

build() {
    cd "$pkgname-$_ver"
    node build.js -o linux -p dir -n
}

package() {
    cd "$pkgname-$_ver"

    echo "#!/usr/bin/env bash
exec electron4 /usr/share/ubports-installer/app.asar \$@" > "$srcdir/ubports-installer.sh"
	install -Dm755 "$srcdir/ubports-installer.sh" "$pkgdir/usr/bin/ubports-installer"

	echo "[Desktop Entry]
Name=ubports-installer
Comment=UBports Installer: The easy way to install Ubuntu Touch on UBports devices. A friendly cross-platform Installer for Ubuntu Touch. Just connect a supported device to your PC, follow the on-screen instructions and watch this awesome tool do all the rest.
Exec=ubports-installer %U
Terminal=false
Type=Application
Icon=ubports-installer
Categories=Utility" > "$srcdir/ubports-installer.desktop"

	install -Dm644 "$srcdir/ubports-installer.desktop" "$pkgdir/usr/share/applications/ubports-installer.desktop"

    cd "$srcdir/$pkgname-$_ver/build/icons"
    for i in *x*.png; do
        install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/ubports-installer.png"
    done

    cd "$srcdir/$pkgname-$_ver/dist/linux-unpacked/resources"
    install -Dm644 app.asar "$pkgdir/usr/share/ubports-installer/app.asar"

    mkdir -p "$pkgdir/usr/share/ubports-installer/app.asar.unpacked/platform-tools/linux"
    ln -s /usr/bin/adb "$pkgdir/usr/share/ubports-installer/app.asar.unpacked/platform-tools/linux/adb"
    ln -s /usr/bin/fastboot "$pkgdir/usr/share/ubports-installer/app.asar.unpacked/platform-tools/linux/fastboot"
    ln -s /usr/bin/mke2fs "$pkgdir/usr/share/ubports-installer/app.asar.unpacked/platform-tools/linux/mke2fs"
}
