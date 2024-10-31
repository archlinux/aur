# Maintainer: tam1m <tbacc plus aur at pm dot me>
pkgname=fladder-git
_pkgname=Fladder
pkgver=r140.6991282
pkgrel=1
pkgdesc="Fladder - A Simple Jellyfin Frontend"
arch=('x86_64')
url="https://github.com/Fladder-App/Fladder"
license=('GPL-3.0-or-later')
depends=('glibc' 'mpv' 'gtk3')
makedepends=('patchelf' 'cmake' 'clang' 'base-devel' 'git' 'ninja')
_branch="develop"
source=("git+https://github.com/Fladder-App/Fladder.git#branch=${_branch}"
    "https://gsdview.appspot.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.4-stable.tar.xz"
    "fladder.desktop"
    "pubspec.patch")
sha256sums=('SKIP'
            '2ce78d4a51f063efa7f04666ae010d026d119eea6bdea7e08b736840fe88ddb4'
            '76f8c52297b4f423dd6767a37b56c30ea3398e16f2e0500911ba01df40635ce1'
            'fea77c236d4f50c0a8e0b70911916d9668d2c4912cdbce96e1758b2b211eba7d')
conflicts=('fladder')

# if set, fladder will autoconnect to the given server
# example: http://192.168.1.100:8096
BASE_URL=""

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$srcdir/$_pkgname"
    # currently the latest media_kit release has a backscreen bug on linux. replace dependency with git main til next release
    patch -p1 <"${srcdir}/pubspec.patch"
}

build() {
    cd "$srcdir/$_pkgname"
    FLUTTER="$srcdir/flutter/bin/flutter"
    $FLUTTER --disable-analytics
    $FLUTTER --no-version-check pub get
    $FLUTTER build linux --release
}

package() {
    install -dm755 "$pkgdir/usr/bin/$_pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons"
    install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"

    cp -r "$srcdir/$_pkgname/build/linux/x64/release/bundle/"* "$pkgdir/usr/bin/$_pkgname/"

    ln -s "/usr/bin/$_pkgname/Fladder" "$pkgdir/usr/bin/fladder"
    ln -s "/usr/bin/$_pkgname/data/flutter_assets/icons/fladder_icon.svg" "$pkgdir/usr/share/icons/fladder.svg"

    install -m644 "$srcdir/fladder.desktop" "$pkgdir/usr/share/applications/"

    # fix rpath
    for lib in "$pkgdir/usr/bin/$_pkgname/lib"/*.so; do
        [[ -f "$lib" && -n "$(patchelf --print-rpath "$lib")" ]] && patchelf --set-rpath '$ORIGIN' "$lib"
    done
    patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/usr/bin/$_pkgname/Fladder"

    # set baseurl
    if [ -n "$BASE_URL" ]; then
        sed -i "s|\"baseUrl\": null|\"baseUrl\": \"$BASE_URL\"|" "${pkgdir}/usr/bin/${_pkgname}/data/flutter_assets/config/config.json"
    fi

    install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
