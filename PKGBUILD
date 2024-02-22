# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-beta-bin
pkgver=1.64.82
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (beta binary release).'
arch=(x86_64 aarch64)
url='https://brave.com/download-beta'
license=('MPL2')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'mesa: Hardware accelerated rendering'
            'libglvnd: Support multiple different OpenGL drivers at any given time'
	    'libgnome-keyring: gnome keyriung support')
provides=("${pkgname}" 'brave-beta-browser')
conflicts=()
source=("brave-beta-bin.sh")
source_x86_64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-beta_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-beta_${pkgver}_arm64.deb")
sha512sums=('56be4daa8294c7c3d4b3f1ce7169ac575be0faa623d7cd977eb135e971914b90e3f596ecad72d89178de04e65cd3d49c138e8518d1dccf9fc814d0858b38767e')
sha512sums_x86_64=('f279d4b9f1688a41bb46bc4eb29a45008001a7ae1f6104364e4c967a13fadbb92adf351038eff0c6f50f8fa02fe6126b914c46263a3d2ace21bc3caf74293412')
sha512sums_aarch64=('390dbec778642af09eba91360b705b92f517436fe173b857258baf0117a66d5418af598c1c8033c35488d25dd8c0466582aaaebedcf72d660d7e7bb7e01ea674')

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
