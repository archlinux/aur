# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
# Contributor: iamawacko <iamawacko@protonmail.com>
# Contributor: Nep_Nep <nepnep91 at child dot pizza>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=simplex-desktop-bin
pkgver=7.1.4
pkgrel=1
pkgdesc='SimpleX Chat, the first messaging network operating without user identifiers of any kind (pre-compiled)'
arch=('x86_64')
provides=('simplex-desktop')
conflicts=('simplex-desktop')
url='https://simplex.chat/'
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.deb::https://github.com/simplex-chat/simplex-chat/releases/download/v$pkgver/simplex-desktop-ubuntu-22_04-x86_64.deb")
# SHA512 digest taken from release page on Microsoft GitHub
sha512sums=('2ab04b32564392d507e12a7b42742501ff781e8a8bd65254a81bb2d592555e1dcba31207fcb98f873fe1367bf83d00082c5552a6d6536311df8a5cc5c434d63c')

depends=(
    'alsa-lib'
    'e2fsprogs'
    'fontconfig'
    'freetype2'
    'fribidi'
    'gmp'
    'harfbuzz'
    'jack'
    'java-runtime'
    'libdrm'
    'libglvnd'
    'libgpg-error'
    'libusb'
    'libx11'
    'libxcb'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
    'openssl'
    'xdg-utils'
    'zlib'
    'zstd'
)


options=('!debug' '!strip')


package() {
    cd "$srcdir"

    tar --zstd -xvf data.tar.zst -C "$pkgdir"

    mkdir -p "$pkgdir/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "$pkgdir/usr/share/applications/simplex.desktop"

 sed -i 's|^Exec=/opt/simplex/bin/simplex|Exec=/usr/bin/simplex-desktop|' "$pkgdir/opt/simplex/lib/simplex-simplex.desktop"

    # Upstream bundles its own zstd, which collides with the zstd that openssl >= 3.6.2-2 pulls in
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/simplex-desktop" <<'EOF'
#!/bin/sh
export LD_PRELOAD="/usr/lib/libzstd.so${LD_PRELOAD:+:$LD_PRELOAD}"
exec /opt/simplex/bin/simplex "$@"
EOF
}
