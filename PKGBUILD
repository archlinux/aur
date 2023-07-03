# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname=1oom-git
_pkgname=1oom
pkgver=r1047.813ab8df
pkgrel=1
pkgdesc="1oom is a Master of Orion (1993) game engine recreation."
arch=(x86_64)
url=https://gitlab.com/Tapani_/1oom
license=('GPL2')
depends=(sdl2 sdl2_mixer libsamplerate soundfont-fluid)
makedepends=(git)
provides=(1oom)
conflicts=(1oom)
source=(  'git+https://github.com/1oom-fork/1oom.git'
          '1oom_classic_sdl2.sh' )
md5sums=('SKIP'
         '41b52627b2d52b477adcbc2a9a627b37')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  autoreconf -fi
  test -d build-native || mkdir build-native
  cd build-native
  ../configure --prefix=/usr
  { test "$(nproc)" -gt 1 && make -j"$(nproc)" ;} || make
}

package() {
  cd "${srcdir}/${_pkgname}/build-native"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install

  # install docs
  cd "${srcdir}/${_pkgname}/doc"
  mkdir -p "$pkgdir/usr/share/doc/${_pkgname}"
  cp *.txt "$pkgdir/usr/share/doc/${_pkgname}/"
  cd ..
  cp AUTHORS CHANGES CHANGES-GIT CODE_OF_CONDUCT COMPILING COPYING HACKING NEWS PHILOSOPHY README.md "$pkgdir/usr/share/doc/${_pkgname}/"

  # create storage directory for MOO data
  mkdir -p "$pkgdir/usr/share/1oom"

  # install launch script
  mv "$pkgdir/usr/bin/1oom_classic_sdl2" "$pkgdir/usr/bin/1oom_classic_sdl2-bin"
  install -m 0755 "${srcdir}/1oom_classic_sdl2.sh" "$pkgdir/usr/bin/1oom_classic_sdl2"
}
