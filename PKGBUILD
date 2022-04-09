pkgname=sasquatch-git
pkgrel=1
pkgver=r60.bd864a1
pkgdesc='Patched unsquashfs utility with support for vendor-specific SquashFS implementations'
arch=('x86_64')
url='https://github.com/devttys0/sasquatch'
license=(GPL2)
depends=('lzo' 'xz' 'zlib')
makedepends=('git')
provides=('sasquatch')
conflicts=('sasquatch')
source=("${pkgname}::git+$url.git"
    "https://downloads.sourceforge.net/project/squashfs/squashfs/squashfs4.3/squashfs4.3.tar.gz"
    "0001-No-Werror.patch")
sha512sums=('SKIP'
            '854ed7acc99920f24ecf11e0da807e5a2a162eeda55db971aba63a03f0da2c13b20ec0564a906c4b0e415bd8258b273a10208c7abc0704f2ceea773aa6148a79'
            '8f92c3589b3d74d611a2bff9b7a1933d8e2284c32dc460f060a2fc0232578bf4ca1852297180b674a3c1e63af6f2b664bf335c7224b7a6b95e464337bf222901')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 < "${srcdir}/0001-No-Werror.patch"

    cd "${srcdir}/squashfs4.3"
    patch -p0 < "${srcdir}/${pkgname}/patches/patch0.txt"
}

build() {
    cd "${srcdir}/squashfs4.3/squashfs-tools"
    make EXTRA_CFLAGS=-fcommon
}

package() {
    cd "${srcdir}/squashfs4.3/squashfs-tools"
    make INSTALL_DIR="${pkgdir}/usr/bin" install
}
