# Maintainer: Charles Langlois <contact at charleslanglois dot dev>

pkgname='exfetch'
pkgver='1.4'
pkgrel=2
pkgdesc='shell extensible fetching program written in Crystal'
arch=("x86_64")
url='https://codeberg.org/Izder456/exfetch'
license=('ISC')
depends=('zlib' 'glibc' 'gcc-libs' 'pcre2' 'gc')
makedepends=('git' 'crystal' 'shards' )
source=("exfetch::git+${url}.git#tag=${pkgver}" "git+https://github.com/schovi/baked_file_system.git")
sha256sums=('975408970f8eb0996a3c262746bec480b99309b93933f7bcd38620616ae3b6b0'
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
  make
}


package() {
  cd "${pkgname}"

  DESTDIR=${pkgdir} PREFIX=/usr make install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
