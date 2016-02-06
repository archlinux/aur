# Maintainer: aksr <aksr at t-com dot me>
pkgname=zbackup-git
pkgver=1.5.alpha.r30.g9aeb338
pkgrel=1
epoch=
pkgdesc="A versatile deduplicating backup tool."
arch=('i686' 'x86_64')
url="https://github.com/zbackup/zbackup"
url="http://zbackup.org/"
license=('GPL')
groups=()
depends=('xz' 'openssl' 'protobuf')
makedepends=('git' 'cmake')
optdepends=()
checkdepends=()
provides=('zbackup')
conflicts=('zbackup')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/zbackup/zbackup.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr; make

  cd tools/tartool
  cmake . -DCMAKE_INSTALL_PREFIX=/usr; make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md

  cd tools/tartool
  make DESTDIR="${pkgdir}" install

  cd $srcdir/$pkgname/licenses/
  for i in *; do
    install -Dm644 $i $pkgdir/usr/share/licenses/${pkgname%-*}/$i
  done
}

