# This is a mjpg-streamer PKGBUILD file.
# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Tri Le <trile7@gmail.com>

pkgname=mjpg-streamer-git
pkgver=a48d422
pkgrel=1
pkgdesc="Stream mjpeg frames from a webcam via http"
arch=('i686' 'x86_64' 'arm')
url="http://sourceforge.net/projects/mjpg-streamer"
license=('GPL')
depends=('libjpeg-turbo' imagemagick)

svnmod=mjpg-streamer

provides=("${pkgname}")
conflicts=('mjpg-streamer' 'mjpg-streamer-svn')

makedepends=("git" "gcc")

source=(
    "${pkgname}::git+https://github.com/codewithpassion/mjpg-streamer.git"
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
    cd "${srcdir}/${pkgname}/mjpg-streamer"

    #patch -p1 < ${srcdir}/uvc.patch

    find . -type f -print0 | xargs -0 sed -i s/videodev.h/videodev2.h/g
    sed -i "s/make -C plugins\/input_gspcav1/# make -C plugins\/input_gspcav1/" Makefile
    sed -i "s/cp plugins\/input_gspcav1\/input_gspcav1.so/# cp plugins\/input_gspcav1\/input_gspcav1.so/" Makefile
    # sed -i "s/PLUGINS += input_gspcav1.so/# PLUGINS += input_gspcav1.so/" Makefile
}

build() {
    cd "${srcdir}/${pkgname}/mjpg-streamer"

    msg "Starting make..."
    make clean all || return 1
}

package() {
    cd "${srcdir}/${pkgname}/mjpg-streamer"

    mkdir -p ${pkgdir}/usr/share/${svnmod}/www/
    mkdir -p ${pkgdir}/usr/lib
    install *.so ${pkgdir}/usr/lib/
    install -m 644 www/* ${pkgdir}/usr/share/${svnmod}/www/
    install -m 755 www/functions.js ${pkgdir}/usr/share/${svnmod}/www/
    mkdir -p ${pkgdir}/usr/bin
    install mjpg_streamer ${pkgdir}/usr/bin/
    install -m 644 CHANGELOG LICENSE README start.sh ${pkgdir}/usr/share/${svnmod}/
}
