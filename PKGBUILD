# Maintainer: vpertys
# Modified based on libcava and cava-git

pkgname=libcava-git
pkgver=r965.ca02eef
pkgrel=1
pkgdesc='Fork to provide cava as a shared library, e.g. used by waybar. Cava is not provided as executable. (GIT)'
arch=('x86_64')
url='https://github.com/LukashonakV/cava'
license=('MIT')
provides=('libcava')
conflicts=('libcava')
depends=(
    'fftw'
    'ncurses'
    'alsa-lib'
    'iniparser'
    'libglvnd'
    'sdl2'
    'portaudio'
    'sndio'
    'libpulse'
    'libpipewire'
)
makedepends=(
    'base-devel'
    'cmake'
    'git'
    'meson'
    'autoconf-archive'
)
source=("${pkgname}::git+https://github.com/LukashonakV/cava.git")
sha1sums=('SKIP')
options=('!buildflags')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    meson setup \
          --prefix=/usr \
          -Dbuild_target=lib \
          build

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
