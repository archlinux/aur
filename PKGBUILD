# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

_omit_dlls=false
_dotnet_ver=9.0
_runtime_ver=7
_sdk_ver=108

pkgname='openshock-desktop-bin'
pkgdesc='An OpenShock application with module support (pre-built version)'
pkgver='1.0.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/OpenShock/Desktop'
license=('AGPL-3.0-only')
depends=('nss' 'alsa-lib' 'nspr' 'hicolor-icon-theme' "dotnet-runtime-$_dotnet_ver" 'gtk3' 'libappindicator-gtk3' 'libindicator-gtk2' 'libnotify' 'libxss' 'libxtst')
conflicts=('openshock-desktop')
provides=('openshock-desktop')
source=("https://github.com/OpenShock/Desktop/releases/download/$pkgver/OpenShock.Desktop.Photino.Linux.zip"
        'openshock-desktop'
        'OpenShock-Desktop.desktop')
noextract=('OpenShock.Desktop.Photino.Linux.zip')
sha256sums=('c30374721fab5a203c56eba06a80833ea0aa27f5f2c7b39ccf8db69eb3487990'
            '4fe84f7aa610d36698d4386e57f4c5a141700032ec94df14e0e03eb48ef9e1ca'
            'f56461a0d3dba950a927e225ceb34b885b256907098d1bbcd35c972d6a867c6e')

if [ "$_omit_dlls" = true ]; then
    depends+=("dotnet-host=$_dotnet_ver.$_runtime_ver.sdk$_sdk_ver" "dotnet-runtime=$_dotnet_ver.$_runtime_ver.sdk$_sdk_ver" "aspnet-runtime=$_dotnet_ver.$_runtime_ver.sdk$_sdk_ver" "dotnet-sdk=$_dotnet_ver.$_runtime_ver.sdk$_sdk_ver")
fi

prepare() {
    (
        . /usr/share/makepkg/source/file.sh
        mkdir OpenShock.Desktop.Photino.Linux
        cd OpenShock.Desktop.Photino.Linux
        ln -s ../OpenShock.Desktop.Photino.Linux.zip OpenShock.Desktop.Photino.Linux.zip
        noextract=()
        extract_file "${source[0]}"
        rm OpenShock.Desktop.Photino.Linux.zip
    )
}

build() {
    rm -f OpenShock.Desktop.Photino.Linux/sasscompiler.json
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/OpenShock.min.css.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/OpenShock.min.css.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/app.css.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/app.css.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/index.html.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/index.html.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/photino.html.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/photino.html.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/_content/MudBlazor/MudBlazor.min.css.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/_content/MudBlazor/MudBlazor.min.css.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/_content/MudBlazor/MudBlazor.min.js.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/_content/MudBlazor/MudBlazor.min.js.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/Icon.svg.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/Icon.svg.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/IconLoadingSpin.svg.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/IconLoadingSpin.svg.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/IconSlowSpin.svg.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/IconSlowSpin.svg.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/NavbarLogoSpin.svg.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/NavbarLogoSpin.svg.gz
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/openshock-icon.ico.br
    rm -f OpenShock.Desktop.Photino.Linux/wwwroot/images/openshock-icon.ico.gz

    if [ "$_omit_dlls" = true ]; then
        stat "/usr/share/dotnet/shared/Microsoft.NETCore.App/$_dotnet_ver.$_runtime_ver" >/dev/null
        stat "/usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/Roslyn/bincore" >/dev/null
        (
            CDPATH='' cd OpenShock.Desktop.Photino.Linux
            for dll in *; do
                if [ -e "/usr/share/dotnet/host/fxr/$_dotnet_ver.$_runtime_ver/$dll" ]; then
                    ln -sf "../../../../../../usr/share/dotnet/host/fxr/$_dotnet_ver.$_runtime_ver/$dll" "$dll"
                elif [ -e "/usr/share/dotnet/shared/Microsoft.NETCore.App/$_dotnet_ver.$_runtime_ver/$dll" ]; then
                    ln -sf "../../../../../../usr/share/dotnet/shared/Microsoft.NETCore.App/$_dotnet_ver.$_runtime_ver/$dll" "$dll"
                elif [ -e "/usr/share/dotnet/shared/Microsoft.AspNetCore.App/$_dotnet_ver.$_runtime_ver/$dll" ]; then
                    ln -sf "../../../../../../usr/share/dotnet/shared/Microsoft.AspNetCore.App/$_dotnet_ver.$_runtime_ver/$dll" "$dll"
                elif [ -e "/usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/$dll" ]; then
                    ln -sf "../../../../../../usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/$dll" "$dll"
                elif [ -e "/usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/Roslyn/bincore/$dll" ]; then
                    ln -sf "../../../../../../usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/Roslyn/bincore/$dll" "$dll"
                fi
            done
        )
    fi

    sed -i -e "s/^Version=.*/Version=$pkgver/" OpenShock-Desktop.desktop
}

package() {
    install -d -Dm755 "$pkgdir/opt"
    install -d -Dm755 "$pkgdir/opt/openshock-desktop"
    cp -r OpenShock.Desktop.Photino.Linux/. "$pkgdir/opt/openshock-desktop"
    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 openshock-desktop -t "$pkgdir/usr/bin"
    install -d -Dm755 "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/icons"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/16x16"
    install -Dm644 OpenShock.Desktop.Photino.Linux/wwwroot/images/openshock-icon.ico "$pkgdir/usr/share/icons/hicolor/16x16/openshock-desktop.ico"
    ln -sf "$pkgdir/usr/share/icons/hicolor/16x16/openshock-desktop.ico" OpenShock.Desktop.Photino.Linux/wwwroot/images/openshock-icon.ico
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/64x64"
    install -Dm644 OpenShock.Desktop.Photino.Linux/wwwroot/images/Icon64.png "$pkgdir/usr/share/icons/hicolor/64x64/openshock-desktop.png"
    ln -sf "$pkgdir/usr/share/icons/hicolor/64x64/openshock-desktop.png" OpenShock.Desktop.Photino.Linux/wwwroot/images/Icon64.png
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/512x512"
    install -Dm644 OpenShock.Desktop.Photino.Linux/wwwroot/images/Icon512.png "$pkgdir/usr/share/icons/hicolor/512x512/openshock-desktop.png"
    ln -sf "$pkgdir/usr/share/icons/hicolor/512x512/openshock-desktop.png" OpenShock.Desktop.Photino.Linux/wwwroot/images/Icon512.png
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/scalable"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 OpenShock.Desktop.Photino.Linux/wwwroot/images/Icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openshock-desktop.svg"
    ln -sf "$pkgdir/usr/share/icons/hicolor/scalable/apps/openshock-desktop.svg" OpenShock.Desktop.Photino.Linux/wwwroot/images/Icon.svg
    install -d -Dm755 "$pkgdir/usr/share/applications"
    install -Dm644 OpenShock-Desktop.desktop -t "$pkgdir/usr/share/applications"

    chmod 0755 "$pkgdir/opt/openshock-desktop/OpenShock.Desktop"
}
