# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>

pkgname=boost-build-nightly
pkgver=20140102
pkgrel=1
pkgdesc="Boost build system, Nightly build"
arch=('any')
url="http://www.boost.org/doc/tools/build/"
license=('custom:boost')
depends=('lib32-glibc' 'python')
conflicts=('boost-build')
source=("http://www.boost.org/LICENSE_1_0.txt")
md5sums=('e4224ccaecb14d942c71d31bef20d78c')

package() {

        BD_NAME="boost-build"
        BD_SRC="${BD_NAME}.tar.bz2"
        BD_SRC_URI="http://www.boost.org/common/code/boost_download.php/${BD_SRC}"

        cd ${srcdir}
        rm -rf build
        rm -rf ${BD_SRC}
        rm -rf ${BD_NAME}

        msg "Downloading..."
        wget -N ${BD_SRC_URI}
        
        msg "Extracting..."
        bsdtar -x -f ${BD_SRC}

        msg "Copying..."
        cp -r ${BD_NAME} build

        mkdir -p ${pkgdir}/usr/share
        mkdir -p ${pkgdir}/etc

        rm -Rf ${BD_NAME}/jam_src
        rm -Rf ${BD_NAME}/debian
        rm -Rf ${BD_NAME}/engine

        cp -R ${BD_NAME} ${pkgdir}/usr/share
        install -Dm644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

        echo "using gcc ;" > ${pkgdir}/etc/site-config.jam

        cd build
        sh bootstrap.sh
        install -D -m755 b2 ${pkgdir}/usr/bin/b2-nightly
}
