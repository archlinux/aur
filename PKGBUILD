# Maintainer: Soma Yamamoto <soya_daizu[at]proton[dot]me>

_name=myMPD
_pkgname=mympd
pkgname=mympd-git
pkgver=10.2.1.r4.g18a28cfe
pkgrel=1
pkgdesc="A standalone and lightweight web-based MPD client"
arch=(x86_64)
url="https://github.com/jcorporation/myMPD"
license=(GPL3)
depends=(glibc lua)
makedepends=(git cmake flac jq libid3tag openssl pcre2 perl)
conflicts=(mympd)
provides=(mympd)
source=(git+https://github.com/jcorporation/myMPD.git#branch=devel)
sha512sums=(SKIP)

pkgver() {
  cd "$srcdir/myMPD"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  local cmake_options=(
    -B build
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DENABLE_FLAC=ON
    -S $_name
    -Wno-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  depends+=(
    flac libFLAC.so
    libid3tag libid3tag.so
    openssl libssl.so
    pcre2 libpcre2-8.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $_name/{CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}
