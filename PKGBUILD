# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds-git
gitname=scx
pkgver=0.1.5.r28.g09e7905
pkgrel=4
pkgdesc="sched_ext schedulers"
arch=('x86_64')
url="https://github.com/sched-ext/scx"
license=('GPL-2.0-only')
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('git' 'python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
source=("git+https://github.com/sched-ext/scx"
        '0001-Add-systemd-services-for-scx-schedulers.patch'
        '0002-Adapting-service-names-to-scheduler-names.patch')
sha256sums=('SKIP'
            '3ff5e8c8a3e9ff9aba08167f33046c8b5388907eec8db3a668160c024365fd1f'
            '310e35f6198e3f3d647298b2b1e463eb8aa08aed66ff181a2ffc75ed37a4cc9a')
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
