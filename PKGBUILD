# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=os-prober-git
pkgver=1.78.r0.g5debc53
pkgrel=1
pkgdesc="Tool to detect other filesystems with operating systems on them"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/os-prober"
license=('GPL')
depends=('glibc' 'sh')
makedepends=('git')
provides=('os-prober')
conflicts=('os-prober')
source=("git+https://salsa.debian.org/installer-team/os-prober.git")
sha256sums=('SKIP')


pkgver() {
  cd "os-prober"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "os-prober"

  make
}

package() {
  cd "os-prober"

  install -Dm755 {linux-boot-prober,os-prober} -t "$pkgdir/usr/bin"
  install -Dm755 "newns" -t "$pkgdir/usr/lib/os-prober"
  install -Dm755 "common.sh" -t "$pkgdir/usr/share/os-prober"

  for dir in linux-boot-probes linux-boot-probes/mounted os-probes os-probes/init os-probes/mounted; do
    install -Dm755 "$dir/common"/* -t "$pkgdir/usr/lib/$dir"
    [[ -d "$dir/x86" ]] && cp -r "$dir/x86"/* "$pkgdir/usr/lib/$dir"
  done

  install -Dm755 "os-probes/mounted/powerpc/20macosx" -t "$pkgdir/usr/lib/os-probes/mounted"
  install -dm755 "$pkgdir/var/lib/os-prober"
}
