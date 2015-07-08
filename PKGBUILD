# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=x265-hg
pkgver=1.7.r286.1162fb0b99f8
pkgrel=1
pkgdesc='CLI tools for encoding H265/HEVC video streams.'
arch=('i686' 'x86_64')
url='https://bitbucket.org/multicoreware/x265'
license=('GPL')
depends=('gcc-libs')
provides=('libx265' 'x265')
conflicts=('x265')
makedepends=('cmake' 'mercurial' 'yasm')
source=('hg+https://bitbucket.org/multicoreware/x265'
        'libx265_main10-soname.patch'
        'libx265_main12-soname.patch')
sha256sums=('SKIP'
            '8cd78f04ef35c2edc3319da4c1d98a3273d23581cb8dc80b7a87f3a888831068'
            '343364f7bd230b80c2e1d3e273616032392ddb3c5b97f0a6734e8222ed2cb938')

pkgver() {
  cd x265

  echo "$(hg log -r. --template "{latesttag}").r$(hg log -r. --template "{latesttagdistance}").$(hg log -r. --template "{node|short}")"
}

prepare() {
  cp -r x265 x265-12bit
  cp -r x265 x265-10bit

  cd x265-12bit

  patch -Np1 -i ../libx265_main12-soname.patch

  cd ../x265-10bit

  patch -Np1 -i ../libx265_main10-soname.patch
}

build() {
  cd x265-12bit

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake ../source \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DHIGH_BIT_DEPTH='TRUE' \
    -DMAIN12='TRUE' \
    -DENABLE_SHARED='TRUE'
  make

  cd ../../x265-10bit

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake ../source \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DHIGH_BIT_DEPTH='TRUE' \
    -DENABLE_SHARED='TRUE'
  make

  cd ../../x265

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake ../source \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_SHARED='TRUE'
  make
}

package() {
  cd x265-12bit/build

  make DESTDIR="${pkgdir}" install

  cd ../../x265-10bit/build

  make DESTDIR="${pkgdir}" install

  cd ../../x265/build

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/lib/libx265.a
}

# vim: ts=2 sw=2 et:
