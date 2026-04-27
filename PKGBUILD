# Maintainer: iTrooz_ <aur at itrooz dot fr>
pkgname=reko-bin
_pkgname=reko
pkgver=0.12.2
pkgrel=1
pkgdesc='A binary decompiler. Note: this package does not automatically update'
arch=('x86_64')
url='https://github.com/uxmal/reko'
license=('GPL-2.0-only')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('dotnet-runtime-8.0')
makedepends=('curl' 'unzip' 'jq')
SRC=https://api.github.com/repos/uxmal/reko/releases/latest
source=("$_pkgname::$SRC"
        "reko.sh")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    curl -sL "$SRC" | jq -r '.tag_name | ltrimstr("version-")'
}

prepare() {
    _url=$(curl -sL "$SRC" | jq -r '.assets[] | select(.name | test("CmdLine.*x64.*\\.zip")) | .browser_download_url')
    msg2 "Downloading $_url..."
    curl -sL "$_url" -o "${srcdir}/CmdLine.zip"
    cd "$srcdir" && unzip -o CmdLine.zip
}

package() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    (cd "$pkgdir/opt/$_pkgname/" && unzip -q "${srcdir}/CmdLine.zip")
    rm "${pkgdir}/opt/$_pkgname/"*.pdb

    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/reko.sh" "$pkgdir/usr/bin/$_pkgname"

    chmod -R u+rwX,go+rX,go-w "$pkgdir/opt/$_pkgname"
}