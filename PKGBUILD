# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=x265-hg
pkgver=1.8.r179.942587f1ab44
pkgrel=1
pkgdesc='Open Source H265/HEVC video encoder'
arch=('i686' 'x86_64')
url='https://bitbucket.org/multicoreware/x265'
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'mercurial' 'yasm')
provides=('x265'
          'libx265.so')
conflicts=('x265')
source=('hg+https://bitbucket.org/multicoreware/x265')
sha256sums=('SKIP')

pkgver() {
  cd x265

  echo "$(hg log -r. --template "{latesttag}").r$(hg log -r. --template "{latesttagdistance}").$(hg log -r. --template "{node|short}")"
}

prepare() {
  cd x265

  for d in 8 $([[ $CARCH == 'x86_64' ]] && echo "10 12"); do
    if [[ -d build-$d ]]; then
      rm -rf build-$d
    fi
    mkdir build-$d
  done
}

build() {
  if [[ $CARCH == x86_64 ]]; then

    cd x265/build-12

    cmake ../source \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DHIGH_BIT_DEPTH='TRUE' \
      -DMAIN12='TRUE' \
      -DEXPORT_C_API='FALSE' \
      -DENABLE_CLI='FALSE' \
      -DENABLE_SHARED='FALSE'
    make

    cd ../build-10

    cmake ../source \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DHIGH_BIT_DEPTH='TRUE' \
      -DEXPORT_C_API='FALSE' \
      -DENABLE_CLI='FALSE' \
      -DENABLE_SHARED='FALSE'
    make

    cd ../build-8

    ln -s ../build-10/libx265.a libx265_main10.a
    ln -s ../build-12/libx265.a libx265_main12.a

    cmake ../source \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DENABLE_SHARED='TRUE' \
      -DEXTRA_LIB='x265_main10.a;x265_main12.a' \
      -DEXTRA_LINK_FLAGS='-L.' \
      -DLINKED_10BIT='TRUE' \
      -DLINKED_12BIT='TRUE'
    make

  else

    cd x265/build-8

    cmake ../source \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DENABLE_SHARED='TRUE'

  fi
}

package() {
  cd x265/build-8

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
