# Maintainer: Charles Langlois <contact at charleslanglois dot dev>

pkgname='exfetch'
pkgver=1.7
pkgrel=1
pkgdesc='shell extensible fetching program written in Crystal'
arch=("x86_64")
url='https://codeberg.org/Izder456/exfetch'
license=('ISC')
depends=('zlib' 'glibc' 'gcc-libs' 'pcre2' 'gc')
makedepends=('git' 'crystal' 'shards' )
source=("exfetch::git+${url}.git#tag=${pkgver}" "git+https://github.com/schovi/baked_file_system.git" "git+https://github.com/kaneroot/pledge.cr.git" "git+https://github.com/crystal-ameba/ameba.git")
sha256sums=('0717d7c9b32b75e34bffa3890693000ce0e5534a3d429d8bf310a6509b1b87e8'
            'SKIP'
            'SKIP'
            'SKIP')
provides=('exfetch')
prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.lib/baked_file_system.url "$srcdir/baked_file_system"
  git config submodule.lib/ameba.url "$srcdir/ameba"
  git config submodule.lib/pledge.url "$srcdir/pledge.cr"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${pkgname}"

  # make STATIC=on MULTITHREADED=on
  make HARDENING=on
}

check() {
  cd "${pkgname}"
  make test
}

package() {
  cd "${pkgname}"

  DESTDIR=${pkgdir} PREFIX=/usr make install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
