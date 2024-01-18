# Maintainer: Tejun Heo <tj@kernel.org>
# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds
pkgver=0.1.5
pkgrel=5
pkgdesc='Sched_ext schedulers'
url='https://github.com/sched-ext/scx'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
options=(!lto)
source=(https://github.com/sched-ext/scx/archive/refs/tags/v${pkgver}.tar.gz
        0001-Add-systemd-services-for-scx-schedulers.patch
        0002-Adapting-service-names-to-scheduler-names.patch
        0003-Allow-to-run-from-both-usr-sbin-and-usr-bin.patch
        0004-Set-log-size-to-10M.patch
        0005-Drop-unneeded-default-value.patch)
sha512sums=('caf969be909f2dfca7b8b82d528a50a147029e4ac788825ece3adad67fef41c6e43a37e74316238bcc13c1357a63503c940c76aeefa2e1e4f6787c1496833d05'
            'abab787af60e7a015ab7188b9056cd1417d8034e76eb5654c350c550526dcec23678aa4350f19c78e8f0225e1d5961adad5baf9b76f65a188524d21e6dd3702a'
            '091b2faf04283a8ab24df40c1b25c88b9918e35e6473a33cf0a956ae7c050fb83e5b6b2417bdee632e818d9d7ab715093224ce3273b3be834f2b9ed0dc8a98e9'
            '58174f96367932e67b70494ff2c4a6f89c5789fb945d04c037a270428d965fc55a5789a8c5209d92c4721834350bc6fb076326cdcf05eac42d509d80d221222a'
            'be14c978d7c04afbbd488925b5acea9bb57dd847431b02159cd1a395882b0365a6763896c73a464654e6cad64f0edd96d477d0dfa129aebfcdb6f3457d75b47a'
            'd2d580613d75a55c2569a75a0b3b0b3a84527b68ed6205bb914be8e584dce4dd765dad01b3f3b38c147ace19ecb3849b29da747ed985c5b1e3e514f67148d285')

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
