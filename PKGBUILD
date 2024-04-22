# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-nightly-bin
pkgver=1.67.30
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (nightly binary release).'
arch=(x86_64 aarch64)
url='https://brave.com/download-nightly'
license=('MPL2')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'mesa: Hardware accelerated rendering'
            'libglvnd: Support multiple different OpenGL drivers at any given time'
            'libgnome-keyring: gnome keyring support')
provides=("${pkgname}" 'brave-nightly-browser')
conflicts=()
source=("$pkgname.sh")
options=(!strip)
source_x86_64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-nightly_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-nightly_${pkgver}_arm64.deb")
sha512sums=('191500db5dd9692d362745e0055f9ac570c7ca2043edcf3e2eb9dcf8039615022f3459c909ed29d89410886481723d2d439086f1938249674ea32654819190c4')

sha512sums_x86_64=('9c2c87628c951ca4a33e4d14211b097f8e1ea6e82f25008ce305db5e2397db7161758965917babb887dc54efab8dd31a2583d350a028e75c315c751a6ef4032f')
sha512sums_aarch64=('7a17d012dc461c5c8fd157b705cd0ca8d33a33ec08ab261f1d82f3d3b492dd0a18c64316f6b1b6087c21752b57a6430c0d12f60e137dfdbf9b82655cd2db5e89')

prepare() {
  mkdir -p brave
  tar xf data.tar.xz -C brave
  # Delete unneeded cron job
  rm -rf brave/opt/brave.com/brave-nightly/cron
  # Use our script to launch (allows overriding flags, sets up data dir)
  sed -i "s/\/usr\/bin\/brave-browser-nightly/\/usr\/bin\/brave-nightly/g" brave/usr/share/applications/brave-browser-nightly.desktop
}

package() {
    cp -a --reflink=auto brave/opt "$pkgdir/opt"
    cp -a --reflink=auto brave/usr "$pkgdir/usr"
    
    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/brave-nightly"
    install -Dm0644 "brave/opt/brave.com/brave-nightly/product_logo_128_nightly.png" "$pkgdir/usr/share/pixmaps/brave-browser-nightly.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "brave/opt/brave.com/brave-nightly/LICENSE"
    # allow firejail users to get the suid sandbox working
    chmod 4755 "$pkgdir/opt/brave.com/brave-nightly/chrome-sandbox"
}
