# Maintainer: Ivan Gabaldon <aur[at]inetol[dot]net>

pkgname=mcreator-eap
_pkgname=mcreator
pkgver=2023.2.b22518
_pkgvermajor=2023.2
_pkgverbuild=22518
pkgrel=1
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE (EAP release)'
arch=('x86_64')
url='https://mcreator.net'
license=('custom')
conflicts=("$_pkgname")
noextract=("$_pkgname-$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/$_pkgvermajor.$_pkgverbuild/$_pkgname.EAP.$_pkgvermajor$_pkgverbuild.Linux.64bit.tar.gz"
        "$_pkgname.desktop")
b2sums=('acc7fba65226e404628ea154a4f6bb2b2f3e6f048cd0ffbbf0a5ae14f13151b5c3c91f8aed35d2db2e482dc999aa4a5e3a101c4b9aa6ae2f583bc9a72c92f359'
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
