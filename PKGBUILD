# Maintainer: Iván Gabaldón <contact|@|inetol.net>

pkgname=mcreator-bin
_pkgname=mcreator
pkgver=2022.2.34517
pkgrel=2
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE (binary release)'
arch=('x86_64')
url='https://mcreator.net'
license=('GPL3')
depends=('jdk17-openjdk')
conflicts=("$_pkgname")
noextract=("$_pkgname-$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/$pkgver/MCreator.2022.2.Linux.64bit.tar.gz"
        "$_pkgname.desktop")
b2sums=('95a9b1572bf70687bbe354acc76513ffb79339500d9a48f675dd3a1c23b5d6a2ba69746215fad15056ec56700d469287b6f6a2b4b2c83a0f360dceac1de1c3c9'
        '87a8ceed3182adbdad76f6e8fad91ed524dc90dc06b1ca7122fe615b04b2a04e50c9dc1ba7d3fed19110a4fa63b245607007c0e1824ae6c89c34111b8cf76bb9')

prepare() {
    mkdir -p "$_pkgname-$pkgver"
    bsdtar -xpf "$_pkgname-$pkgver.tar.gz" --strip-components=1 -C "$_pkgname-$pkgver"
}

package() {
    rm -r "$_pkgname-$pkgver/jdk/"
    cat >"$_pkgname-$pkgver/mcreator.sh"<<EOF
#!/usr/bin/env bash

export CLASSPATH='./lib/mcreator.jar:./lib/*'
/usr/lib/jvm/java-17-openjdk/bin/java --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "\$1"
EOF

    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/$_pkgname-$pkgver/"* "$pkgdir/opt/$_pkgname"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
