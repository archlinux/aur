pkgname=crosvm-git
_gitname=crosvm
pkgver=r1252.d4afd7033
pkgrel=1
pkgdesc="The Chrome OS Virtual Machine Monitor"
url="https://chromium.googlesource.com/chromiumos/platform/crosvm"
depends=('minijail-git' 'gcc-libs')
makedepends=('rustup' 'dtc')
arch=('x86_64')
license=('custom:chromiumos')
source=("git+https://chromium.googlesource.com/chromiumos/platform/crosvm"
        "git+https://chromium.googlesource.com/chromiumos/third_party/adhd"
        "crosvm-cargo-paths.patch" "adhd-cargo-paths.patch"
        )

prepare() {
  patch -d crosvm -p1 < crosvm-cargo-paths.patch
  patch -d adhd -p1 < adhd-cargo-paths.patch
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 target/release/crosvm "$pkgdir/usr/bin/crosvm"
  install -d "$pkgdir/usr/share/policy/crosvm/"
  cp -r seccomp/x86_64/* "$pkgdir/usr/share/policy/crosvm/"
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
}

sha256sums=('SKIP'
            'SKIP'
            '35a40972cabe7504a1ccdeb042a787fdbca9452eed0bbe1ff6ea74f744794fc9'
            'cdf946c9570c4ca6b5f5b09897e55065b409975a41e65f9fc375799ee1d88724')
