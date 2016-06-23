# Maintainer: Peter Reschenhofer <peter.reschenhofer@gmail.com>
pkgbase=cura-not-so-old
pkgname=cura-not-so-old
pkgver=15.04.6
pkgrel=1
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker. (the offical one)"
depends=('python2' 'wxpython' 'python2-opengl' 'python2-pyserial' 'python2-numpy')
provides=('cura')
url="https://ultimaker.com/en/products/cura-software"
license=('AGPLv3')
arch=('i686' 'x86_64')
if [ "$CARCH" == x86_64 ]; then
    source+=(http://software.ultimaker.com/current/cura_${pkgver}-debian_amd64.deb)
    sha1sums+=('1a53337079c45067ed791c94682fcb4771cecc54')
elif [ "$CARCH" == i686 ]; then
    source+=(http://software.ultimaker.com/current/cura_${pkgver}-debian_i386.deb)
    sha1sums+=('245777738ec175fedfd9734637487c34638a0f25')
fi

install=cura.install

build()
{
    cd "${srcdir}"

    # unpack
    tar --xz -xf data.tar.xz
}

package()
{
    # remove python-power since we have it in the deps:
    # rm -rf "${srcdir}"/usr/share/cura/power/

    # change python to python2 everywhere:
    sed -i 's|\/usr\/bin\/python|\/usr\/bin\/python2|' "${srcdir}"/usr/share/applications/cura.desktop "${srcdir}"/usr/share/cura/cura.py "${srcdir}"/usr/bin/cura

    #sed -i '346s|.*|\t\t\tpos = pos + (objMin + objMax) / 2.0 * 1000|' "${srcdir}"/usr/share/cura/Cura/util/sliceEngine.py

    # add a new line (pedantic):
    echo >> "${srcdir}/usr/bin/cura"

    # add the path since we need to call slicer exactly from /usr/share/cura
    sed -i '6 i os.chdir("/usr/share/cura")' "${srcdir}"/usr/share/cura/cura.py
    sed -i 's|os.path.dirname(__file__)|"/usr/share/cura"|' "${srcdir}"/usr/share/cura/cura.py

    cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
