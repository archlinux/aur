# Maintainer: Score_Under <seejay.11@gmail.com>
_pkgname=ksm_preload
pkgname=$_pkgname-git
pkgver=0.10.10.r5645e4a
pkgrel=1
pkgdesc='Library which allows legacy applications to use Kernel Same-page Merging'
url=http://vleu.net/ksm_preload/
arch=(i686 x86_64)
license=(GPL3)
source=("git+https://github.com/unbrice/$_pkgname.git"
        ksm-wrapper
        fix-cmakelists.patch
        fix-mmap2-stub.patch)
optdepends=('sh: ksm-wrapper script')
makedepends=(cmake git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
sha256sums=('SKIP'
            '8f02470b27c1678ad6041e8c6d3d3bac218c54b14cd306d921e806464b4ca5bd'
            '355b14fdb1d4121ec021fb3cf5985cf1cc3d8730fe8ddee98705c29847718e12'
            'b748f505fbb02c1731c1d6564c40290224c7110b3d5dfb950e64b06d9358c3c9')

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
    patch -Np1 < ../fix-cmakelists.patch
    # Fix mmap2 stub to compile on compilers targeting newer C standards
    # (empty argument list no longer means unspecified amount of arguments)
    patch -Np1 < ../fix-mmap2-stub.patch
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
    install -m755 -Dt "$pkgdir/usr/bin" ../ksm-wrapper
}
