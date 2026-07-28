# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Sander Jansen

pkgname=gogglesmm-git
pkgver=1.3.1.r1.g6f02ca9
pkgrel=1
pkgdesc="Music Manager and Player"
url="https://github.com/gogglesmm/gogglesmm"
license=(GPL-3.0-or-later)
arch=(x86_64 aarch64)
depends=(
    alsa-lib
    dbus
    faad2
    flac
    fontconfig
    freetype2
    glibc
    glu
    hicolor-icon-theme
    libepoxy
    libgcc
    libglvnd
    libice
    libjpeg-turbo
    libmad
    libogg
    libpulse expat
    libsm
    libstdc++
    libtiff
    libtiff
    libvorbis
    libwebp
    libx11
    libxcursor
    libxext
    libxfixes
    libxft
    libxi
    libxrandr
    libxrender
    openjpeg2
    openssl
    opus
    sndio
    sndio
    sqlite
    taglib
    zlib
    )
optdepends=(
    'libpulse: PulseAudio Output'
    )
makedepends=(
    cmake
    git
    libpulse
    )
conflicts=(gogglesmm)
replaces=(gogglesmm)
source=("git+https://github.com/gogglesmm/gogglesmm.git"
        "git+https://github.com/gogglesguy/fox.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "gogglesmm"
  git submodule init
  git config submodule.fox.url "${srcdir}/fox"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "gogglesmm"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  local _flags=(

  )

  cmake -B build -S "gogglesmm" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
