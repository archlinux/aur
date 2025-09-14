_dotnet_version=8.0
_system_libs=true

pkgname=clonedash-git
pkgver=r1569.gcbeb8ac
pkgrel=1
pkgdesc="An open-source, from scratch clone of Muse Dash (a parkour rhythm game)."
arch=("x86_64")
provides=("clonedash")
conflicts=("clonedash")
install=${pkgname%-git}.install
url="https://github.com/marchc1/CloneDash"
license=("MIT")
depends=("glibc" "gcc-libs" "hicolor-icon-theme")
makedepends=("git" "dotnet-sdk-$_dotnet_version")
source=("git+https://github.com/marchc1/CloneDash.git#branch=dev"
        # Fix circular dependencies results failure to start game.
        "0001-pr-63.diff::https://github.com/marchc1/CloneDash/pull/63.diff"
        "CloneDash.desktop")
sha256sums=('SKIP'
            'd887a4512e52a0cd99e7b825272e1045dd528a0184664a3780e32550165c34d6'
            '85f0cc3b17ab6d7cc2fc3cc6f396d22edfd4efbd7d204552a0947b39de1baeee')

case "$CARCH" in
    x86_64)
        _rid="linux-x64"
        ;;
    armv7l)
        _rid="linux-arm"
        ;;
    aarch64)
        _rid="linux-arm64"
        ;;
    *)
        _rid="linux-$CARCH"
        ;;
esac
if "$_system_libs"
then
    depends+=(sdl3)
fi

prepare() {
    cd "$srcdir/CloneDash"
    find "$srcdir" -mindepth 1 -maxdepth 1 \( -name "*.diff" -o -name "*.patch" \) \
        -printf "Applying %p...\n" \
        -exec patch -Np1 -i {} \;
    dotnet restore -p:NoWarn=NU1605
}

pkgver() {
    cd "$srcdir/CloneDash"
    # No major.minor.patch like tag now.
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
    #git describe --tags --long | sed "s/-/.r/;s/-/./g"
}

build() {
    cd "$srcdir/CloneDash"
    dotnet publish -c Release --output publish --framework "net$_dotnet_version" --runtime "$_rid" -p:NoWarn=NU1605
}

package() {
    cd "$srcdir/CloneDash"
    mkdir -p "$pkgdir/usr/lib/clonedash" "$pkgdir/usr/bin"
    cp -a --no-preserve=ownership -t "$pkgdir/usr/lib/clonedash" \
        "CloneDash/bin/Release/net$_dotnet_version/$_rid/." \
        "Nucleus.ModelEditor/bin/Release/net$_dotnet_version/$_rid/."
    ln -srfv "$pkgdir/usr/lib/clonedash/Clone Dash" "$pkgdir/usr/bin/CloneDash"
    find "$pkgdir/usr/lib/clonedash/runtimes" -maxdepth 1 -mindepth 1 -type d ! -name "$_rid" -exec rm -rf {} \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/CloneDash.desktop" "$pkgdir/usr/share/applications/CloneDash.desktop"
    if "$_system_libs"
    then
        rm "$pkgdir/usr/lib/clonedash/libSDL3.so"
    fi
}

