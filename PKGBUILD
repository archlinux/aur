pkgname=amule-git
pkgver=2.3.2.r49.dc0f6c6f7
pkgrel=1
pkgdesc="Client for the eD2k and Kad networks"
arch=(i686 x86_64)
url=http://amule.org/
license=(GPL)
depends=(boost-libs crypto++ geoip libupnp wxgtk2)
makedepends=(autoconf automake boost git pkg-config)
conflicts=(amule)
source=(
git+https://github.com/amule-project/amule.git
https://anonscm.debian.org/cgit/pkg-amule/amule.git/plain/debian/patches/use_xdg-open_as_preview_default.diff
https://anonscm.debian.org/cgit/pkg-amule/amule.git/plain/debian/patches/version_check.diff
)
sha256sums=(SKIP
            902f8f719c1c02335880621717f23c683da8edbb31add75d3e1267b190e03b9c
            7bf39a64a723ab3e55ccfef93df2ec9cdd8108e56aa0733a4412755931cb3244)

pkgver() {
  cd amule/
  git describe | sed 's/-/.r/; s/-g/./'
}

prepare() {
  cd amule/
  patch -Np1 <$srcdir/use_xdg-open_as_preview_default.diff
  patch -Np1 <$srcdir/version_check.diff
}

build() {
  cd amule/
  ./autogen.sh
  local confargs=(
    --disable-debug
    --disable-rpath
    --enable-alcc
    --enable-geoip
    --enable-mmap
    --enable-optimize
    --prefix=/usr
    --with-boost
  )
  ./configure ${confargs[@]}
  make
}

check() {
  make -C amule/ check
}

package() {
  make -C amule/ DESTDIR=$pkgdir install
}
