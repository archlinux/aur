# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=hm-git
pkgver=17.0.r0.gd7d7e391
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
source=('git+https://vcgit.hhi.fraunhofer.de/jct-vc/HM.git'
        '010-hm-disable-werror.patch')
sha256sums=('SKIP'
            '26ed4fb40812ecfce04b1301dc159fb2a575ece22a3532fe991f72e0f4e9488a')

prepare() {
    patch -d HM -Np1 -i "${srcdir}/010-hm-disable-werror.patch"
    cp -a HM{,-highbit}
}

pkgver() {
    git -C HM describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^HM\.//'
}

build() {
    # fix kvazaar tests
    export CXXFLAGS+=' -Wp,-U_GLIBCXX_ASSERTIONS'
    
    local -a _common_opts=(
        '-DCMAKE_BUILD_TYPE:STRING=Release'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-Wno-dev')
    
    cmake -B build -S HM "$_common_opts" -DHIGH_BITDEPTH:BOOL='OFF'
    make -C build
    
    cmake -B build-highbit -S HM-highbit "$_common_opts" -DHIGH_BITDEPTH:BOOL='ON'
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
    
    mv "${pkgdir}/usr/bin"/{parcatStatic,hm-parcatStatic}
    install -D -m644 HM/doc/*.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 HM/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
