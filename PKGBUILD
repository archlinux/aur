# Maintainer: Score_Under <seejay.11@gmail.com>
_pkgname=ksm_preload
pkgname=$_pkgname-git
pkgver=0.10.9.r459df0e
pkgrel=2
pkgdesc='Library which allows legacy applications to use Kernel Same-page Merging'
url=http://vleu.net/ksm_preload/
arch=(i686 x86_64)
license=(GPL3)
source=("git+https://github.com/unbrice/$_pkgname.git"
        ksm-wrapper)
optdepends=('sh: ksm-wrapper script')
makedepends=(cmake git)
sha256sums=('SKIP'
            '8f02470b27c1678ad6041e8c6d3d3bac218c54b14cd306d921e806464b4ca5bd')

cdgit() { cd -- "$_pkgname"; }

pkgver() {
    cdgit
    local version="$(git describe --always --match 'v*.*')"
    version=${version#v}
    version=${version//-/.}
    version=${version/.g/.r}
    printf '%s\n' "$version"
}

prepare() {
    cdgit

    # Use (/usr)/lib rather than (/usr)/share/ksm_preload for native
    # libraries, because /usr/share is supposed to be arch-independent...
    # This will still need a little hacking of ksm-wrapper to get it
    # working with lib32 programs too.
    sed -i.orig 's.\(LIBRARY DESTINATION\) share/ksm_preload.\1 lib/.g' CMakeLists.txt
}

build() {
    cdgit
    cmake -D CMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cdgit
    make install DESTDIR="$pkgdir"

    # Install replacement ksm-wrapper afterwards
    # The original is unnecessarily complex and is full of silly mistakes.
    # I will one day get around to poking the author about that...
    install -m755 -Dt "$pkgdir/usr/bin" ../ksm-wrapper
}
