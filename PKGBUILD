# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
pkgver=0.1.5
pkgrel=3
pkgdesc='Sched_ext schedulers'
url='https://github.com/sched-ext/scx'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
options=(!lto)
source=(https://github.com/sched-ext/scx/archive/refs/tags/v${pkgver}.tar.gz
        0001-Add-systemd-services-for-scx-schedulers.patch
        0002-Adapting-service-names-to-scheduler-names.patch)
sha512sums=('caf969be909f2dfca7b8b82d528a50a147029e4ac788825ece3adad67fef41c6e43a37e74316238bcc13c1357a63503c940c76aeefa2e1e4f6787c1496833d05'
            '6f8848a467e6f74f669c6734700f8e941139f754dfd889889de740af4f308fb28d3451c63be2611e70250d696e34141584647883a47c8c688f3803aa10ee28e6'
            'af6359529caec0fa5abb6c188cae697ede9a72e13d78532ac71dd4ee0cd0e59518c0918dedcd8009a1ff218ac164400a96c198c0de102dd7e5e1461eea245961')

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
