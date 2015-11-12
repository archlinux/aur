# Maintainer: Score_Under <seejay.11@gmail.com>
_pkgname=ksm_preload
pkgname=lib32-$_pkgname-git
pkgver=0.10.4.r254cc3b
pkgrel=2
pkgdesc='Library which allows legacy applications to use Kernel Same-page Merging'
url=http://vleu.net/ksm_preload/
arch=(x86_64)
license=GPL3
source=("git+https://github.com/unbrice/$_pkgname.git")
sha256sums=(SKIP)
depends=(lib32-glibc)
makedepends=(gcc-multilib)

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
    autoreconf -is
    ./configure --prefix=/usr --libdir=/usr/lib32
    make
}

package() {
    cdgit
    make install DESTDIR="$pkgdir"
    rm -rf -- "${pkgdir:?}/usr/share"
}
