# Maintainer: Talo Halton <talohalton@gmail.com>
pkgname=spmp-git
_gitname=spmp
pkgver=v0.4.1.r103.g5a76563a
pkgrel=1
pkgdesc="YouTube Music client with a focus on customisation of colours and song metadata (Git version)"
arch=("x86_64")
url="https://github.com/toasterofbread/spmp"
license=("GPL-3.0-only")
depends=("mpv" "libayatana-appindicator" "jdk-openjdk")
makedepends=("jdk-openjdk")
source=("git+https://github.com/toasterofbread/spmp")
sha256sums=("SKIP")

pkgver() {
  cd "$_gitname"
  git describe --long --tags --exclude "nightly*" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "$srcdir/${_gitname}"

    export GRADLE_USER_HOME="$srcdir/.gradle"

    ./gradlew --no-daemon desktopApp:createReleaseDistributable -PGIT_TAG_OVERRIDE="${pkgver}"
}

package() {
    cd "$srcdir/${_gitname}"

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
