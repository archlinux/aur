# Maintainer: Ivan Gabaldon <aur[at]inetol[dot]net>

pkgname=mcreator
pkgver=2023.3.36712
_pkgvermajor=2023.3
_pkgverbuild=36712
pkgrel=1
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE'
arch=('x86_64')
url='https://mcreator.net'
license=('custom')
conflicts=("$pkgname-eap")
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/releases/download/$pkgver/MCreator.$_pkgvermajor.Linux.64bit.tar.gz"
        "$pkgname.desktop")
b2sums=('8ec1d468f7d7b833975f2d074faac64561da05f848cd2948f63c648d90a7cb1e4efac9153d346a97e99696ac74d4e70d6ea71fcb914551ac78794731c4fa832e'
        '21b7528275f3c0be5cf748e8dc34afdb6afc8017e9ce449b51f011276cc2058660ab7dbc0bdec4c19bf2f7a2b02843ee112955bda698d549bd2855a2fb7ce557')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver"

    mv "$pkgname-$pkgver/icon.png" "$srcdir"
    cat >"$pkgname-$pkgver/mcreator.sh"<<EOF
#!/usr/bin/env bash
export CLASSPATH="./mcreator/lib/mcreator.jar:./lib/*"

cd /opt/mcreator/
./jdk/bin/java --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "\$1"
EOF
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/"* "$pkgdir/opt/$pkgname"

    install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
