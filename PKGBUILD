# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Angus Gibson <darthshrine@gmail.com>

pkgname=cfunge
pkgver=1,001
pkgrel=1
epoch=1
pkgdesc='Fast, small and standard conforming Befunge98 interpreter'
arch=('x86_64' 'i686' 'arm7h' 'aarch64')
url='https://github.com/VorpalBlade/cfunge'
license=('GPL3')
depends=('libbsd')
makedepends=('cmake' 'ninja' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/VorpalBlade/$pkgname/archive/$pkgver.tar.gz"
        'mycology::git+https://github.com/Deewiant/Mycology#commit=3787e42c3d4f0b735a09129a205e3e4df848558c')
sha256sums=('631f61abaeaf03a15a33c01cd98e8c4887087c16360084d45bf65feb60996f89'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname-${pkgver/,/-}/tests/mycology/"
  rm -rf src
  ln -s "$srcdir/mycolgy" src
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    "../$pkgname-${pkgver/,/-}"
  ninja
}

check() {
  cd "$srcdir/build"
  ctest -k0 -j8 --output-on-failure
}

package() {
  cd "$srcdir/build"
  DESTDIR="$pkgdir/" ninja install
}

# vim:set ts=2 sw=2 et:
