##Copied from official telegram-desktop PKGBUILD.
##If you spot any issues, please don't hesitate to email me.
##Email: pony at just-a-pony dot net
pkgname=yukigram-desktop-clang
pkgver=7.4.4.1
pkgrel=1
pkgdesc='yukigram-desktop,build much faster&less memory requirment with clang'
arch=('x86_64')
url="https://github.com/yukigram/yukigram"
license=('GPL-3.0-or-later WITH OpenSSL-exception')

provides=(yukigram-desktop)
conflicts=(yukigram-desktop)

options=(!lto !debug !ccache strip)

depends=(
  'abseil-cpp'
  'ada'
  'cairo'
  'ffmpeg'
  'fontconfig'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'hunspell'
  'kcoreaddons'
  'libavif'
  'libfido2'
  'libgcc'
  'libheif'
  'libjpeg-turbo'
  'libjxl'
  'libpipewire'
  'libsrtp'
  'libstdc++'
  'libvpx'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
  'openal'
  'openh264'
  'openssl'
  'opus'
  'pango'
  'pipewire'
  'qt6-base'
  'qt6-declarative'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-wayland'
  'rnnoise'
  'tlottie'
  'xxhash'
  'zlib'
    )
makedepends=(
  'boost'
  'boost-libs'
  'cargo'
  'clang'
  'cmake'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'just'
  'gperf'
  'libtg_owt'
  'microsoft-gsl'
  'mold'
  'ninja'
  'python'
  'qt6-shadertools'
  'range-v3'
  'tl-expected'
  'vulkan-headers'
)
optdepends=(
  'geoclue: geoinformation support'
  'crow-translate: translation provider'
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1 (gtk3)'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (gtk4)'
  'xdg-desktop-portal: desktop integration'
)

_td_commit=c15d3f5a5de6e3ba5839822c451152e5e18bb700
_wallet_engine_patch_commit=23d349a3ff09dbc1fa8127ce39ba9223de0edf21
_wallet_engine_ver=0.0.7
source=(
  "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver%.*}/tdesktop-${pkgver%.*}-full.tar.gz"
  "git+https://github.com/tdlib/td.git#commit=${_td_commit}"
  wallet-engine-${_wallet_engine_ver}.tar.gz::https://github.com/i582/wallet-engine/archive/refs/tags/v${_wallet_engine_ver}.tar.gz
  "https://github.com/yukigram/yukigram/archive/refs/tags/v${pkgver}.tar.gz"
  wallet-engine-${_wallet_engine_patch_commit}.patch::https://github.com/desktop-app/patches/raw/${_wallet_engine_patch_commit}/wallet-engine.patch
  "0000-Fix-Pony-fix-lang-res-file-loc.patch"
)

sha512sums=('fc597cf9a04edd6228fc06503ca11a37590f4bc423612137ea1a953206c01da33cc8fa8177956f5175922ce848939f64166f4a12a9e07a3824731906549088de'
            'dd4741b3621c5e76ba7c9eee44ffd41b1e6b6c24fdb19988efd780d307aff79a9dcfd710be9ad63db6857cbbd71c273c54d82be524a5326fc22f1233d9eb6ca2'
            'f1a38de20459c5b780c98aaab037fdf34357980e7f3b93c4b523636d016ca4ffc9d9679c2ee4a246b138ef0474b8190d2db1874b204c006b0f30b3c950c62ff6'
            '0d12c848d60e3de68942435fd371507592bad35808977f57d41d9303d0a797309a349c28c29a77ef1c4e52891f1d850cc3c9b6e8db1753880fe745b340128831'
            '71c9b0aacef42e87febee042d251c2835e3d30b8000f9b00afb48d74a7e7aba93a36530c1ef0d6da69bb4d115e7a852a8888f1bcf868d1bd60d9e3f55a024088'
            '392c4ca2a7b6dc276a49f5281949ec4f96707c881113441c1c717e5fd6cc689a85634a49bbd6f55150d09340be298cb25bf2b5d54b1a2fe87b5baa87f1c0ea72')


prepare() {
  cd "$srcdir"/tdesktop-${pkgver%.*}-full/
  for p in "$srcdir"/yukigram-${pkgver}/tdesktop/cur/*.patch;do
    patch -Np1 <"$p"
  done
  patch -Np1 < "$srcdir"/0000-Fix-Pony-fix-lang-res-file-loc.patch
  
  cd "$srcdir"/wallet-engine-${_wallet_engine_ver}
  patch -Np1 -i "$srcdir"/wallet-engine-${_wallet_engine_patch_commit}.patch
}

build() {

  export CC=clang
  export CXX=clang++
  export RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=mold"
  export LDFLAGS="$LDFLAGS -flto=thin -fuse-ld=mold -Wl,--icf=safe"

  export CFLAGS="$CFLAGS -flto=thin"
  export CXXFLAGS="$CXXFLAGS -flto=thin"

  local makepkg_jobs
  if [[ "$MAKEFLAGS" =~ -j[[:space:]]*([0-9]+) ]]; then
    makepkg_jobs="${BASH_REMATCH[1]}"
  else
    makepkg_jobs=$(nproc)
  fi

  local mem_jobs=$(awk '/MemTotal/ {print int($2 / 1024 / 1024 / 1.2)}' /proc/meminfo)
  (( mem_jobs < 1 )) && mem_jobs=1

  local jobs=$(( mem_jobs < makepkg_jobs ? mem_jobs : makepkg_jobs ))

  export CMAKE_BUILD_PARALLEL_LEVEL="$jobs"
  export CARGO_BUILD_JOBS="$jobs"
  export CARGO_BUILD_PROFILE=release
  export CARGO_PROFILE_RELEASE_LTO=thin
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=2
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=4
  cd wallet-engine-${_wallet_engine_ver}
  just build
  just bindings-cpp
  install -Dm644 target/release/libwallet_engine.a -t install/lib/
  install -Dm644 bindings/cpp-experimental/* -t install/include/wallet_engine/
  cd ..

  cmake -S td -B td/build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$PWD/td/install" \
    -Wno-dev \
    -DCMAKE_LINKER_TYPE=MOLD \
    -DCMAKE_PCH_INSTANTIATE_TEMPLATES=ON \
    -DTD_E2E_ONLY=ON
  cmake --build td/build  -j "$jobs"
  cmake --install td/build


  cmake -B build -S tdesktop-${pkgver%.*}-full -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
    -DCMAKE_PREFIX_PATH="$PWD/wallet-engine-${_wallet_engine_ver}/install" \
    -DCMAKE_LINKER_TYPE=MOLD \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_ID=611335 \
    -DCMAKE_PCH_INSTANTIATE_TEMPLATES=ON \
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c \
    -DCMAKE_JOB_POOLS="link_pool=2" \
    -DCMAKE_JOB_POOL_LINK=link_pool

  cmake --build build -j "$jobs"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
