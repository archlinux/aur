# Maintainer: Ivan Gabaldon <aur[at]inetol[dot]net>

pkgname=mcreator-eap
_pkgname=mcreator
pkgver=2023.3.b26610
_pkgvermajor=2023.3
_pkgverbuild=26610
pkgrel=1
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE (EAP release)'
arch=('x86_64')
url='https://mcreator.net'
license=('custom')
conflicts=("$_pkgname")
depends=("java-runtime=17" "jdk17-openjdk")
noextract=("$_pkgname-$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/$_pkgvermajor.$_pkgverbuild/$_pkgname.EAP.$_pkgvermajor$_pkgverbuild.Linux.64bit.tar.gz"
        "$_pkgname.desktop")
b2sums=('04b7a38e54e8b423bb35a5ba3292d512a165cfe75ca2646ad62b4d84b59e1e4ab21761e756a3f18990274266d6e38752a14ade4d48818f285dff9348314344c7'
        '8efa7edb9abe7b66a2a9482702e80cbebbcf390f8442daf280f9fd0e05610a831ab54fdedbf4bbe58662f4fdef4b5e7a15547883aaee006c35915a453dafb343')

prepare() {
    mkdir -p "$_pkgname-$pkgver"
    bsdtar -xpf "$_pkgname-$pkgver.tar.gz" --strip-components=1 -C "$_pkgname-$pkgver"
}

package() {
    rm -r "$srcdir/$_pkgname-$pkgver/"{jdk/,license/OpenJDK*.txt}

    cat >"$srcdir/$_pkgname-$pkgver/mcreator.sh"<<EOF
#!/usr/bin/env bash
export CLASSPATH="./mcreator/lib/mcreator.jar:./lib/*"

cd /opt/mcreator/
/usr/lib/jvm/java-17-openjdk/bin/java --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "\$1"
EOF

    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/$_pkgname-$pkgver/"* "$pkgdir/opt/$_pkgname"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
