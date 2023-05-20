pkgname=libhvl-git
pkgver=r1.05b83b7
pkgrel=1
pkgdesc="Hively Tracker as a library (HVL and AHX audio format support)"
arch=(x86_64)
url='https://github.com/Deewiant/libhvl.git'
license=(BSD)
makedepends=('git')
provides=(libhvl)
conflicts=(libhvl)
source=("git+https://github.com/Deewiant/libhvl.git"
        "git+https://github.com/pete-gordon/hivelytracker.git")
sha256sums=(SKIP SKIP)

pkgver() {
  cd "$srcdir/libhvl"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd libhvl
  git submodule init
  git config submodule.hivelytracker.url "$srcdir/hivelytracker"
  git -c protocol.file.allow=always submodule update
}

build() {
  make -C libhvl
}

package() {
  make -C libhvl PREFIX="$pkgdir/usr" install
  install -d "$pkgdir/usr/share/licenses/libhvl"
  ln -s /usr/share/doc/libhvl/LICENSE "$pkgdir/usr/share/licenses/libhvl"
}

# vim:set sw=2 et:
