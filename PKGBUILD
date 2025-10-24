# Maintainer: slip <aur.57652 AT 8shield DOT net>

_pkgname=vesktop
pkgname=vesktop-custom-icons-git
pkgdesc="A vesktop-git clone that builds with original discord icons"
pkgver=1.6.0.r9.ga242d5d
pkgrel=1

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-only')

depends=('alsa-lib' 'gtk3' 'nss')
makedepends=('git' 'pnpm' 'npm' 'imagemagick' 'optipng')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vesktop")
conflicts=('vesktop' 'vesktop-git')

: "${color:=default}"

source=(
  "$_pkgname::git+$url.git"
  "vesktop.desktop"
  "vesktop.sh"
  "resize.sh"
  "colors.conf"
  "https://raw.githubusercontent.com/hshl2/vesktop-custom-icons/main/loader.gif"
  "https://raw.githubusercontent.com/hshl2/vesktop-custom-icons/main/source-icon.svg"
  "https://raw.githubusercontent.com/hshl2/vesktop-custom-icons/main/source-icon-notification.svg"
)

sha256sums=('SKIP' '455c00b862aa0a7e18ca8e23d65d5c5ee4506cdfb15f1bf6f622cce39827de46' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"

    echo ">> Generating icons using color scheme: ${color:-default}"
    bash resize.sh "$color"
    echo "Icons generated in pack"

    cd "$_pkgname"

    BUILD_STATIC_DIR="build/static"
    STATIC_TRAY_DIR="static/tray"
    mkdir -p "$BUILD_STATIC_DIR"
    mkdir -p "$STATIC_TRAY_DIR"

    cp -v "$srcdir/pack/static/vesktop.png" "$srcdir/$_pkgname/static/icon.png"
    cp -v "$srcdir/pack/static/icon.ico" "$srcdir/$_pkgname/static/icon.ico"
#rip the gif intro
#    cp -v "$srcdir/pack/static/shiggy.gif" "$srcdir/$_pkgname/static/shiggy.gif"
    cp -v "$srcdir/pack/static/tray/tray.png" "$srcdir/$_pkgname/$STATIC_TRAY_DIR/tray.png"
    cp -v "$srcdir/pack/static/tray/trayUnread.png" "$srcdir/$_pkgname/$STATIC_TRAY_DIR/trayUnread.png"

    echo "Icons injected into build/static/ and static/tray/"
}

build() {
    cd "$srcdir/$_pkgname"

    pnpm i --frozen-lockfile
    pnpm package:dir
}

package() {
    cd "$srcdir/$_pkgname"

    install -d "$pkgdir/usr/lib/$_pkgname"
    install -d "$pkgdir/usr/bin"

    cp -R "dist/linux-unpacked/." "$pkgdir/usr/lib/$_pkgname"

    install -Dm644 "../vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for _icons in 1024 512 256 128 64 48 32 16; do
        install -Dm644 "../pack/icons/hicolor/${_icons}x${_icons}/apps/vesktop.png" \
            "$pkgdir/usr/share/icons/hicolor/${_icons}x${_icons}/apps/vesktop.png"
    done

    install -Dm644 "../pack/static/vesktop.png" "$pkgdir/usr/share/icons/hicolor/1080x1080/apps/vesktop.png"
    install -Dm644 "../pack/static/icon.ico" "$pkgdir/usr/share/icons/hicolor/1080x1080/apps/icon.ico"
#    install -Dm644 "../pack/static/shiggy.gif" "$pkgdir/usr/share/icons/hicolor/1080x1080/apps/shiggy.gif"

    install -Dm755 "../vesktop.sh" "$pkgdir/usr/bin/$_pkgname"
}
