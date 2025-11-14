_dotnet_version=10.0
_system_libs=true

pkgname=clonedash-git
pkgver=r1782.g6ecd0c4
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
        "com.github.marchc1.CloneDash.desktop"
        "com.github.marchc1.CloneDash.metainfo.xml"
        "com.github.marchc1.CloneDash.png")
sha256sums=('SKIP'
            '75d31ad4e100dff79244be6d5e69d605caa2b2959d9be9ed64bb1f6a75315106'
            '0be4e9f7817e35e286d43f9732cc82fb2749e6db66883cfa784bf0a05896bba9'
            '1f342693e6c390c611cc04a9ef93879c3299ecd976bd9958e2cb95b7fe93ffdb')

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
    dotnet build "CloneDash/Clone Dash.csproj" \
        -c Release --framework "net$_dotnet_version" --runtime "$_rid" -p:NoWarn=NU1605
    dotnet build "Nucleus.ModelEditor/Nucleus.ModelEditor.csproj" \
        -c Release --framework "net$_dotnet_version" --runtime "$_rid" -p:NoWarn=NU1605
}

package() {
    cd "$srcdir/CloneDash"
    mkdir -p "$pkgdir/usr/lib/clonedash" "$pkgdir/usr/bin"
    cp -a --no-preserve=ownership -t "$pkgdir/usr/lib/clonedash" \
        "CloneDash/bin/Release/net$_dotnet_version/$_rid/." \
        "Nucleus.ModelEditor/bin/Release/net$_dotnet_version/$_rid/."
    ln -srfv "$pkgdir/usr/lib/clonedash/Clone Dash" "$pkgdir/usr/bin/CloneDash"
    #find "$pkgdir/usr/lib/clonedash/runtimes" -maxdepth 1 -mindepth 1 -type d ! -name "$_rid" -exec rm -rf {} \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/com.github.marchc1.CloneDash.desktop" \
        "$pkgdir/usr/share/applications/com.github.marchc1.CloneDash.desktop"
    install -Dm644 "$srcdir/com.github.marchc1.CloneDash.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/com.github.marchc1.CloneDash.metainfo.xml"
    install -Dm644 "$srcdir/com.github.marchc1.CloneDash.png" \
        "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.github.marchc1.CloneDash.png"
    if "$_system_libs"
    then
        rm "$pkgdir/usr/lib/clonedash/libSDL3.so"
    fi
}

