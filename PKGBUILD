# Maintainer: Charles Langlois <contact at charleslanglois dot dev>

pkgname='exfetch'
pkgver=1.9
pkgrel=1
pkgdesc='shell extensible fetching program written in Crystal'
arch=("x86_64")
url='https://codeberg.org/Izder456/exfetch'
license=('ISC')
depends=('zlib' 'glibc' 'gcc-libs' 'pcre2' 'gc' 'pciutils')
makedepends=('git' 'crystal' 'shards' )
source=("exfetch::git+${url}.git#tag=${pkgver}" "git+https://github.com/schovi/baked_file_system.git" "git+https://github.com/kaneroot/pledge.cr.git")
sha256sums=('a47ee161dc526b8a3a3050ecf43888ba777c791cddd500e5db44eb3b9f4fc9de'
            'SKIP'
            'SKIP')
provides=('exfetch')
prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.lib/baked_file_system.url "$srcdir/baked_file_system"
  git config submodule.lib/pledge.url "$srcdir/pledge.cr"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${pkgname}"

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
