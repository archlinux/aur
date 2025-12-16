# Maintainer: brave-prerelease <aur-prerelease@brave.com>
# Contributor: Greg White <gwhite@kupulau.com>
# Contributor: whezzel <whezzel at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jacob Mischka <jacob@mischka.me>
# Contributor: Manuel Mazzuola <origin.of@gmail.com>

pkgname=brave-beta-bin
pkgver=1.86.116
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
sha512sums_x86_64=('8c4cca60d365617e40d9b0b889a595922290a7be2c7357958270ec8497af29073608e2dd4e0f4d6898c1f0e5ee868ae74fa35bb89fa41f5f9f02b4d81e0da027')
sha512sums_aarch64=('c6347f70af16dae8316934ac18575c6f82f710a6bad01cd8d569859df99752b8e68fb302afa1d801d878e575d4b389114fa1eedb51cec89676415b3b70a68ce3')

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
