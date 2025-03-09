# Maintainer: taotieren <admin@taotieren.com>

pkgname=usbfluxd-git
pkgver=1.0.r27.g608cb24
pkgrel=27
epoch=
pkgdesc="Redirects the standard usbmuxd socket to allow connections to local and remote usbmuxd instances so remote devices appear connected locally."
arch=($CARCH)
url="https://github.com/corellium/usbfluxd"
license=(GPL-2.0-or-later GPL-3.0-or-later)
groups=()
depends=(glibc
    libplist
    avahi)
makedepends=(git
    autoconf
    automake
    gcc)
checkdepends=()
optdepends=('usbmuxd: USB Multiplex Daemon'
    'socat: Multipurpose relay')
provides=(${pkgname%-git})
conflicts=()
replaces=(${pkgname%-git})
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git"
    "0001-Compile-using-system-libraries.patch")
noextract=()
sha256sums=('SKIP'
    '846469be65f01de4647a2f2bf64a7bbabdd47837a50b5d59b58d78a702cc88dc')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"

    sed -i 's|sbin|bin|g' usbfluxd/Makefile.am
    patch -p1 <../0001-Compile-using-system-libraries.patch
    autoreconf -i
}

build() {
    cd "${srcdir}/${pkgname}"

    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-shared=yes \
        --enable-static=no

    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make DESTDIR=${pkgdir} install
}
