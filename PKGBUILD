# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=ringo
pkgver=1.2.1
pkgrel=2
pkgdesc="Multi-threaded JavaScript on the JVM"
arch=('any')
url="https://ringojs.org/"
license=('Apache')
depends=('java-runtime-headless' 'bash')
makedepends=('ant' 'ivy' 'patch')
source=("git+https://github.com/ringo/ringojs.git#tag=v${pkgver}"
        'patch.diff')
sha256sums=('SKIP'
          '924efdfe4c4f71c36578759edc31bf26c52fcaed3917b813fe34b91f4137a308')

prepare() {
    cd "${srcdir}/ringojs"
    patch -i "${srcdir}/patch.diff" -p0 -s
}

build() {
    cd "${srcdir}/ringojs"
    ant update
    ant jar
}

package() {
    mkdir -p "${pkgdir}/usr/lib/${pkgname}"
    for name in bin lib modules tools run.jar; do
        cp -r "${srcdir}/ringojs/${name}" "${pkgdir}/usr/lib/${pkgname}/${name}"
    done
    
    mkdir -p "${pkgdir}/usr/bin"
    for name in ringo ringo-admin ringo-web; do
        ln -s "../lib/ringo/bin/${name}" "${pkgdir}/usr/bin/${name}"
    done
}
