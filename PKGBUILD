# Maintainer: brave-prerelease <aur-prerelease@brave.com>
# Contributor: Greg White <gwhite@kupulau.com>

pkgname=brave-nightly-bin
pkgver=1.84.27
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

sha512sums_x86_64=('e814a4408edd174896191c9c3255fb1920c5bad42f3726b0bbf8c5dbb75d23ecea349e48a41f3835b449db2e089145f21e4f548dfde131539b8db17b6243e8de')
sha512sums_aarch64=('0e6c05471319b02fdecf3e56b92ca709cba484c17c9ecc077cc391979c21df2f7f5a7231e7ca7a66ffb4dadaf10e99f48df83ceb88536abed4fe76417b6f43de')

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
