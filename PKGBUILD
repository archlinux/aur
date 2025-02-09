# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="fritzbox-tools"
pkgver=0.44
pkgrel=2
pkgdesc="A tool to manage FRITZ!Box devices via command line."
url="https://mengelke.de/Projekte/FritzBox-Tools"
license=("GPL-3.0-only")
source=("fb_tools-$pkgver.txz::$url;fb_tools.txz")
_versionInfo="$(curl -sS "$url;fb_tools.md5")"
md5sums=("$(grep -oP "\S+(?= \*fb_tools.txz)" <<< "$_versionInfo")")
arch=("any")
backup=("opt/fritzbox-tools/fb_config.json")
depends=("php>=4.4")
makedepends=("curl" "coreutils" "tinyxxd")
provides=("fritzbox-tools=$pkgver")
DLAGENTS=("https::./downloader.sh %u %o")

pkgver()
{
    grep -oP "fb_tools \K[\d.]+" <<< "$_versionInfo"
}

build()
{
    mv -fv "fb_config.json" "fb_config.json.template"
    echo "creating custom 'fb_config.json' to disable automatic updates"
    echo -e "{\n    upda: false,\n    uplink: false\n}" > "fb_config.json"
    ln -fsv "/opt/fritzbox-tools/fb_tools.php" "fb_tools"
}

package()
{
    install -dv "$pkgdir"/{opt/fritzbox-tools,usr/bin}
    cp -afv "fb_tools" "$pkgdir/usr/bin"
    cp -afv {"libs","plugins","fb_tools.php",*".json"*} "$pkgdir/opt/fritzbox-tools"
}
