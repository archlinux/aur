# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
pkgver=0.1.6
pkgrel=3
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
            'a2bc7cd7d736319b6a559f9dd04db4f333f03cabb26bb25a3a13ee0ca8d4cf8160c21dba2a9950f9fcd800dcfcad73e71644eab31b8323a283af887eaaae1b9f')

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
