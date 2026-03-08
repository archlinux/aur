_pkgname=labyrinthine
pkgname=${_pkgname}-git
pkgver=r4.e4ad034
pkgrel=1
pkgdesc="Linux-first Rust terminal maze runner with Q-learning, auto-solving, and progressive levels"
arch=('x86_64')
url="https://github.com/xeoxaz/Labyrinthine"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
optdepends=(
  'nvidia-utils: enable CUDA probing via nvidia-smi'
  'rocminfo: enable ROCm probing'
  'vulkan-tools: enable Vulkan probing'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/xeoxaz/Labyrinthine.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --locked --release
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --locked
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/labyrinthine" "$pkgdir/usr/bin/labyrinthine"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
