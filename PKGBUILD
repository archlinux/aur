_dotnet_version=10.0
_system_libs=true
# TODO: change to false to use system runtime when dotnet 10 is in extra.
_self_contained=true

pkgname=clonedash-git
pkgver=r1804.gc0702f1
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
if ! "$_self_contained"
then
    depends+=("dotnet-runtime-$_dotnet_version")
fi

prepare() {
    cd "$srcdir/CloneDash"
    find "$srcdir" -mindepth 1 -maxdepth 1 \( -name "*.diff" -o -name "*.patch" \) \
        -printf "Applying %p...\n" \
        -exec patch -Np1 -i {} \;
    dotnet restore --runtime "$_rid" -p:NoWarn=NU1605
}

pkgver() {
    cd "$srcdir/CloneDash"
    # No major.minor.patch like tag now.
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
    #git describe --tags --long | sed "s/-/.r/;s/-/./g"
}

build() {
    cd "$srcdir/CloneDash"
    dotnet build --no-restore -c Release -p:NoWarn=NU1605 --self-contained="$_self_contained"
}

package() {
    cd "$srcdir/CloneDash"
    mkdir -p "$pkgdir/usr/lib/clonedash" "$pkgdir/usr/bin"
    if "$_self_contained"
    then
        cp -a --no-preserve=ownership -t "$pkgdir/usr/lib/clonedash" \
            "CloneDash/bin/Release/net$_dotnet_version/$_rid/." \
            "Nucleus.ModelEditor/bin/Release/net$_dotnet_version/$_rid/."
    else
        cp -a --no-preserve=ownership -t "$pkgdir/usr/lib/clonedash" \
            "CloneDash/bin/Release/net$_dotnet_version/." \
            "Nucleus.ModelEditor/bin/Release/net$_dotnet_version/."
    fi
    ln -srfv "$pkgdir/usr/lib/clonedash/Clone Dash" "$pkgdir/usr/bin/CloneDash"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/com.github.marchc1.CloneDash.desktop" \
        "$pkgdir/usr/share/applications/com.github.marchc1.CloneDash.desktop"
    install -Dm644 "$srcdir/com.github.marchc1.CloneDash.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/com.github.marchc1.CloneDash.metainfo.xml"
    install -Dm644 "$srcdir/com.github.marchc1.CloneDash.png" \
        "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.github.marchc1.CloneDash.png"
    if "$_system_libs"
    then
        find "$pkgdir/usr/lib/clonedash" -type f -name libSDL3.so \
            -printf "Removing %P...\n" -delete
    fi
    if ! "$_self_contained"
    then
        find "$pkgdir/usr/lib/clonedash/runtimes" -maxdepth 1 -mindepth 1 -type d ! -name "$_rid" \
            -printf "Removing %P...\n" -exec rm -rf {} +
    fi
}

