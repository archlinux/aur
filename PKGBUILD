# Maintainer: Abdelhakim Qbaich <abdelhakim@qbaich.com>
# Contributor: korjjj <korjjj+aur@gmail.com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Adam Ehlers Nyholm Thomsen <adament@gmail.com>
# Contributor: Nathan Jones <nathanj@insightbb.com>

pkgname=ledger
pkgver=3.1.1
pkgrel=3
pkgdesc='Double-entry accounting system with a command-line reporting interface'
arch=('i686' 'x86_64')
url='http://ledger-cli.org'
license=('BSD')
depends=('python2' 'boost' 'libedit')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ledger/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname-boost-1.61.patch::https://github.com/ledger/$pkgname/commit/1856b8c4902498843f4da37a7aaeb2ce85acc1d3.patch")
sha256sums=('90f06561ab692b192d46d67bc106158da9c6c6813cc3848b503243a9dfd8548a'
            '3fe6750973d1ac10c822735759b35f362a68afb3dfa9887aaa7d83839a9e99eb')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i '/enable_testing()\|add_subdirectory(test)/d' CMakeLists.txt
  patch -p1 -i "$srcdir/$pkgname-boost-1.61.patch"
}

build() {
  cd "$pkgname-$pkgver"
  cmake . \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
  -DCMAKE_INSTALL_LIBDIR:PATH=lib \
  -DUSE_PYTHON:BOOL=TRUE \
  -DDISABLE_ASSERTS:BOOL=TRUE \
  -DBUILD_EMACSLISP:BOOL=TRUE
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
