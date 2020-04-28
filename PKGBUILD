# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=crosvm-git
pkgver=r1455.93dca2fd9
pkgrel=1
pkgdesc="The Chrome OS Virtual Machine Monitor"
url="https://chromium.googlesource.com/chromiumos/platform/crosvm"
depends=('gcc-libs' 'libcap' 'dtc')
makedepends=('rustup')
arch=('x86_64')
license=('custom:chromiumos')
source=("git+https://chromium.googlesource.com/chromiumos/platform/crosvm"
        "git+https://chromium.googlesource.com/chromiumos/third_party/adhd"
        "git+https://android.googlesource.com/platform/external/minijail"
        )
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  # crosvm build system expects a certain directory tree structure
  # see its Cargo.toml
  rm -rf platform third_party aosp
  mkdir -p platform third_party aosp/external
  mv crosvm platform
  mv adhd third_party
  mv minijail aosp/external
}

pkgver() {
  cd platform/crosvm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd platform/crosvm
  cargo build --release
}

package() {
  cd platform/crosvm
  install -Dm755 target/release/crosvm "$pkgdir/usr/bin/crosvm"
  install -d "$pkgdir/usr/share/policy/crosvm/"
  cp -r seccomp/x86_64/* "$pkgdir/usr/share/policy/crosvm/"
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
}
