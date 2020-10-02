# Maintainer: Westly Ward <sonicrules1234 at gmail dot com>
# Contributor: Marcin Kornat <rarvolt+aur@gmail.com>
pkgname=boost-63-raspi4-magi
pkgver=1.63.0
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries - This is meant only to be used as a dependency for magiwallet-magid-raspi4-git"
arch=('aarch64')
url="http://www.boost.org/"
license=('Boost Software License, Version 1.0.')
depends=('icu')
makedepends=()
options=()
source=("https://download.sourceforge.net/project/boost/boost/1.63.0/boost_1_63_0.tar.bz2")
sha256sums=('beae2529f759f6b3bf3f4969a19c2e9d6f0c503edcb2de4a61d1428519fcb3b0')

build() {
    #export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/include/python3.6m/"
    cd "${srcdir}/boost_1_63_0"
	./bootstrap.sh --with-libraries=chrono,filesystem,program_options,thread
	./b2 variant=release link=shared runtime-link=shared stage
}

package() {
    cd "${srcdir}/boost_1_63_0"
    mkdir -p ${pkgdir}/usr/lib
	./b2 install --prefix=${pkgdir}/usr
    for FILE in $(ls "${pkgdir}/usr/lib" | grep .so$); do
        rm "${pkgdir}/usr/lib/${FILE}"
    done
    for FILE in $(ls "${pkgdir}/usr/lib" | grep .a$); do
        rm "${pkgdir}/usr/lib/${FILE}"
    done

    mkdir "${pkgdir}/usr/newlib"
    chmod -R 755 "${pkgdir}/usr/newlib"
    mv "${pkgdir}/usr/lib" "${pkgdir}/usr/newlib/boost63"
    mv "${pkgdir}/usr/newlib" "${pkgdir}/usr/lib"
    
    mkdir "${pkgdir}/usr/newinclude"
    chmod -R 755 "${pkgdir}/usr/newinclude"
    mv "${pkgdir}/usr/include" "${pkgdir}/usr/newinclude/boost63"
    mv "${pkgdir}/usr/newinclude" "${pkgdir}/usr/include"
    ln -s "/usr/lib/boost63/libboost_system.so.1.63.0" "${pkgdir}/usr/lib/libboost_system.so.1.63.0"
    ln -s "/usr/lib/boost63/libboost_filesystem.so.1.63.0" "${pkgdir}/usr/lib/libboost_filesystem.so.1.63.0"
    ln -s "/usr/lib/boost63/libboost_thread.so.1.63.0" "${pkgdir}/usr/lib/libboost_thread.so.1.63.0"
    ln -s "/usr/lib/boost63/libboost_crono.so.1.63.0" "${pkgdir}/usr/lib/libboost_crono.so.1.63.0"
    ln -s "/usr/lib/boost63/libboost_program_options.so.1.63.0" "${pkgdir}/usr/lib/libboost_program_options.so.1.63.0"
#    rm -r "${pkgdir}/usr/include"

}

