# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-dev-bin
pkgver=1.54.79
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
            'a133f9ea4bd1f50f375a6039187fa886c380d77f1e47528f8350e1f9fbc6e1e7a1c8baaa40f6126c32ad3b9df57c456374564d1e7d7cd4c027b5ff2e96aa358e')

sha512sums_x86_64=('0ab0f90ae9057fe023eb9eab84509636d934f559725e1953aebf1b09b1c65376fd439bf09bb1feb9640034b01a34f12ef350d71b670c581413642ac130bc19cc')
sha512sums_aarch64=('489ba684c074a06104a02004be94b969f49a4c46a507a2ba0cf396e911a258837cb57e6877db8634d3062ea496ba5cc59f35ec3ef8d2cc84285483dfab81d7bf')

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
