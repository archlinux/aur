# Maintainer: Iván Gabaldón <ivan.gab at inetol dot net>

pkgname=mcreator
pkgver=2022.2.34517
pkgrel=2
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE'
arch=('x86_64')
url='https://mcreator.net'
license=('GPL3')
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/releases/download/$pkgver/MCreator.2022.2.Linux.64bit.tar.gz"
        "$pkgname.desktop")
b2sums=('95a9b1572bf70687bbe354acc76513ffb79339500d9a48f675dd3a1c23b5d6a2ba69746215fad15056ec56700d469287b6f6a2b4b2c83a0f360dceac1de1c3c9'
        '8efa7edb9abe7b66a2a9482702e80cbebbcf390f8442daf280f9fd0e05610a831ab54fdedbf4bbe58662f4fdef4b5e7a15547883aaee006c35915a453dafb343')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver"
}

package() {
    cat >"$pkgname-$pkgver/mcreator.sh"<<EOF
#!/usr/bin/env bash
export CLASSPATH="./mcreator/lib/mcreator.jar:./lib/*"

cd /opt/mcreator/
./jdk/bin/java --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "\$1"
EOF

    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/"* "$pkgdir/opt/$pkgname"

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
