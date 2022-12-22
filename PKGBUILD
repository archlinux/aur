# Maintainer: Ivan Gabaldon <ivan [d0t] gab [at] inetol [d0t] net>

pkgname=mcreator-eap
_pkgname=mcreator
pkgver=2022.4.b52117
_pkgvermajor=2022.4
_pkgverbuild=52117
pkgrel=1
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE (EAP release)'
arch=('x86_64')
url='https://mcreator.net'
license=('custom')
conflicts=("$_pkgname")
noextract=("$_pkgname-$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/$_pkgvermajor.$_pkgverbuild/$_pkgname.EAP.$pkgver.Linux.64bit.tar.gz"
        "$_pkgname.desktop")
b2sums=('6c130fef06f56b6cf577a35658f0228cd2c2122ebd7f05046735d9763e00ae5287e2c8f1492f30dd728b7c0957cee09d150945aaec710fa8bb6b89058a33e70d'
        '8efa7edb9abe7b66a2a9482702e80cbebbcf390f8442daf280f9fd0e05610a831ab54fdedbf4bbe58662f4fdef4b5e7a15547883aaee006c35915a453dafb343')

prepare() {
    mkdir -p "$_pkgname-$pkgver"
    bsdtar -xpf "$_pkgname-$pkgver.tar.gz" --strip-components=1 -C "$_pkgname-$pkgver"
}

package() {
    cat >"$_pkgname-$pkgver/mcreator.sh"<<EOF
#!/usr/bin/env bash
export CLASSPATH="./mcreator/lib/mcreator.jar:./lib/*"

cd /opt/mcreator/
./jdk/bin/java --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "\$1"
EOF

    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/$_pkgname-$pkgver/"* "$pkgdir/opt/$_pkgname"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
