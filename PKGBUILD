# Maintainer: xihale <xihale.top@qq.com>

## options
: ${_autoupdate:=true}
: ${_pkgtype:=-latest-bin}

pkgname="affine$_pkgtype"
pkgver=0.13.0_canary.0
pkgrel=1
pkgdesc="Auto get the latest version(maybe canary maybe not) of AFFiNE(A privacy-focussed, local-first, open-source, and ready-to-use alternative for Notion & Miro.)"
arch=("x86_64")
license=('MPL2')
url="https://github.com/toeverything/AFFiNE"

_main(){

    _json=`curl -s "https://api.github.com/repos/toeverything/AFFiNE/releases?per_page=1"`
    
    _pkgver=`echo "$_json" | sed -n '/"name"/p' | head -n 1 | awk -F'"' '{print $4}' | sed -n 's/-/_/1p'`

    _AppImage_url=`echo "$_json" | sed -n '/browser_download_url.*linux.*\.AppImage/p' | awk -F'"' '{print $4}'`
    
}

pkgver(){

    printf "%s" "$_pkgver"

}

package() {

    # get the package
    filename=`basename $_AppImage_url`
    echo $_AppImage_url $filename
    curl -L -o $filename -C - $_AppImage_url # continuous transmission on the breakpoint if file exist.

    # extract the AppImage
    chmod +x $filename
    ./$filename --appimage-extract

    cd "$srcdir/squashfs-root"

    _app_name=`ls | grep AFFiNE | head -n 1 | sed 's/\..*//g'`

    install -Dm755 "AppRun" "$pkgdir/usr/bin/$_app_name"
    install -Dm644 "$_app_name.png" "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$_app_name.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/$_app_name"
    mkdir -p "$pkgdir/opt/$_app_name"
    mv * $pkgdir/opt/$_app_name/
}

_main
