# Maintainer: lod <aur@cyber-anlage.de>

pkgname=orca-slicer-git
pkgver=2.5.0.r29402.a409791
pkgrel=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('bash' 'cairo' 'dbus' 'expat' 'fontconfig' 'freetype2' 'gdk-pixbuf2' 'glib2' 'glibc' 'gspell' 'gstreamer'
         'gst-plugins-bad-libs' 'gtk3' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libjpeg-turbo' 'libspnav'
         'libstdc++' 'libx11' 'libxkbcommon' 'mesa' 'mesa-utils' 'pango' 'python' 'wayland' 'webkit2gtk-4.1' 'zlib')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'glew' 'libigl' 'm4' 'ninja' 'pkgconf' 'wayland-protocols'
              'ccache' 'python-numpy' 'libnotify' 'libmspack' 'superlu')
optdepends=('nvidia-utils: for querying driver version')
options=('!debug' '!emptydirs')
provides=('orca-slicer')
conflicts=('orca-slicer')
source=($pkgname::git+https://github.com/OrcaSlicer/OrcaSlicer.git
        orca-slicer-wrapper.sh)
b2sums=('SKIP'
        'f32c48ed4bdb353c4408aa17fff76fa2bc5988f2b681be2c6f61fb3520cbb4d783649f39bc0f354bc99b127a31e5ee3b1c1a8fc7352a35fb651e0e336dd0ddb5')

pkgver() {
  cd $pkgname
  _version=$(sed -n 's/set(SoftFever_VERSION "\([^"]*\)-.*".*/\1/p' version.inc)
  _revision=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.%s" $_version $_revision $_commit
}

prepare() {
  cd $pkgname
  # abuse FLATPAK IF statement to build against some system libs
  sed -i 's/if(FLATPAK)/if(true)/' deps/CMakeLists.txt
  # revert: Link libspnav statically (#9964)
  git revert --no-commit 6ed9b0817381042a63fa121c5f9b5cbcb11a3bfa 
}

build() {
  cd $pkgname
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  jobs=4 # just a sane default, if it isn't set in MAKEFLAGS
  if [[ $MAKEFLAGS =~ -j([0-9]+) ]]; then
    jobs="${BASH_REMATCH[1]}"
  fi

   cmake \
    -G Ninja \
    -S deps \
    -B deps/build \
    -DDESTDIR="$PWD/deps/build/destdir" \
    -DDEP_DOWNLOAD_DIR="$PWD/deps/DL_CACHE" \
    -DCOLORED_OUTPUT=ON \
    -DDEP_WX_GTK3=ON
  ninja -C deps/build -j"$jobs"

  cmake \
    -G Ninja \
    -S . \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_FULL_DATAROOTDIR=/usr/share/ \
    -DCMAKE_PREFIX_PATH="$PWD/deps/build/destdir/usr/local" \
    -DSLIC3R_STATIC=1 \
    -DORCA_TOOLS=1 \
    -DSLIC3R_FHS=1 \
    -DSLIC3R_GTK=3
  ninja -C build -j"$jobs"

  # add localizations
  ./scripts/run_gettext.sh --full
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja -C build install
  install -d "$pkgdir/usr/lib/OrcaSlicer/"
  mv "$pkgdir/usr/bin/orca-slicer" "$pkgdir/usr/lib/OrcaSlicer/"
  install -Dm755 ../orca-slicer-wrapper.sh "$pkgdir/usr/bin/orca-slicer"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/OrcaSlicer/LICENSE"
  rm -rf "$pkgdir/usr/LICENSE.txt"
}
