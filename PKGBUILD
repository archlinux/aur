# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-dev-bin
pkgver=1.35.69
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (dev binary release).'
arch=('x86_64')
url='https://brave.com/download-dev'
license=('MPL2')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'mesa: Hardware accelerated rendering'
            'libglvnd: Support multiple different OpenGL drivers at any given time')
provides=("${pkgname}" 'brave-dev-browser')
conflicts=()
source=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-dev_${pkgver}_amd64.deb"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh")
options=(!strip)
sha512sums=('db3408c5ec1fa613e262e87c4d831b04e0657f9bd099cc1b6f230f96083487c0764c02f380f364f7e14a6b70dc76d32fb78a5fb61a29e567d1e1e43b0be0942d'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            'a133f9ea4bd1f50f375a6039187fa886c380d77f1e47528f8350e1f9fbc6e1e7a1c8baaa40f6126c32ad3b9df57c456374564d1e7d7cd4c027b5ff2e96aa358e')

prepare() {
  mkdir -p brave
  tar xf data.tar.xz -C brave
  # Delete unneeded cron job
  rm -rf brave/opt/brave.com/brave-dev/cron
  # Use our script to launch (allows overriding flags, sets up data dir)
  sed -i "s/\/usr\/bin\/brave-browser-dev/\/usr\/bin\/brave-dev/g" brave/usr/share/applications/brave-browser-dev.desktop    
}

package() {
    cp -a --reflink=auto brave/opt "$pkgdir/opt"
    cp -a --reflink=auto brave/usr "$pkgdir/usr"
    
    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-dev"
    install -Dm0644 "brave/opt/brave.com/brave-dev/product_logo_128_dev.png" "$pkgdir/usr/share/pixmaps/brave-browser-dev.png"

    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "brave/opt/brave.com/brave-dev/LICENSE"
    chmod 4755 "$pkgdir/opt/brave.com/brave-dev/chrome-sandbox"
}
