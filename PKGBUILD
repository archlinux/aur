# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=hm-git
pkgver=16.22.r2.g9ea3a3e9
pkgrel=1
pkgdesc='HEVC Test Model - the reference software for HEVC (git version)'
arch=('x86_64')
url='https://hevc.hhi.fraunhofer.de/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'lsb-release' 'openmp')
provides=('hm' 'hm-svn')
conflicts=('hm' 'hm-svn')
replaces=('hm-svn')
source=('git+https://vcgit.hhi.fraunhofer.de/jct-vc/HM.git')
sha256sums=('SKIP')

prepare() {
    cp -a HM HM-highbit
}

pkgver() {
    git -C HM describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^HM\.//'
}

build() {
    cmake -B build -S HM \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DHIGH_BITDEPTH:BOOL='OFF' \
        -Wno-dev
    make -C build
    
    cmake -B build-highbit -S HM-highbit \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DHIGH_BITDEPTH:BOOL='ON' \
        -Wno-dev
    make -C build-highbit
}

package() {
    local _file
    while read -r -d '' _file
    do
        install -D -m755 "$_file" -t "${pkgdir}/usr/bin"
    done < <(find HM/bin -maxdepth 1 -type f -executable -print0)
    
    while read -r -d '' _file
    do
        install -D -m755 "HM-highbit/bin/${_file}" "${pkgdir}/usr/bin/${_file/Static/HighBitDepthStatic}"
    done < <(find HM-highbit/bin -maxdepth 1 -type f -executable -print0 | sed -z 's|HM\-highbit/bin||')
    
    install -D -m644 HM/README    -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 HM/doc/*.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 HM/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
