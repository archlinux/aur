# Maintainer: Lukas Böger <dev___AT___lboeger___DOT___de>

pkgname=feappv
pkgver=31
pkgrel=1

pkgdesc='A finite element analysis program'
url='http://www.ce.berkeley.edu/projects/feap/feappv'

arch=('i686' 'x86_64')
license=('custom')

makedepends=('cmake' 'gcc-fortran')
depends=('libx11')
install="${pkgname}.install"

source=("${url}/${pkgname}${pkgver}.zip")

md5sums=('6031611765744f2cf51b4d928be38a0b')

_cmakeBuildDir=build

build() {
    test -d $_cmakeBuildDir || mkdir $_cmakeBuildDir
    cd $_cmakeBuildDir

    FFLAGS="-O0" cmake ../ver${pkgver}

    make

    ar rv libFeappvLib.a CMakeFiles/feappv.dir/main/feappv.f.o

    echo 'Copyright (c) 1984-2013: Robert L. Taylor' > LICENSE
}

package() {
    _includeTargetDir="${pkgdir}/usr/include/${pkgname}"
    _shareTargetDir="${pkgdir}/usr/share/${pkgname}"

    mkdir -pm 755 ${_shareTargetDir}
    install -Dm 644 ../{makefile,example.f} ${_shareTargetDir}

    cd $_cmakeBuildDir

    install -m644 -D libFeappvLib.a "${pkgdir}/usr/lib/lib${pkgname}${pkgver}.a"
    ln -s "lib${pkgname}${pkgver}.a" "${pkgdir}/usr/lib/lib${pkgname}.a"
    install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m755 -D feappv "${pkgdir}/usr/bin/${pkgname}"
    install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${srcdir}/ver${pkgver}/include"

    mkdir -pm 755 ${_includeTargetDir}
    cp -r * ${_includeTargetDir}
    chmod -R 755 ${_includeTargetDir}/integer[48]
    chmod -R 644 ${_includeTargetDir}/{*.h,integer[48]/*.h}
}
