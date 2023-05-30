# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-dev-bin
pkgver=1.53.72
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (dev binary release).'
arch=(x86_64 aarch64)
url='https://brave.com/download-dev'
license=('MPL2')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'mesa: Hardware accelerated rendering'
            'libglvnd: Support multiple different OpenGL drivers at any given time'
            'libgnome-keyring: gnome keyring support')
provides=("${pkgname}" 'brave-dev-browser')
conflicts=()
source=("MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
        "$pkgname.sh")
options=(!strip)
source_x86_64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-dev_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-dev_${pkgver}_arm64.deb")
sha512sums=('b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            '191500db5dd9692d362745e0055f9ac570c7ca2043edcf3e2eb9dcf8039615022f3459c909ed29d89410886481723d2d439086f1938249674ea32654819190c4')

sha512sums_x86_64=('e28b25f21f01cd139b932fd83c25e6830a8855242474ae27fac7841fb1027835e6668e09173b916a5f2830bd1be558662ff6b6f2af5a7653bb0c79a331fada2e')
sha512sums_aarch64=('f53e48a6a790cf1c0789e9d6f9cd95aa78d4f9289a6ef6c724d67ea6c6f3b6d10ccc110b273b97a53f11320e80a3324daf36b3653747f73894db05bf2cd307b9')

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
    # allow firejail users to get the suid sandbox working
    chmod 4755 "$pkgdir/opt/brave.com/brave-dev/chrome-sandbox"
}
