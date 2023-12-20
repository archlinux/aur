# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds-git
gitname=scx
pkgver=0.1.2.r24.g79b0c3e
pkgrel=2
pkgdesc="sched_ext schedulers"
arch=('x86_64')
url="https://github.com/sched-ext/scx"
license=('GPL-2.0-only')
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('git' 'python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
source=("git+https://github.com/sched-ext/scx")
sha256sums=('SKIP')
options=(!lto)
provides=("scx-scheds=$pkgver")
conflicts=("scx-scheds")

pkgver() {
  cd $gitname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
 cd $gitname

 local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $gitname
  arch-meson . build
  meson compile -C build
}

package() {
  cd $gitname
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
