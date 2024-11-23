# Maintainer: xihale <xihale.top@qq.com>

## options
: ${_autoupdate:=true}
: ${_pkgtype:=-bin}

pkgname="v2rayn$_pkgtype"
pkgver=7.2.0
pkgrel=1
pkgdesc="A GUI client for Windows and Linux, support Xray core and others"
arch=("x86_64")
license=('GPL3')
url="https://github.com/2dust/v2rayN"
options=('!strip') # TODO: after striping, the file couldn't run

_main(){

    _json=$(curl -s "https://api.github.com/repos/2dust/v2rayN/releases?per_page=1")
    
    _pkgver=$(jq -r '.[0].tag_name' <<< $_json)

    _bin_url=`echo "$_json" | sed -n '/browser_download_url.*v2rayN-linux-64\.zip/p' | awk -F'"' '{print $4}'`

}

pkgver(){

    if [ -z "$_pkgver" ]; then
        echo "Can't get the package info from https://api.github.com/repos/2dust/v2rayN/releases?per_page=1"
        exit
    else
        echo "$_pkgver"
    fi

}

package() {

    # get the package
    filename=`basename $_bin_url`
    echo $_bin_url $filename
    curl -L -o $filename -C - $_bin_url && bsdtar -xf $filename # continuous transmission on the breakpoint if file exist.

    _app_name=$pkgname

    install -Dm644 "../v2rayN.png" -t "$pkgdir/usr/share/pixmaps"
    install -Dm644 "../v2rayN-bin.desktop" -t "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/opt/$_app_name"
    mv v2rayN-linux-64/* $pkgdir/opt/$_app_name/
    chmod -R 0777 $pkgdir/opt/$_app_name
}

_main
