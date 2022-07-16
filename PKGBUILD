# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=crosvm-git
pkgver=r4188.57470a47
pkgrel=1
pkgdesc="The Chrome OS Virtual Machine Monitor"
url="https://chromium.googlesource.com/crosvm/crosvm"
depends=('gcc-libs' 'libcap' 'dtc')
makedepends=('rustup' 'rust-bindgen' 'wayland-protocols')
conflicts=('crosvm')
provides=('crosvm')
arch=('x86_64')
license=('custom:chromiumos')
source=("git+https://chromium.googlesource.com/crosvm/crosvm"
        "git+https://chromium.googlesource.com/chromiumos/third_party/tpm2"
        "git+https://chromium.googlesource.com/chromiumos/platform/minigbm"
        "git+https://chromium.googlesource.com/chromiumos/third_party/virglrenderer"
        "git+https://android.googlesource.com/platform/external/minijail"
        )
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd crosvm
  git submodule init
  git config submodule."tpm2-sys/libtpm2".url "$srcdir/tpm2"
  git config submodule."third_party/minigbm".url "$srcdir/minigbm"
  git config submodule."third_party/virglrenderer".url "$srcdir/virglrenderer"
  git config submodule."third_party/minijail".url "$srcdir/minijail"
  git submodule update
}

pkgver() {
  cd crosvm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd crosvm
  cargo build --release
}

package() {
  cd crosvm
  install -Dm755 target/release/crosvm "$pkgdir/usr/bin/crosvm"
  install -d "$pkgdir/usr/share/policy/crosvm/"
  cp -r seccomp/x86_64/* "$pkgdir/usr/share/policy/crosvm/"
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
}
