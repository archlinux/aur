# Maintainer: Mikata Riko <sanbikappa@qq.com>
# Contributor: pureboys <yuyuud@yuyuud@gmail.com>

pkgname='kikoplay'
pkgver=0.9.3
pkgrel=1
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3')
url="https://github.com/KikoPlayProject/KikoPlay"
# using standalone liblua53.a, remove 'lua53' from depends.
depends=('mpv' 'qhttpengine')
makedepends=('cmake' 'git')
optdepends=('aria2: for downloading')
conflicts=('kikoplay-bin')
source=(
    "https://github.com/KikoPlayProject/KikoPlay/archive/refs/tags/${pkgver}.tar.gz"
    "git+https://github.com/KikoPlayProject/KikoPlayScript"
)
sha256sums=(
    "96b8818450a8354ea960e1eec575830d7ed2800e90b1025ec4f9358d390e8669"
    SKIP
)

prepare() {
    # rename directory to "KikoPlay" to match the KikoPlay.pro file.
    # otherwise qmake could not find the KikoPlay.pro file.
    [ -d "KikoPlay" ] && rm -rf "KikoPlay"
    mv "${srcdir}/KikoPlay-${pkgver}" "KikoPlay"
}

build() {
    # https://github.com/KikoPlayProject/KikoPlay/issues/97#issuecomment-1427057614
    # compile a standalone liblua53.a, remove lua53 from depends.
    cmake -B"${srcdir}/build-lua53" -S"${srcdir}/KikoPlay/Script/lua"
    cd "${srcdir}/build-lua53"
    make
    ln -sf "${srcdir}/build-lua53/libmyLua53.a" "${srcdir}/KikoPlay/lib/x64/linux/liblua53.a"
    ln -sf "${srcdir}/build-lua53/libmyLua53.a" "${srcdir}/KikoPlay/Script/lua/liblua53.a"

    # compile kikoplay
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"
    qmake "${srcdir}/KikoPlay"
    make

    ## only for test, place the "script" under the path of KikoPlay binary
    ## then we can test the script function without packaging or installing KikoPlay
    #mkdir -p "${srcdir}/build/script"
    #cp -r "${srcdir}"/KikoPlayScript/* "${srcdir}/build/script"
}

package() {
    cd "${srcdir}/KikoPlay"
    install -Dm644 KikoPlay使用说明.pdf "${pkgdir}/usr/share/doc/kikoplay/help.pdf"
    
    cd "${srcdir}/build"
    make install INSTALL_ROOT="${pkgdir}"
    ln -sf KikoPlay "${pkgdir}/usr/bin/kikoplay"
    
    # also package KikoPlayScript, but only exclude the ".git" directory
    install -dm755 "${pkgdir}/usr/share/kikoplay/script"
    cp -r "${srcdir}"/KikoPlayScript/* "${pkgdir}/usr/share/kikoplay/script"
}

