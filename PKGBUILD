# Maintainer: Matthew Zilvar <mattzilvar@gmail.com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Modified PKGBUILD from https://aur.archlinux.org/packages/vivaldi/
pkgname=vivaldi-arm64
pkgver=2.2.1388.37
pkgrel=1
pkgdesc="A new browser for our friends. Vivaldi browser is made with power users in mind by people who love the Web."
arch=('aarch64')
url="https://vivaldi.com"
license=('custom')
groups=('')
depends=('alsa-lib>=1.0.16' 'atk>=1.12.4' 'at-spi2-atk>=2.5.3' 'at-spi2-core>=2.9.90' 'bash-completion' 'ca-certificates' 'cairo>=1.6.0' 'dbus>=1.0.2' 'desktop-file-utils' 'expat>=2.0.1' 'gdk-pixbuf2>=2.22.0' 'glib2>=2.31.8' 'gtk3>=3.9.10' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups>=1.4.0' 'libutil-linux>=2.16' 'libx11>=1.4.99.1' 'libxcb>=1.6' 'libxcomposite>=0.3' 'libxcursor>1.1.2' 'libxdamage>=1.1' 'libxext' 'libxfixes' 'libxi>=1.2.99.4' 'libxrandr>=1.2.99.3' 'libxrender' 'libxss' 'libxtst' 'nspr>=4.9' 'nss>=3.22' 'pango' 'qmmp' 'ttf-liberation' 'xdg-utils>=1.0.2')
makedepends=('w3m')
optdepends=('')
provides=('www-browser')
options=('!strip' '!emptydirs')
source=("https://downloads.vivaldi.com/stable/vivaldi-stable_${pkgver}-${pkgrel}_arm64.deb")
sha256sums=('c63659de1233346833f155fae73bf7fc60e61d6b3bb1c08d46c6d717d56d778d')

prepare() {
 tar -xf data.tar.xz
}

package() {
    cp -a {opt,usr} "$pkgdir"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

    # make /usr/bin/vivaldi-stable available
    binf="$pkgdir/usr/bin/vivaldi-stable"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/vivaldi/vivaldi "$binf"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
    done

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    strings "$pkgdir/opt/vivaldi/locales/en-US.pak" \
        | tr '\n' ' ' \
        | sed -rne 's/.*(<html lang.*>.*html>).*/\1/p' \
        | w3m -I 'utf-8' -T 'text/html' \
        > "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
}
