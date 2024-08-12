pkgname=hostapd-wpe-fork
_pkgname=hostapd
pkgver=2.9.1
_pkgver=2.9
pkgrel=3
pkgdesc='Modified hostapd to facilitate AP impersonation attacks.'
arch=('x86_64' 'aarch64')
url='https://w1.fi/hostapd/'
license=('BSD')
depends=('libnl' 'sqlite')
conflicts=('hostapd-wpe')
source=("https://w1.fi/releases/$_pkgname-$_pkgver.tar.gz"
        "https://patches.aircrack-ng.org/wpe/hostapd-wpe/hostapd-wpe.patch")
#        "https://raw.githubusercontent.com/aircrack-ng/aircrack-ng/master/patches/wpe/hostapd-wpe/hostapd-wpe.patch")
install="hostapd-wpe.install"
sha512sums=('66c729380152db18b64520bda55dfa00af3b0264f97b5de100b81a46e2593571626c4bdcf900f0988ea2131e30bc8788f75d8489dd1f57e37fd56e8098e48a9c'
            'c1ef9f6b9b3d3d04fa98fb9568acc45a5c52a00411a5ebbbf3a80835cc27f6cdc5003343f37964fbac2c7c1fefffdf999d620f0e39797c0c37030090735526a5')

prepare() {
  cd "$_pkgname-$_pkgver"

    # Check if openssl-1.0 is installed
  if ! pacman -Qi openssl-1.0 &> /dev/null; then
    # Print the error message in red
    echo -e "\033[0;31m Error: openssl-1.0 is not installed.\033[0m"
    echo -e "Please install openssl-1.0 using one of the following methods:"
    echo -e "  Using paru: paru -S openssl-1.0"
    echo -e "  Using yay:  yay -S openssl-1.0"
    echo -e "  Or, you can install it manually by cloning the AUR repository and using makepkg:"
    echo -e "    git clone https://aur.archlinux.org/openssl-1.0.git"
    echo -e "    cd openssl-1.0"
    echo -e "    makepkg -si"
    exit 1
  fi

  patch -p1 -i "$srcdir/hostapd-wpe.patch"
}

build() {
  cd "$_pkgname-$_pkgver/$_pkgname"

  make
}

package() {
  cd "$_pkgname-$_pkgver/$_pkgname"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" wpe

  install -Dm 644  "$srcdir/$_pkgname-$_pkgver/COPYING" \
    "$pkgdir/usr/share/licenses/hostapd-wpe/COPYING"

  mv "$pkgdir/usr/local/bin" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/local"
}
