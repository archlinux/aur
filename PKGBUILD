# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
pkgver=0.1.6
pkgrel=2
pkgdesc='Sched_ext schedulers'
url='https://github.com/sched-ext/scx'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
backup=('etc/default/scx')
options=(!lto)
source=(https://github.com/sched-ext/scx/archive/refs/tags/v${pkgver}.tar.gz
       0001-scx-add-one-service-for-all-schedulers-and-config-fi.patch)
sha512sums=('84dfc711ba9d51cd26c104caca1dcee3ce0be790be5b3a294ed47f4ef5fb20c58524b793d45b0970d61befa33adf8c8f3ca2b2f726d2ef335c80c11eee813387'
            '1284c12302568808dcd836b440e957e7c2f9a8d112b3d1289d3dd2c0d245c0e2a5955a22cc4e41872efa546db497b3a48eddd514ff5ad58f2d463685847d99bd')

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
