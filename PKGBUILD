# This is a mjpg-streamer PKGBUILD file.
# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Tri Le <trile7@gmail.com>

pkgname=mjpg-streamer-svn
pkgver=182
pkgrel=2
pkgdesc="Stream mjpeg frames from a webcam via http"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mjpg-streamer"
license=('GPL')
depends=('libjpeg-turbo' imagemagick)

provides=("${pkgname}")
conflicts=('mjpg-streamer')

makedepends=("subversion" "gcc")
svnmod=mjpg-streamer
svntrunk="http://svn.code.sf.net/p/${svnmod}/code"

source=(
    "${pkgname}::svn+http://svn.code.sf.net/p/${svnmod}/code/"
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
    pkgver_svn
}

prepare() {
if [ 0 = 1 ]; then
    cd "${srcdir}"
    if [ -d ${pkgname}/.svn ]; then
        (cd ${pkgname} && svn up -r $pkgver)
    else
        svn co ${svntrunk} --config-dir ./ -r ${pkgver} ${pkgname}
    fi
    msg "SVN checkout done or server timeout"
fi

    rm -rf "${srcdir}/${pkgname}-build"
    cp -r "${srcdir}/${pkgname}" "${srcdir}/${pkgname}-build"

    cd "${srcdir}/${pkgname}-build/${svnmod}"

    #patch -p1 < ${srcdir}/uvc.patch

    find . -type f -print0 | xargs -0 sed -i s/videodev.h/videodev2.h/g
    sed -i "s/make -C plugins\/input_gspcav1/# make -C plugins\/input_gspcav1/" Makefile
    sed -i "s/cp plugins\/input_gspcav1\/input_gspcav1.so/# cp plugins\/input_gspcav1\/input_gspcav1.so/" Makefile
    # sed -i "s/PLUGINS += input_gspcav1.so/# PLUGINS += input_gspcav1.so/" Makefile
}

build() {
    cd "${srcdir}/${pkgname}-build/${svnmod}"

    msg "Starting make..."
    make clean all || return 1
}

package() {
    cd "${srcdir}/${pkgname}-build/${svnmod}"

    mkdir -p ${pkgdir}/usr/share/${svnmod}/www/
    mkdir -p ${pkgdir}/usr/lib
    install *.so ${pkgdir}/usr/lib/
    install -m 644 www/* ${pkgdir}/usr/share/${svnmod}/www/
    install -m 755 www/functions.js ${pkgdir}/usr/share/${svnmod}/www/
    mkdir -p ${pkgdir}/usr/bin
    install mjpg_streamer ${pkgdir}/usr/bin/
    install -m 644 CHANGELOG LICENSE README start.sh ${pkgdir}/usr/share/${svnmod}/
}
