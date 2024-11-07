# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
# Contributor: odrling <florianbadie@odrling.xyz>
pkgname=aegisub-japan7-git
pkgver=3.3.3.r852.f5ec0f718
pkgrel=1
pkgdesc='A fork of aegisub including tap-to-time feature and custom user scripts'
arch=(x86_64)
url=https://github.com/odrling/Aegisub
license=(
  BSD-3-Clause
  MIT
)
depends=(
  alsa-lib
  amaranth-font
  boost-libs
  ffmpeg
  fftw
  fontconfig
  hunspell
  icu
  libass
  libgl
  libpulse
  openssl
  uchardet
  xxhash
  wxgtk3
  zlib
)
makedepends=(
  autoconf-archive
  boost
  git
  intltool
  mesa
  meson
)
provides=(aegisub)
conflicts=(aegisub)
source=(
  aegisub::git+https://github.com/odrling/Aegisub.git
  bestsource::git+https://github.com/vapoursynth/bestsource.git#tag=R8
  ffms2::git+https://github.com/FFMS/ffms2.git
  libp2p::git+https://bitbucket.org/the-sekrit-twc/libp2p.git#commit=1e3818bd7277165819f659d410873fe5dab37af6
  luajit::git+https://github.com/LuaJIT/LuaJIT.git#branch=v2.1
  gtest.zip::https://github.com/google/googletest/archive/release-1.8.1.zip
  gtest-patch.zip::https://wrapdb.mesonbuild.com/v1/projects/gtest/1.8.1/1/get_zip
)
noextract=(
  gtest.zip
  gtest-patch.zip
)
sha256sums=(
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  927827c183d01734cc5cfef85e0ff3f5a92ffe6188e0d18e909c5efebf28a0c7
  f79f5fd46e09507b3f2e09a51ea6eb20020effe543335f5aee59f30cc8d15805
)

pkgver() {
  cd aegisub

  tag='v3.3.3'

  echo "${tag#v}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd aegisub

  # Clean up previous builds
  rm -vrf subprojects/bestsource subprojects/ffms2 subprojects/luajit subprojects/packagecache

  # Initialize subproject wraps
  ln -vs ../../bestsource subprojects/bestsource
  rm -vrf subprojects/bestsource/libp2p
  ln -vs ../libp2p subprojects/bestsource/libp2p
  meson subprojects packagefiles --apply bestsource
  ln -vs ../../ffms2 subprojects/ffms2
  meson subprojects packagefiles --apply ffms2
  ln -vs ../../luajit subprojects/luajit
  meson subprojects packagefiles --apply luajit
  mkdir -vp subprojects/packagecache
  ln -vs ../../../gtest.zip subprojects/packagecache/gtest-1.8.1.zip
  ln -vs ../../../gtest-patch.zip subprojects/packagecache/gtest-1.8.1-1-wrap.zip

  arch-meson builddir \
    -Dportaudio=disabled -Dopenal=disabled -Dvapoursynth=disabled -Davisynth=disabled \
    --force-fallback-for=ffms2 -D ffms2:default_library=static
}

build() {
  cd aegisub

  ninja -C builddir
}

package() {
  cd aegisub

  DESTDIR="${pkgdir}" ninja -C builddir install
  install -Dm 644 LICENCE -t "${pkgdir}"/usr/share/licenses/aegisub-git/

  # Clean symlink to not break future builds
  rm -vf subprojects/bestsource/libp2p
}

# vim: ts=2 sw=2 et:

