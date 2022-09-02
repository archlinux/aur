# Maintainer: Iván Gabaldón <contact|@|inetol.net>

pkgname=mcreator-bin
_pkgname=mcreator
pkgver=2022.2.34517
pkgrel=1
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE. (binary release)'
arch=('x86_64')
url='https://mcreator.net'
license=('GPL3')
depends=('jdk17-openjdk')
conflicts=("$_pkgname")
noextract=("$_pkgname-$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/$pkgver/MCreator.2022.2.Linux.64bit.tar.gz"
        "$_pkgname.desktop")
b2sums=('95a9b1572bf70687bbe354acc76513ffb79339500d9a48f675dd3a1c23b5d6a2ba69746215fad15056ec56700d469287b6f6a2b4b2c83a0f360dceac1de1c3c9'
        '0b3874460f649f8c133c9bf61c70889f96af26213356f3c2e5631e00a7f8afdbd2949a90b98c4da58c84cbe621c1e3860b00ac751f9229e48e822663d58c2416')

prepare() {
    mkdir -p "$_pkgname-$pkgver"
    bsdtar -xpf "$_pkgname-$pkgver.tar.gz" --strip-components=1 -C "$_pkgname-$pkgver"

    sudo rm -R "$_pkgname-$pkgver/jdk/" "$_pkgname-$pkgver/license/"

    # START Patch mcreator.sh
    cat >"$_pkgname-$pkgver/mcreator.sh"<<EOF
#!/usr/bin/env bash

export CLASSPATH='./lib/mcreator.jar:./lib/*'
/usr/lib/jvm/java-17-openjdk/bin/java --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "$1"
EOF
    # END
}

package() {
    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/$_pkgname-$pkgver/"* "$pkgdir/opt/$_pkgname"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
