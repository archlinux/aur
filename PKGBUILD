pkgname="ctr-modsdk-pc-git"
pkgver=r11.r3273.gfb5ea06
pkgrel=1
pkgdesc="PC re-implementation of Crash Team Racing (engine only, 32-bit for now)"
url='https://github.com/CTR-tools/CTR-ModSDK'
license=('MIT') # I asked the Project Maintainer (Niko)
options=('!buildflags')
arch=('x86_64')
makedepends=('cmake' 'git')
depends=('lib32-sdl2' 'lib32-openal' 'lib32-glibc')
source=("$pkgname::git+$url.git"
  "psycross::git+https://github.com/OpenDriver2/PsyCross.git#commit=0ce306d6c32412986037e7e5e1dbdc1bf72e066a"
  )
sha512sums=('SKIP' 'SKIP')


pkgver() {
  cd $pkgname
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.rebuild_PC/thirdparty/PsyCross.url "$srcdir/psycross"
  git config submodule.rebuild_PC/thirdparty/SDL.active false
  git config submodule.rebuild_PC/thirdparty/openal-soft.active false
  git config submodule.externals/externals/enet.active false
  git -c protocol.file.allow=always submodule update
}

build() {
  _FLAGS='-m32 -Wno-incompatible-pointer-types -Wno-implicit-function-declaration -Wno-return-mismatch -Wno-int-conversion'
  export CC="gcc $_FLAGS"
  export CXX="g++ $_FLAGS"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -B build -S "$pkgname/rebuild_PC" -DCMAKE_BUILD_TYPE='Release' \
    -DCTR_60FPS=OFF \
    -DCTR_16BY9=OFF \
    -DCTR_NEW2P=OFF \
    -DCTR_OXIDE=OFF \
    -DCTR_PENTA=OFF \
    -DCTR_HARDER=OFF \
    -DCTR_NEWCUPS=OFF \
    -DCTR_BOOSTBAR=OFF \
    -DCTR_RAMEX=OFF \
    -DCMAKE_VERBOSE_MAKEFILE=TRUE
  cmake --build build
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -m755 build/CrashTeamRacingPC "$pkgdir/usr/bin/CrashTeamRacingPC"
}
