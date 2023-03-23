# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Upstream Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=jami-daemon-wtf
_pkgname=jami-daemon
pkgver=20230123
pkgrel=1
pkgdesc="Free and universal communication platform which preserves the users’ privacy and freedoms (daemon component)"
arch=(x86_64)
url="https://jami.net"
license=(GPL3)
groups=(jami)
depends=(glibc opendht gnutls nettle libgit2 libsecp256k1 ffmpeg speexdsp
         fmt yaml-cpp jsoncpp zlib alsa-lib libpulse jack libupnp libnatpmp
         openssl webrtc-audio-processing systemd-libs libarchive)
# portaudio needs a not-yet-upstream patch https://git.jami.net/savoirfairelinux/jami-daemon/-/issues/650
makedepends=(git cmake perl asio msgpack-c msgpack-cxx restinio systemd meson)
checkdepends=(cppunit)
replaces=(jami-daemon)
conflicts=(jami-daemon)
_commit=5e35e71d0959923ee3a0180b988ea7175f1530fb
_pjprojectver=3b78ef1c48732d238ba284cdccb04dc6de79c54f
source=(git+https://git.jami.net/savoirfairelinux/${_pkgname}.git#commit=${_commit}
        https://github.com/savoirfairelinux/pjproject/archive/${_pjprojectver}/pjproject-${_pjprojectver}.tar.gz
        ffmpeg6.patch)
noextract=(pjproject-${_pjprojectver}.tar.gz)
sha512sums=('SKIP'
            '9ae608861717275c485c1ebb92c9ae49ed8ae84b63b68781a77b7b468904af2d1bf3ac9475f77edaf4739f2eb0c2b556a895e4e851ce43cd274ca624c64ba9b0'
            'e0b68771eab0a8d86651520025fbf57f4b9614b4e9e06fe50b415313e5e52f7a49b3660030fc50550ebcb03c21c7d10c9eb948c3c753f2c35b237cffd4d0561f')

pkgver() {
  cd ${_pkgname}
  TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD
}

prepare() {
  cd ${_pkgname}
  cp ../pjproject-${_pjprojectver}.tar.gz contrib/tarballs
  mkdir contrib/native

  patch -p1 -i ../ffmpeg6.patch # Fix build with FFmpeg 6
}

build() {
  cd ${_pkgname}/contrib/native
  export CXXFLAGS+=' -fpermissive'
  ../bootstrap \
      --disable-downloads \
      --disable-all \
      --enable-pjproject
  make DEPS_pjproject=

  cd "${srcdir}"
  arch-meson ${_pkgname} build -D interfaces=library -D opensl=disabled -D portaudio=disabled \
                              $( ((CHECKFUNC)) && echo -D tests=true) \
                              -D pkg_config_path="${PWD}/${_pkgname}/contrib/$(cc -dumpmachine)/lib/pkgconfig"
  meson compile -C build
}

#check() {
# https://git.jami.net/savoirfairelinux/jami-daemon/-/issues/649
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "${pkgdir}"
}
