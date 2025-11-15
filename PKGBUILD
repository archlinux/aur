# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=crosvm-git
pkgver=r10974.88240a4238
pkgrel=1
pkgdesc="The Chrome OS Virtual Machine Monitor"
url="https://chromium.googlesource.com/crosvm/crosvm"
depends=('gcc-libs' 'libcap' 'dtc')
makedepends=('rustup' 'rust-bindgen' 'wayland-protocols')
conflicts=('crosvm')
provides=('crosvm')
options=(!lto !debug)
arch=('x86_64')
license=('custom:chromiumos')
source=("git+https://chromium.googlesource.com/crosvm/crosvm"
        "git+https://chromium.googlesource.com/chromiumos/platform/minijail"
        "git+https://chromium.googlesource.com/chromium/tools/depot_tools"
        "git+https://chromium.googlesource.com/crosvm/perfetto"
        )
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd crosvm
  git submodule init
  git config submodule."third_party/minijail".url "$srcdir/minijail"
  git config submodule."third_party/depot_tools".url "$srcdir/depot_tools"
  git config submodule."third_party/perfetto".url "$srcdir/perfetto"
  git -c protocol.file.allow=always submodule update
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
  cp -r jail/seccomp/x86_64/* "$pkgdir/usr/share/policy/crosvm/"
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
}
