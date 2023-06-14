# Maintainer: Ivan Gabaldon <aur[at]inetol.net>

pkgname=mcreator
pkgver=2023.2.24119
_pkgvermajor=2023.2
_pkgverbuild=24119
pkgrel=1
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE'
arch=('x86_64')
url='https://mcreator.net'
license=('custom')
conflicts=("$pkgname-eap")
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/releases/download/$pkgver/MCreator.$_pkgvermajor.Linux.64bit.tar.gz"
        "$pkgname.desktop")
b2sums=('95b646a1c7b51f32dcccd73082d96c65e8c89b9c32673acebf2684d260e173b43f50efe3d18c47a65084f8add17adb9c4dbcdf659717fc9595daeaf5e39a5e0f'
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
