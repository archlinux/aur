# Maintainer: tam1m <tbacc plus aur at pm dot me>
pkgname=fladder-git
_pkgname=Fladder
pkgver=r1759.710dd26
pkgrel=1
pkgdesc="A cross-platform Jellyfin Frontend built on top of Flutter"
arch=('x86_64')
url="https://github.com/DonutWare/Fladder"
license=('GPL-3.0-or-later')
depends=('mpv' 'gtk3' 'xdg-user-dirs')
makedepends=('patchelf' 'cmake' 'clang' 'base-devel' 'git' 'ninja' 'jq' 'curl')
_branch="develop"
source=("git+https://github.com/DonutWare/Fladder.git#branch=${_branch}"
    "fladder.desktop")
sha256sums=('SKIP'
            '0511c6da677cf361abb8d997a9e8795b39ab083cdbe79b2d7bbb8896c4c5d733')
conflicts=('fladder')
provides=('fladder')

# if set, fladder will autoconnect to the given server
# _base_url="http://192.168.1.100:8096"

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
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
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons"

    cp -r "$srcdir/$_pkgname/build/linux/x64/release/bundle/lib" "$pkgdir/usr/lib/$pkgname/"
    cp -r "$srcdir/$_pkgname/build/linux/x64/release/bundle/data" "$pkgdir/usr/lib/$pkgname/"

    install -m755 -t "$pkgdir/usr/lib/$pkgname" "$srcdir/$_pkgname/build/linux/x64/release/bundle/fladder"

    ln -s "/usr/lib/$pkgname/fladder" "$pkgdir/usr/bin/fladder"
    ln -s "/usr/lib/$pkgname/data/flutter_assets/icons/fladder_icon.svg" "$pkgdir/usr/share/icons/fladder.svg"

    install -m644 "$srcdir/fladder.desktop" "$pkgdir/usr/share/applications/"

    # fix rpath
    for lib in "$pkgdir/usr/lib/$pkgname/lib"/*.so; do
        [[ -f "$lib" && -n "$(patchelf --print-rpath "$lib")" ]] && patchelf --set-rpath '$ORIGIN' "$lib"
    done
    patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/usr/lib/$pkgname/fladder"

    # set baseurl
    if [ -n "$_base_url" ]; then
        sed -i "s|\"baseUrl\": null|\"baseUrl\": \"$_base_url\"|" "${pkgdir}/usr/lib/${pkgname}/data/flutter_assets/config/config.json"
    fi

    install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
