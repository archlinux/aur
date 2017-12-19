# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: jlvsimoes <jlvsimoes@oninet.pt>

pkgname=crypto++-git
pkgver=20160916
pkgrel=2
pkgdesc="C++ Class Library of Cryptographic Schemes"
arch=('i686' 'x86_64')
depends=('gcc-libs')
makedepends=('git' 'make')
url="https://github.com/weidai11/cryptopp"
license=('custom:Boost')
source=(${pkgname%-git}::git+https://github.com/weidai11/cryptopp
        'libcrypto++.pc')
sha256sums=('SKIP'
            'a5e467460494a97ada513a0c22f735cf5aade9cec75e0b4c46055ecd4b32fea6')
provides=('crypto++')
conflicts=('crypto++')

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Fixing GNUmakefile...'
  sed -i 's/^CXXFLAGS/#CXXFLAGS/' GNUmakefile
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  export CXXFLAGS="$CXXFLAGS -DNDEBUG -fPIC"
  make -j$_nproc dynamic static
}

check() {
  cd ${pkgname%-git}

  msg2 'Testing...'
  make -j$_nproc test
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 License.txt -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing pkgconfig file...'
  install -Dm 644 "$srcdir/libcrypto++.pc" -t "$pkgdir/usr/lib/pkgconfig"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" PREFIX=/usr install

  msg2 'Cleaning up pkgdir...'
  rm -rf "$pkgdir/usr/bin"
}
