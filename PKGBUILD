# Contributor: Greg White <gwhite@kupulau.com>
# Maintainer: Greg White <gwhite@kupulau.com>

pkgname=brave-nightly-bin
pkgver=1.23.19
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default (nightly binary release).'
arch=('x86_64')
url='https://brave.com/download-nightly'
license=('MPL2')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'mesa: Hardware accelerated rendering'
            'libglvnd: Support multiple different OpenGL drivers at any given time'
	    'libgnome-keyring: gnome keyriung support')
provides=("${pkgname}" 'brave-nightly-browser')
conflicts=()
source=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/brave-browser-nightly_${pkgver}_amd64.deb"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.sh")
options=(!strip)
sha512sums=('f8c8b6d90b67289cec9b8121da86638d2ed3efd4b7f8082585ec16234f6573ee7c0740e8f0f60eff4a134f184a51453924e0cf1c1a8711a640d9709e5661f812'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            '47e79d6adf223a620de3d875f082c7d176c3bc25bb9a35d90dd646bd9072d0b7cff7a7deea7b163d9d0c326ac133eab9024ae1a1351d55be40fd40622b023e5a')

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
}
