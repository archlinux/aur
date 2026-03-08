_dotnet_version=10.0
_system_libs=true
_self_contained=false

pkgname=clonedash-git
pkgver=2026.307.76.r9.gd8a01ccd
pkgrel=1
pkgdesc="An open-source, from scratch clone of Muse Dash (a parkour rhythm game)."
arch=("x86_64")
provides=("clonedash=${pkgver%%.r*}")
conflicts=("clonedash")
install=${pkgname%-git}.install
url="https://github.com/marchc1/CloneDash"
license=("MIT")
depends=("glibc" "gcc-libs" "hicolor-icon-theme")
makedepends=("git" "dotnet-sdk-$_dotnet_version" imagemagick)
source=("git+https://github.com/marchc1/CloneDash.git#branch=dev"
        "com.github.marchc1.CloneDash.desktop"
        "com.github.marchc1.CloneDash.metainfo.xml")
sha256sums=('SKIP'
            '4216cf1ad6d60e0d4d3508652286fadd01f0516767456cb38dadea66e645a55d'
            '0be4e9f7817e35e286d43f9732cc82fb2749e6db66883cfa784bf0a05896bba9')

if "$_system_libs"
then
    depends+=(sdl3)
fi
if ! "$_self_contained"
then
    depends+=("dotnet-runtime-$_dotnet_version")
fi

prepare() {
    dotnet --info | grep RID | cut -d : -f 2 | sed 's/arch/linux/' | xargs > _rid
    local _rid
    _rid="$(< _rid)"
    cd "$srcdir/CloneDash"
    # They are net8.0 and not restorable without adding our target framework here
    sed -i "s|<TargetFrameworks>.*</TargetFrameworks>|<TargetFramework>net$_dotnet_version</TargetFramework>|" \
        AssetStudio/AssetStudio.csproj \
        Fmod5Sharp/Fmod5Sharp.csproj \
        AssetStudioUtility/AssetStudioUtility.csproj
    find "$srcdir" -mindepth 1 -maxdepth 1 \( -name "*.diff" -o -name "*.patch" \) \
        -printf "Applying %p...\n" \
        -exec patch -Np1 -i {} \;
    dotnet restore --runtime "$_rid"
}

pkgver() {
    cd "$srcdir/CloneDash"
    git describe --tags --long | sed "s/v//;s/-/.r/;s/-/./g"
}

build() {
    local _rid
    _rid="$(< _rid)"
    cd "$srcdir/CloneDash"
    dotnet publish --no-restore --configuration=Release \
        --self-contained="$_self_contained" \
        --runtime="$_rid"
}

package() {
    local _rid _publish
    _rid="$(< _rid)"
    cd "$srcdir/CloneDash"
    mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/bin"
    for _publish in *"/bin/Release/net$_dotnet_version/$_rid/publish"
    do
        local _proj="${_publish%%\/*}" _bin
        case "$_proj" in
            "CloneDash")
                _bin="Clone Dash" ;;
            *)
                _bin="$_proj" ;;
        esac
        if [[ -x "$_publish/$_bin" ]]
        then
            case "$_proj" in
                "Nucleus.HelloWorld") # Are you sure you want this?
                    continue ;;
                *)
                    echo "Installing $_proj..."
                    cp -a --no-preserve=ownership "$_publish" "$pkgdir/usr/lib/$_proj"
                    ln -srfv "$pkgdir/usr/lib/$_proj/$_bin" "$pkgdir/usr/bin/$_proj"
                    ;;
            esac
        fi
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/com.github.marchc1.CloneDash.desktop" \
        "$pkgdir/usr/share/applications/com.github.marchc1.CloneDash.desktop"
    install -Dm644 "$srcdir/com.github.marchc1.CloneDash.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/com.github.marchc1.CloneDash.metainfo.xml"
    local _line
    while read -r _line
    do
        echo "Extracting ${_line##* } icon..."
        mkdir -p "$pkgdir/usr/share/icons/hicolor/${_line##* }/apps"
        magick "${_line%% *}" "$pkgdir/usr/share/icons/hicolor/${_line##* }/apps/com.github.marchc1.CloneDash.png"
    done < <(magick identify CloneDash/cdicon.ico | cut -d " " -f 1,3)
    if "$_system_libs"
    then
        find "$pkgdir/usr/lib" -type f -name libSDL3.so \
            -printf "Removing %P...\n" -delete
    fi
}

