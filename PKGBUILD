# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=lsfg-vk
_app_id="gay.pancake.$pkgname-ui"
pkgver=1.0.0
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=('x86_64')
url="https://github.com/PancakeTAS/lsfg-vk"
license=('MIT')
depends=(
  'gtk4'
  'libadwaita'
  'vulkan-icd-loader'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'git'
  'llvm'
  'ninja'
  'vulkan-headers'
)
install="$pkgname.install"
source=("git+https://github.com/PancakeTAS/lsfg-vk.git#tag=v$pkgver"
        'git+https://github.com/trailofbits/pe-parse.git'
        'git+https://github.com/PancakeTAS/dxbc.git'
        'git+https://github.com/ToruNiina/toml11.git'
        'git+https://github.com/zeux/volk.git')
sha256sums=('92fb0df0afc68a0c2ed77dc23baef13849e4cd1d7ff5025ad538f19fd58e03cc'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.thirdparty/pe-parse.url "$srcdir/pe-parse"
  git config submodule.thirdparty/dxbc.url "$srcdir/dxbc"
  git config submodule.thirdparty/toml11.url "$srcdir/toml11"
  git config submodule.thirdparty/volk.url "$srcdir/volk"
  git -c protocol.file.allow=always submodule update

  cd ui
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Correct StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="gay.pancake.$pkgname" \
    "rsc/${_app_id}.desktop"
}

build() {
  cmake -B build -S "$pkgname" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_C_COMPILER='clang' \
    -DCMAKE_CXX_COMPILER='clang++' \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION='ON' \
    -Wno-dev
  cmake --build build

  cd "$pkgname/ui"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgname"
  install -Dm755 "ui/target/release/$pkgname-ui" -t "$pkgdir/usr/bin/"
  install -Dm644 "ui/rsc/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 ui/rsc/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/${_app_id}.png"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
