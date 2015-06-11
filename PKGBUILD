# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=u8gfonttest-git
pkgver=b4e88de
pkgrel=1
pkgdesc="Show UTF-8 human readable strings from source code to your tiny LCD via u8glib"
arch=( 'i686' 'x86_64' 'armv5tel' 'armv7l' )
url="https://github.com/yhfudev/u8glib-fontutf8.git"
license=('GPL')
depends=('u8glib-git' sdl)
optdepends=(pcf2bdf wiringpi-git)

provides=("${pkgname}")
conflicts=('u8gfonttest')

makedepends=("git" "gcc" autoconf automake)

source=(
    "${pkgname}::git+https://github.com/yhfudev/u8glib-fontutf8.git"
    )
md5sums=(
    SKIP
    )

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

prepare() {
    cd "${srcdir}/${pkgname}"
}

build() {
    cd "${srcdir}/${pkgname}"

    msg "Starting make..."
    ./autogen.sh
    ./configure --prefix=/usr
    make clean all || return 1
}

package() {
    cd "${srcdir}/${pkgname}"

    make DESTDIR="$pkgdir" install
}
