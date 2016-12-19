# Maintainer: Kuldeep Singh Dhaka <kuldeepdhaka9@gmail.com>

pkgname=libbox0-git
_pkgname=libbox0
pkgver=61.7555f0e
pkgrel=1
pkgdesc="C library for communicating with Box0 implementations"
arch=('i686' 'x86_64')
url="https://www.madresistor.org/box0"
license=('GPL')
provides=(libbox0)
conflicts=(libbox0)
replaces=(libbox0)
source=("git+https://gitlab.com/madresistor/$_pkgname.git" "27-box0-v5.rules")
depends=('libusb')
makedepends=('cmake' 'git')
md5sums=('SKIP' '6eacc71be1f5f212d4976bab8ddd6a13')


pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git rev-list --count HEAD).$(git describe --always )"
}

prepare() {
  cd "$srcdir/$_pkgname"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "$srcdir/$_pkgname/build"
  # We are not building demo examples as they will not be installed
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DBUILD_DEMO=NO -DBUILD_SHARED_LIBS='TRUE' ..
  make
}

package() {
  install -Dm644 "$srcdir/27-box0-v5.rules" "$pkgdir/usr/lib/udev/rules.d/27-box0-v5.rules"
  make -C "$srcdir/$_pkgname/build" DESTDIR="${pkgdir}" install
}
