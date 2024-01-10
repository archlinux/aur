# Maintainer: Ivan Gabaldon <aur[at]inetol.net>

pkgname=mcreator
_pkgvermajor=2023.4
_pkgverbuild=52316
pkgver=$_pkgvermajor.$_pkgverbuild
pkgrel=1
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE'
arch=('x86_64')
url='https://mcreator.net'
license=('custom:GPL-3.0-only')
conflicts=("$pkgname-eap")
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/releases/download/$pkgver/MCreator.$_pkgvermajor.Linux.64bit.tar.gz"
        "$pkgname.desktop")
b2sums=('4a67655d546822d4be99b675cac50e70497c842e64f4c753ae56b3fb54b5e1d227bece3ee396c2b14930a59d1861d4e8db8a9ca06cf850996e9d10d6c7e36219'
        '67706a22b6368301663f638d6b22eeee7a1f174a2757d3aaf68c520e8474b79af9afe3f1f36145e54487d50a9c94cac9bc4652fc1029475faeba194eb44afc18')

prepare() {
    mkdir -p "$pkgname-$pkgver/"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver/"

    ## Convert
    cd "$pkgname-$pkgver/"

    cat >"mcreator.sh"<<EOF
#!/usr/bin/env bash
export CLASSPATH="./mcreator/lib/mcreator.jar:./lib/*"

cd /opt/mcreator/
./jdk/bin/java --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "\$1"
EOF

    cp "$srcdir/$pkgname.desktop" "$pkgname.desktop"
}

package() {
    depends=('alsa-lib'
             'bash'
             'freetype2'
             'glibc'
             'hicolor-icon-theme'
             'libx11'
             'libxext'
             'libxi'
             'libxrender'
             'libxtst')

    install -d "$pkgdir/opt/$pkgname/"
    cp -a "$pkgname-$pkgver/." "$pkgdir/opt/$pkgname/"

    chmod 755 "$pkgdir/opt/$pkgname/$pkgname.sh"

    install -d "$pkgdir/usr/share/applications/"
    ln -s "/opt/$pkgname/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps/"
    ln -s "/opt/$pkgname/icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"

    install -Dm644 "$pkgname-$pkgver/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
