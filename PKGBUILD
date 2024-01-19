# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
pkgver=0.1.5
pkgrel=7
pkgdesc='Sched_ext schedulers'
url='https://github.com/sched-ext/scx'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
options=(!lto)
source=(https://github.com/sched-ext/scx/archive/refs/tags/v${pkgver}.tar.gz
        0001-scx-introduce-systemd-services.patch)
sha512sums=('caf969be909f2dfca7b8b82d528a50a147029e4ac788825ece3adad67fef41c6e43a37e74316238bcc13c1357a63503c940c76aeefa2e1e4f6787c1496833d05'
            '65873ac65504e83d8c760ab07c7dc151d413488e283e466b8e8ef3c176050095f8623c0c4cbcff1f4cc1c1a06bc0ede99c999ea8fdf2d892ee79119b04295ad9')

prepare() {
 cd scx-${pkgver}

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
  cd scx-${pkgver}
  arch-meson . build
  meson compile -C build
}

package() {
  cd scx-${pkgver}
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
