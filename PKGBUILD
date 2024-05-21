# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-beta-bin
pkgver=1.67.90
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (beta binary release).'
arch=(x86_64 aarch64)
url='https://brave.com/download-beta'
license=('MPL2')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'mesa: Hardware accelerated rendering'
            'libglvnd: Support multiple different OpenGL drivers at any given time'
	    'libgnome-keyring: gnome keyriung support')
provides=("${pkgname}" 'brave-beta-browser')
conflicts=()
source=("brave-beta-bin.sh")
source_x86_64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-beta_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-beta_${pkgver}_arm64.deb")
sha512sums=('56be4daa8294c7c3d4b3f1ce7169ac575be0faa623d7cd977eb135e971914b90e3f596ecad72d89178de04e65cd3d49c138e8518d1dccf9fc814d0858b38767e')
sha512sums_x86_64=('c67ac99766258925830a18b0c69c163fd95ea0c5d744b19800d5f61e184dbfe921b36c6db3efff3d146354182a7071dd978fb5981b192920a986fff657da9420')
sha512sums_aarch64=('42692e7490f2750f9a9831006b6b6761c6c05cff785b8f63d071c4b9758192dae4ba623dcfe490617ca9fca41f161ca630e36dc7a18bd8e5adea2e5ed30f0f1b')

options=(!strip)

prepare() {
  mkdir -p brave
  tar xf data.tar.xz -C brave
  # Delete unneeded cron job
  rm -rf brave/opt/brave.com/brave-beta/cron
  # Use our script to launch (allows overriding flags, sets up data dir)
  sed -i "s/\/usr\/bin\/brave-browser-beta/\/usr\/bin\/brave-beta/g" brave/usr/share/applications/brave-browser-beta.desktop    
}

package() {
    cp -a --reflink=auto brave/opt "$pkgdir/opt"
    cp -a --reflink=auto brave/usr "$pkgdir/usr"
    
    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-beta"
    install -Dm0644 "brave/opt/brave.com/brave-beta/product_logo_128_beta.png" "$pkgdir/usr/share/pixmaps/brave-browser-beta.png"

    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "brave/opt/brave.com/brave-beta/LICENSE"
    chmod 4755 "$pkgdir/opt/brave.com/brave-beta/chrome-sandbox"
}
