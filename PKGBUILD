_dotnet_version=10.0
_system_libs=true
# TODO: change to false to use system runtime when dotnet 10 is in extra.
_self_contained=false

pkgname=clonedash-git
pkgver=r1988.g38c60712
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
            '56f606872cb137c4e39d9de6246a320f2e535ed998fd95ac8749fe3301eb3e69'
            '0be4e9f7817e35e286d43f9732cc82fb2749e6db66883cfa784bf0a05896bba9'
            '1f342693e6c390c611cc04a9ef93879c3299ecd976bd9958e2cb95b7fe93ffdb')

if "$_system_libs"
then
    depends+=(sdl3)
fi
if ! "$_self_contained"
then
    depends+=("dotnet-runtime-$_dotnet_version")
fi
_projects=("./CloneDash/Clone Dash.csproj" "./Nucleus.ModelEditor/Nucleus.ModelEditor.csproj")

prepare() {
    dotnet --info | grep RID | cut -d : -f 2 | sed 's/arch/linux/' | xargs > _rid
    local _rid
    _rid="$(< _rid)"
    cd "$srcdir/CloneDash"
    find "$srcdir" -mindepth 1 -maxdepth 1 \( -name "*.diff" -o -name "*.patch" \) \
        -printf "Applying %p...\n" \
        -exec patch -Np1 -i {} \;
    local proj
    for proj in "${_projects[@]}"
    do
        dotnet restore "$_proj" --runtime "$_rid" --property:NoWarn=NU1605
    done
}

pkgver() {
    cd "$srcdir/CloneDash"
    # No major.minor.patch like tag now.
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
    #git describe --tags --long | sed "s/-/.r/;s/-/./g"
}

build() {
    local _rid
    _rid="$(< _rid)"
    cd "$srcdir/CloneDash"
    local proj
    for proj in "${_projects[@]}"
    do
        dotnet publish "$proj" \
            --no-restore --configuration=Release --self-contained="$_self_contained" --runtime="$_rid" \
            --property:NoWarn=NU1605
    done
}

package() {
    local _rid
    _rid="$(< _rid)"
    cd "$srcdir/CloneDash"
    mkdir -p "$pkgdir/usr/lib/clonedash" "$pkgdir/usr/bin"
    cp -a --no-preserve=ownership \
        "./CloneDash/bin/Release/net$_dotnet_version/$_rid/publish" \
         "$pkgdir/usr/lib/clonedash/CloneDash"
    cp -a --no-preserve=ownership -t "$pkgdir/usr/lib/clonedash/CloneDash" \
        "./CloneDash/bin/Release/net$_dotnet_version/$_rid/assets"
    cp -a --no-preserve=ownership \
        "./Nucleus.ModelEditor/bin/Release/net$_dotnet_version/$_rid/publish" \
        "$pkgdir/usr/lib/clonedash/Nucleus.ModelEditor"
    cp -a --no-preserve=ownership -t "$pkgdir/usr/lib/clonedash/Nucleus.ModelEditor" \
        "./Nucleus.ModelEditor/bin/Release/net$_dotnet_version/$_rid/assets"
    ln -srfv "$pkgdir/usr/lib/clonedash/CloneDash/Clone Dash" "$pkgdir/usr/bin/CloneDash"
    ln -srfv "$pkgdir/usr/lib/clonedash/Nucleus.ModelEditor/Nucleus.ModelEditor" "$pkgdir/usr/bin/Nucleus.ModelEditor"
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
}

