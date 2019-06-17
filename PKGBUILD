# Contributor: thomas berryhill (oats) thomasberryhill@protonmail.ch
# Maintainer: aksr <aksr at t-com dot me>
pkgname=xbps-git
pkgver=0.51.r379.g59dffd76
pkgrel=1
pkgdesc="(Void Linux's) The X Binary Package System"
arch=('i686' 'x86_64')
url="https://github.com/void-linux/xbps"
license=('custom:2-clause-BSD')
depends=('ca-certificates' 'libarchive')
makedepends=('zlib' 'openssl' 'git')
source=("$pkgname::git+https://github.com/void-linux/xbps.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  ./configure --prefix=/usr --sysconfdir=/etc
  sed -i '/-Werror/d' config.mk
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE.3RDPARTY "$pkgdir/usr/share/licenses/$pkgname/LICENSE.3RDPARTY"
}

