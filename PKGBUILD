# Maintainer: Talo Halton <talohalton@gmail.com>
pkgname=spmp
pkgver=0.4.2
_ver=0.4.2
pkgrel=22
pkgdesc="YouTube Music client with a focus on customisation of colours and song metadata"
arch=("x86_64")
url="https://github.com/toasterofbread/spmp"
license=("GPL-3.0-only")
depends=("mpv" "libayatana-appindicator" "jdk-openjdk")
makedepends=("jdk-openjdk" "jdk21-openjdk")

source=("https://github.com/toasterofbread/spmp/archive/refs/tags/v${_ver}.tar.gz")
sha256sums=("0d203355ab044a19e0268c13d773e1bb0881fb11b898eba1190763905211d3fb")

prepare() {
    SRC_DIR="$srcdir/${pkgname}-${_ver}"

    # Apply patches
    patch -d $SRC_DIR -p1 < ../newpipedependency.patch
}

build() {
    cd "$srcdir/${pkgname}-${_ver}"

    JDK_LATEST=$(archlinux-java status | grep -oP 'java-\d+-openjdk' | sort -V | tail -n 1)

    export JAVA_21_HOME=/usr/lib/jvm/java-21-openjdk/
    export JAVA_22_HOME=/usr/lib/jvm/$JDK_LATEST/
    export JAVA_HOME=$JAVA_22_HOME
    export GRADLE_USER_HOME="$srcdir/.gradle"

    ./gradlew --no-daemon desktopApp:createReleaseDistributable -PGIT_TAG_OVERRIDE="v${_ver}"
}

package() {
    cd "$srcdir/${pkgname}-${_ver}"

    # Install launch binary and libs
    mkdir -p "$pkgdir/usr/bin"
    cp -r ./desktopApp/build/compose/binaries/main-release/app/spmp "$pkgdir/usr/bin/spmp-libs"
    ln -sr "$pkgdir/usr/bin/spmp-libs/bin/spmp" "$pkgdir/usr/bin/spmp"

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
