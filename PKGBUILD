# Maintainer: Ivan Gabaldon <aur[at]inetol.net>

pkgname=mcreator-eap
_pkgvermajor=2025.3
_pkgverbuild=33716
pkgver=$_pkgvermajor.$_pkgverbuild
pkgrel=1
pkgdesc='Make Minecraft Java Edition mods, Bedrock Edition Add-Ons, and data packs using visual graphical programming or integrated IDE (EAP release)'
arch=('x86_64')
url='https://mcreator.net'
license=('GPL-3.0-or-later')
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname//-eap}/${pkgname//-eap}/releases/download/$pkgver/MCreator.EAP.$pkgver.Linux.64bit.tar.gz"
        "${pkgname//-eap}.desktop")
b2sums=('183a2af3b69a0832de7c834233a67236c60bf21c71f0d144f0f26cc955d44d7653a38248947140084a7cf46f4a842f6764f3ba5f62711066769fc1c8f1a19196'
        '9743b439ba5916beb7784528d9128780d130578e6025abf6bcd637907c613b21d9b891ac11ce67b3cbad2e29289561ad24813dc6acef65290be4e7ab1a22ad47')

prepare() {
    mkdir -p "$pkgname-$pkgver/"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver/"

    # Convert
    cd "$pkgname-$pkgver/"

    cat >"mcreator.sh"<<EOF
#!/bin/sh
export CLASSPATH="./$pkgname/lib/mcreator.jar:./lib/*"

cd /opt/$pkgname/
"\$(find /usr/lib/jvm/ -maxdepth 1 -name '*21*' -type d -print -quit)/bin/java" --add-opens=java.base/java.lang=ALL-UNNAMED net.mcreator.Launcher "\$1"
EOF

    cp "$srcdir/${pkgname//-eap}.desktop" "${pkgname//-eap}.desktop"

    rm -rf jdk/
}

package() {
    depends=('glibc'
             'java-runtime=21')

    install -d "$pkgdir/opt/$pkgname/"
    cp -a "$pkgname-$pkgver/." "$pkgdir/opt/$pkgname/"

    chmod 755 "$pkgdir/opt/$pkgname/${pkgname//-eap}.sh"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/${pkgname//-eap}.sh" "$pkgdir/usr/bin/$pkgname"

    install -d "$pkgdir/usr/share/applications/"
    ln -s "/opt/$pkgname/${pkgname//-eap}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -d "$pkgdir/usr/share/icons/"
    ln -s "/opt/$pkgname/icon.png" "$pkgdir/usr/share/icons/$pkgname.png"
}
