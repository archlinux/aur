# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds-git
gitname=scx
pkgver=0.1.5.r28.g09e7905
pkgrel=3
pkgdesc="sched_ext schedulers"
arch=('x86_64')
url="https://github.com/sched-ext/scx"
license=('GPL-2.0-only')
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('git' 'python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
source=("git+https://github.com/sched-ext/scx"
        '0001-Add-systemd-services-for-scx-schedulers.patch')
sha256sums=('SKIP'
            '2c0b18309c21ff484ccd902c5665ac0510f8829fc59c5b99de00aabc579cb711')
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
