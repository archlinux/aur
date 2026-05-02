pkgname=soundcloud-desktop-bin
pkgver=7.2.0
pkgrel=1
pkgdesc="Native desktop app for Soundcloud.(unofficial)"
arch=('x86_64' 'aarch64')
url="https://github.com/zxcloli666/SoundCloud-Desktop"
license=('MIT')
depends=('webkit2gtk-4.1'
	 'libappindicator'
	 'gtk3')
backup=()

if [ "$CARCH" == "x86_64" ]; then
  _deb_arch="amd64"
elif [ "$CARCH" == "aarch64" ]; then
  _deb_arch="arm64"
fi

source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_${_deb_arch}.deb"
	"LICENSE::${url}/raw/refs/heads/main/LICENSE")

sha256sums=('acf0aad6ae7aa9786096637381cd9077419e2cb05d1254beed048ab992da323a'
            '3bed3331b7048bac17cf50e249d560ccc9508c970da8d7b9283bf4f2e633a91d')

build() {
  ar x "${pkgname%-bin}-${pkgver}.deb"
  tar -xf data.tar.gz
}

package() {
  install -Dm 755 "usr/bin/soundcloud-desktop" "$pkgdir/usr/bin/soundcloud-desktop"
  
  find "$srcdir/usr/share/icons" -type f | while read -r icon; do
    install -Dm 644 "$icon" "$pkgdir/${icon#$srcdir}"
  done
  
  install -Dm 644 "$srcdir/usr/share/applications/soundcloud-desktop.desktop" "$pkgdir/usr/share/applications/soundcloud-desktop.desktop"
  sed -i 's/^Name=.*/Name=SoundCloud Desktop/' "$pkgdir/usr/share/applications/soundcloud-desktop.desktop"
  
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
