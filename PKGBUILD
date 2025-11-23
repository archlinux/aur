# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="fritzbox-tools"
pkgver="0.47"
pkgrel="2"
pkgdesc="Manage FRITZ!Box devices via command line."
url="https://mengelke.de/Projekte/FritzBox-Tools"
license=("GPL-3.0-only")
install="$pkgname.download"
source=("fb_tools-$pkgver.txz::$url;fb_tools.txz")
_versionInfo="$(curl -sS "$url;fb_tools.md5")"
md5sums=("$(grep -oP "\S+(?= \*fb_tools.txz)" <<< "$_versionInfo")")
arch=("any")
backup=("opt/$pkgname/fb_config.json")
depends=("php>=4.4")
makedepends=("curl" "coreutils" "xxd" "bash")
provides=("$pkgname=$pkgver")
DLAGENTS=("https::./$pkgname.download %u %o")

pkgver()
{
    grep -oP "fb_tools \K[\d.]+" <<< "$_versionInfo"
}

prepare()
{
    mv -fv "fb_config.json" "fb_config.json.template"
}

build()
{
    echo "creating custom 'fb_config.json' to disable automatic updates"
    echo -e "{\n    upda: false,\n    uplink: false\n}" > "fb_config.json"
    ln -fsv "/opt/$pkgname/fb_tools.php" "fb_tools"
}

package()
{
    install -dv "$pkgdir"/{"opt/$pkgname","usr/bin"}
    cp -afv "fb_tools" "$pkgdir/usr/bin"
    cp -afv {"libs","plugins","fb_tools.php",*".json"*} "$pkgdir/opt/$pkgname"
}
