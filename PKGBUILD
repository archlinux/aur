# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=fluidsynth2-compat
_reponame=fluidsynth
pkgver=2.1.7
pkgrel=2
pkgdesc="Provides libfluidsynth.so.2 (2.3.7) of fluidsynth2, needed for tuxguitar"
arch=('x86_64')
url="https://www.fluidsynth.org/"
license=('LGPL2.1')
groups=('pro-audio')
depends=('fluidsynth')
makedepends=('glibc' 'sdl2' 'alsa-lib' 'cmake' 'dbus' 'doxygen' 'glib2' 'jack' 'ladspa'
'libinstpatch' 'libpulse' 'libsndfile' 'portaudio' 'readline' 'systemd-libs')
source=("$_reponame-$pkgver.tar.gz::https://github.com/${_reponame}/${_reponame}/archive/v$pkgver.tar.gz")
sha512sums=('22ab9bb3c5d5e619c0624ced2031b23d9d68cf9ffd6da40087aa0049f486b8c6201ff19605fc73fa642358bec31c18bb43683a8b0d603b198626d9a23721bcd6')
b2sums=('5e9bd1c2182f73e36c748396e53957396b59a0325ca1fa1eab00af9f317d6134683902779d5c7f54da787e7f12149c257561c34b47956e31abe246e3825e6fb5')
provides=(
  libfluidsynth.so.2
  libfluidsynth.so.2.3.7
)


build() {
  cd "${_reponame}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DFLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth \
        -Denable-ladspa=ON \
        -Denable-portaudio=ON \
        -DLIB_SUFFIX="" \
        -Wno-dev \
        -B build \
        -S .
  make -C build VERBOSE=1
}

check() {
  cd "${_reponame}-${pkgver}"
  make -C build -k check
}

package() {
  cd "${_reponame}-${pkgver}"
  # docs
  install -vDm 644 {AUTHORS,ChangeLog,{CONTRIBUTING,README}.md,THANKS,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  # lib
  cd ./build/src/
  install -Dm644 libfluidsynth.so.2.3.7 "${pkgdir}/usr/lib/libfluidsynth.so.2.3.7"
  ln -s ./libfluidsynth.so.2.3.7 "${pkgdir}/usr/lib/libfluidsynth.so.2"
}

# vim: ft=PKGBUILD
