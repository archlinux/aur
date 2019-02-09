pkgname=crosvm-git
_gitname=crosvm
pkgver=r640.d39dd9af
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
            'a5bd453e2cdea1c9d5be96c31cbb37ea2c264dd07398fc631072ca0c8cc09ec5'
            'e274be49777c84acc1f8a7c8f7c0ad85add3691c5b80d76ba3757accbb2d27f3')
