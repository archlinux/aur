# Maintainer: Charles Langlois <contact at charleslanglois dot dev>

pkgname='exfetch'
pkgver=1.4.1
pkgrel=1
pkgdesc='shell extensible fetching program written in Crystal'
arch=("x86_64")
url='https://codeberg.org/Izder456/exfetch'
license=('ISC')
depends=('zlib' 'glibc' 'gcc-libs' 'pcre2' 'gc')
makedepends=('git' 'crystal' 'shards' )
source=("exfetch::git+${url}.git#tag=${pkgver}" "git+https://github.com/schovi/baked_file_system.git")
sha256sums=('876eb7a2abee08ec3ea4387c2c5552f3a9e78530b46091da7a3b406c9351fd21'
            'SKIP')
provides=('exfetch')
prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.lib/baked_file_system.url "$srcdir/baked_file_system"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${pkgname}"

  # make STATIC=on MULTITHREADED=on
  make HARDENING=on
}


package() {
  cd "${pkgname}"

  DESTDIR=${pkgdir} PREFIX=/usr make install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
