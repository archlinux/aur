# Maintainer: tam1m <tbacc plus aur at pm dot me>
pkgname=fladder-git
_pkgname=Fladder
pkgver=r261.5b781cf
pkgrel=1
pkgdesc="Fladder - A Simple Jellyfin Frontend"
arch=('x86_64')
url="https://github.com/Fladder-App/Fladder"
license=('GPL-3.0-or-later')
depends=('glibc' 'mpv' 'gtk3')
makedepends=('patchelf' 'cmake' 'clang' 'base-devel' 'git' 'ninja' 'jq' 'curl')
_branch="develop"
source=("git+https://github.com/Fladder-App/Fladder.git#branch=${_branch}"
    "fladder.desktop")
sha256sums=('SKIP'
            '76f8c52297b4f423dd6767a37b56c30ea3398e16f2e0500911ba01df40635ce1')
conflicts=('fladder')
provides=("fladder")

# if set, fladder will autoconnect to the given server
# _base_url="http://192.168.1.100:8096"

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

    #get flutter version from .fvmrc
    flutter_version=$(jq -r '.flutter' .fvmrc)

    if [[ -z "$flutter_version" || "$flutter_version" == "null" ]]; then
        echo "Can't get flutter version from .fvmrc"
        exit 1
    fi

    echo "Get Flutter SDK version $flutter_version"
    flutter_url="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${flutter_version}-stable.tar.xz"
    curl -L "$flutter_url" -o "$srcdir/flutter_linux_${flutter_version}-stable.tar.xz"

    #extract sdk
    echo "Extract Flutter SDK"
    mkdir -p "$srcdir/flutter"
    tar -xJf "$srcdir/flutter_linux_${flutter_version}-stable.tar.xz" -C "$srcdir/flutter" --strip-components=1
    rm "$srcdir/flutter_linux_${flutter_version}-stable.tar.xz"
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
    if [ -n "$_base_url" ]; then
        sed -i "s|\"baseUrl\": null|\"baseUrl\": \"$_base_url\"|" "${pkgdir}/usr/bin/${_pkgname}/data/flutter_assets/config/config.json"
    fi

    install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
