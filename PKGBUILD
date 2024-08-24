# Maintainer: Talo Halton <talohalton@gmail.com>
pkgname=spmp
pkgver=0.4.1
_ver=0.4.1
pkgrel=21
pkgdesc="YouTube Music client with a focus on customisation of colours and song metadata"
arch=("x86_64")
url="https://github.com/toasterofbread/spmp"
license=("GPL-3.0-only")
depends=("mpv" "libayatana-appindicator" "jre22-openjdk")
makedepends=("jdk22-openjdk" "jre21-openjdk")

source=("https://github.com/toasterofbread/spmp/archive/refs/tags/v${_ver}.tar.gz")
sha256sums=("4a8f0cc041a9035389b4624a138074a63b33f9e1f5ff5e9b2fb0f9697f706505")

build() {
    cd "$srcdir/${pkgname}-${_ver}"

    export JAVA_21_HOME=/usr/lib/jvm/java-21-openjdk/
    export JAVA_22_HOME=/usr/lib/jvm/java-22-openjdk/
    export JAVA_HOME=$JAVA_22_HOME
    export GRADLE_USER_HOME="$srcdir/.gradle"

    ./gradlew --no-daemon desktopApp:createReleaseDistributable -PGIT_TAG_OVERRIDE="v${_ver}"
}

package() {
    cd "$srcdir/${pkgname}-${_ver}"

    # Install launch binary and libs
    mkdir -p "$pkgdir/usr/bin"
    cp -r ./desktopApp/build/compose/binaries/main-release/app/spmp "$pkgdir/usr/bin/spmp-libs"
    ln -s "$pkgdir/usr/bin/spmp-libs/bin/spmp" "$pkgdir/usr/bin/spmp"

    # Install desktop file
    DESKTOP_FILE_DIR="$pkgdir/usr/share/applications"
    mkdir -p "$DESKTOP_FILE_DIR"
    cp ./desktopApp/appimage/spmp.desktop "$DESKTOP_FILE_DIR/spmp.desktop"

    # Replace desktop file Exec line
    exec="Exec=spmp"
    sed -i '0,/^Exec=/s/^Exec=.*$/Exec=spmp/' "$DESKTOP_FILE_DIR/spmp.desktop"

    # Install icon
    ICON_DIR="$pkgdir/usr/share/icons/hicolor/512x512/apps"
    mkdir -p "$ICON_DIR"
    cp ./metadata/en-US/images/icon.png "$ICON_DIR/spmp.png"
}
