# Maintainer: Iván Gabaldón <contact|@|inetol.net>

pkgname=mcreator
pkgver=2022.2.34517
pkgrel=1
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE'
arch=('x86_64')
url='https://mcreator.net'
license=('GPL3')
depends=('jdk17-openjdk')
conflicts=("$pkgname-bin")
noextract=("$pkgname-source.tar.gz")
source=("$pkgname-source.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop")
b2sums=('a14c4f584d115c63349f7820565f1bcfb1aff4db883e104a06479aa81830a6129d670c6954e2d6768cdf20ce4d1f8ccbfdfe3e9f3aa2b8e0cf28ec2a818c6a46'
        '4078f75e36918bd2759d2194a9c376eacbe3549137474991548ccfd7afe02f0c122ba8ac3959b9455dfdc2d1d73f0eb7650f18522e21e502f50b86b85164faaf')

prepare() {
    mkdir -p "$pkgname-$pkgver" "$pkgname-source"
    bsdtar -xpf "$pkgname-source.tar.gz" --strip-components=1 -C "$pkgname-source"
}

build() {
    cd "$pkgname-source"

    ./gradlew exportLinux
    bsdtar -xpf "build/export/MCreator 2022.2 Linux 64bit.tar.gz" --strip-components=1 -C "../$pkgname-$pkgver"
}

package() {
    rm -r "$srcdir/$pkgname-$pkgver/jdk/"
    cat >"$srcdir/$pkgname-$pkgver/mcreator.sh"<<EOF
#!/usr/bin/env bash

export CLASSPATH='./lib/mcreator.jar:./lib/*'
/usr/lib/jvm/java-17-openjdk/bin/java --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "\$1"
EOF

    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/"* "$pkgdir/opt/$pkgname"

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
