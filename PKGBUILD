# Maintainer: Score_Under <seejay.11@gmail.com>
_pkgname=ksm_preload
pkgname=lib32-$_pkgname-git
pkgver=0.10.9.r459df0e
pkgrel=3
pkgdesc='Library which allows legacy applications to use Kernel Same-page Merging'
url=http://vleu.net/ksm_preload/
arch=(x86_64)
license=(GPL3)
source=("git+https://github.com/unbrice/$_pkgname.git")
sha256sums=(SKIP)
depends=(lib32-glibc)
provides=("lib32-$_pkgname=$pkgver")
conflicts=("lib32-$_pkgname")
makedepends=(gcc-multilib lib32-gcc-libs git cmake)

cdgit() { cd -- "$_pkgname"; }

pkgver() {
    cdgit
    local version="$(git describe --always --match 'v*.*')"
    version=${version#v}
    version=${version//-/.}
    version=${version/.g/.r}
    printf '%s\n' "$version"
}

build() {
    export CC="${CC:-gcc} -m32"
    export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

    cdgit
    cmake --install-prefix=/usr -DCMAKE_INSTALL_LIBDIR=lib32 -DCMAKE_BUILD_TYPE=Release .
    make
    sed -i 's@../share/ksm_preload/@../lib32/@g' ksm-wrapper
}

package() {
    cdgit
    make install DESTDIR="$pkgdir"
    mkdir -p -- "$pkgdir/usr/lib32"
    mv -- "$pkgdir/usr/bin/ksm-wrapper" "$pkgdir/usr/bin/ksm-wrapper32"
    mv -- "$pkgdir/usr/share/ksm_preload/libksm_preload.so" "$pkgdir/usr/lib32/libksm_preload.so"
    rmdir --ignore-fail-on-non-empty --parents -- "$pkgdir/usr/share/ksm_preload"
}
