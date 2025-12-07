# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the initial patches!
# https://github.com/mymedia2/tdesktop

# Updated using:
# https://gitlab.archlinux.org/archlinux/packaging/packages/telegram-desktop/-/raw/main/PKGBUILD?ref_type=heads&inline=false
# Thanks to the Arch maintainers :)

# You can pass parameters to make / ninja via MAKEFLAGS.
# You can use TMPDIR in $srcdir by exporting TMPDIR_FIX with some value.

pkgname=telegram-desktop-dev
pkgver=6.3.6
pkgrel=1
pkgdesc='Official Telegram Desktop client - development release'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL-3.0-or-later WITH OpenSSL-exception')
# Although not in order, keeping them in the same order of the standard package
# for my mental sanity.
# libtg_owt-git for now until the official repo is updated.
depends=(
  'abseil-cpp'
  'ada'
  'ffmpeg'
  'glib2'
  'hicolor-icon-theme'
  'hunspell'
  'kcoreaddons'
  'libavif'
  'libdispatch'
  'libheif'
  'libjxl'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
  'openal'
  'openh264'
  'openssl'
  'pipewire'
  'protobuf'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-wayland'
  'rnnoise'
  'xxhash'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'gperf'
  'libtg_owt'
  'microsoft-gsl'
  'ninja'
  'python'
  'range-v3'
  'tl-expected'
)
optdepends=(
  'geoclue: geoinformation support'
  'geocode-glib-2: geocoding support'
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
  'xdg-desktop-portal: desktop integration'
)
provides=(telegram-desktop)
conflicts=(telegram-desktop)
_td_commit=6d74326c5ce53aeb52496f157f0080d9b8515970
source=(
    # Old approach, with many Git repos
    #"tdesktop::git+https://github.com/telegramdesktop/tdesktop#$_commit"
    # Here are all the submodule repos.
    # Use the nearby Python script for generating the list
    # ...
    # New approach: source tarball, same as the stable Arch package
  "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
  "git+https://github.com/tdlib/td.git#tag=${_td_commit}"
)
sha512sums=('739df5d0e3951df7883ba1db5fcf3ae1e084e9c5b8b67c4b55e46b3d132938f196a3e4e99f974d2109dd6d6edc9966aa15ba42b35b2cf4176191b7a8050dfb54'
            '6dc6e684a0bf35bb83f6fa6579a0da82d604190b222f2cd2de9b8ef5b93f5f18ac9a8733e2c5cf2a64ed9933b346ea31e26a4bcc0039956280ec2deef9649457')

prepare() {
  # Normal preparation here
  cd "$srcdir/tdesktop-$pkgver-full"

  # Cheating! Linking fixed patches to their usual place
  #for fixed in $srcdir/*_fixed*
  #do
  #    ln -s $fixed ${fixed/_fixed/}
  #done
  # Patch here, if needed!
  # patch -Np1 -i "$srcdir/my_beautiful.patch"

  # Official package patches
}

build() {
  CXXFLAGS+=' -ffat-lto-objects'

  # Ensure that we won't have issues with tmpfs.
  # Available via TMPDIR_FIX
  if [ -n "$TMPDIR_FIX" ]
  then
      export TMPDIR="$srcdir/build_tmp"
      mkdir -p $TMPDIR
      echo "Using \$TMPDIR = $TMPDIR ..."
  fi

  # Build tdlib from source
  echo "--> Build tdlib"
  cmake -S td -B td/build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$PWD/td/install" \
    -Wno-dev \
    -DTD_E2E_ONLY=ON
  cmake --build td/build -- $MAKEFLAGS
  cmake --install td/build

  # Turns out we're allowed to use the official API key that telegram uses for
  # their snap builds:
  # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
  # Thanks @primeos!
  echo "--> Build Telegram Desktop"
  cmake -B build -S tdesktop-$pkgver-full -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_ID=611335 \
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
  cmake --build build -- $MAKEFLAGS
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
