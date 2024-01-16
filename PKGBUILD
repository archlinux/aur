# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
pkgver=0.1.5
pkgrel=2
pkgdesc='Sched_ext schedulers'
url='https://github.com/sched-ext/scx'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
options=(!lto)
source=(https://github.com/sched-ext/scx/archive/refs/tags/v${pkgver}.tar.gz
        0001-Add-systemd-services-for-scx-schedulers.patch)
sha512sums=('caf969be909f2dfca7b8b82d528a50a147029e4ac788825ece3adad67fef41c6e43a37e74316238bcc13c1357a63503c940c76aeefa2e1e4f6787c1496833d05'
            'cff5a6c076c13e935c86fb09101d4306e1e13a1436b371006201e4b725bf9f15837ba61bfe704c7acbaf1f4c6f4114a72cd6414c834014763f2de935a1d1cd31')

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
