# Maintainer : Jeremy Lee Shields <jeremy.shields@orange.fr>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=aom-vmaf-git
pkgver=r31096.g962b35e8eb
pkgrel=1
pkgdesc="An open, royalty-free video coding format designed for video transmissions over the Internet with support for vmaf"
arch=('i686' 'x86_64')
url="https://aomedia.org/"
license=('BSD' 'custom:PATENTS')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'perl' 'yasm' 'doxygen' 'graphviz')
checkdepends=('python' 'vmaf')
provides=('aom')
conflicts=('aom')
source=("git+https://aomedia.googlesource.com/aom")
sha256sums=('SKIP')


pkgver() {
  cd "aom"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "aom"

  #curl -L "https://aomedia-review.googlesource.com/changes/aom~116821/revisions/4/patch?download" | base64 -d | patch -p1
  mkdir -p "_build" && cd "_build"
  sed -i 's/libvmaf.a//' ../CMakeLists.txt
  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCONFIG_TUNE_VMAF=1 \
    -DBUILD_SHARED_LIBS=1 \
    ../
  make
}

check() {
  cd "aom/_build"

  #make runtests
}

package() {
  cd "aom/_build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -R "docs/." "$pkgdir/usr/share/doc/$pkgname"

  install -Dm644 "$srcdir/aom/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/aom/PATENTS" "$pkgdir/usr/share/licenses/$pkgname/PATENTS"
}
