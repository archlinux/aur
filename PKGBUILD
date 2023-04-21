# Maintainer: Ruize Tang <1466040111@qq.com>
# Contributor: Denis Kasak <dkasak AT termina.org.uk>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Genki Sky <alt+archlinux.org@genki.is>

pkgname=tla-toolbox-nightly
pkgver=1.8.0.r8152.g4eb1b86
majorver=${pkgver%.r*}
pkgrel=1
pkgdesc='IDE for the TLA+ tools (nightly)'
options=(!strip)
arch=('x86_64')
url='https://github.com/tlaplus/tlaplus'
license=('MIT')
depends=('java-runtime>=8')
makedepends=('wget')
source=(icon.png
        tla+toolbox.xml
        tla+toolbox.desktop)

pkgver() {
    printf "${majorver}.r%s.g%s" \
        $(curl -v -k "https://api.github.com/repos/tlaplus/tlaplus/commits?per_page=1&sha=v${majorver}" 2>&1 | \
          sed -En -e '/^< [Ll]ink:/ s/.*"next".*page=([0-9]*).*"last".*/\1/p' -e '/sha/s/.*: "([a-z0-9]{7}).*",.*/\1/p' | head -n 2)
}

sha256sums=(51dbb6724fa7ff5167067dce68dd6b577a2401a47a37120a9879f0afd85ff7c9
            8380c475aa80f0cdbd4cc851ef09df513e14f74116a1a16183c5b7f122aee2fb
            d80e7686d162218996221bf5071cac3b1109c36d5655e6dd6bdfa29a405d3590)

package() {
    cd "$srcdir"
    wget -N "https://github.com/tlaplus/tlaplus/releases/download/v${majorver}/TLAToolbox-${majorver}-linux.gtk.x86_64.zip"
    bsdtar -xf "TLAToolbox-${majorver}-linux.gtk.x86_64.zip"
    install -d -m755 "$pkgdir/opt/TLA+Toolbox"
    mv "$srcdir"/toolbox/* "$pkgdir/opt/TLA+Toolbox/"
    install -d -m755 "$pkgdir/usr/bin"
    ln -s "/opt/TLA+Toolbox/toolbox" "$pkgdir/usr/bin/tla+toolbox"
    install -D -m644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/tla+toolbox.png"
    install -D -m644 "$srcdir/tla+toolbox.desktop" "$pkgdir/usr/share/applications/tla+toolbox.desktop"
    install -D -m644 "$srcdir/tla+toolbox.xml" "$pkgdir/usr/share/mime/packages/tla+toolbox.xml"
}
