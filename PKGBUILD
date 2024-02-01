# Maintainer: Mikata Riko <sanbikappa@qq.com>
# Contributor: pureboys <yuyuud@yuyuud@gmail.com>

pkgname='kikoplay'
pkgver=1.0.1
pkgrel=1
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3' 'MIT')
url="https://github.com/KikoPlayProject/KikoPlay"
# using standalone liblua53.a, remove 'lua53' from depends.
depends=('mpv' 'qhttpengine' 'qt5-websockets')
makedepends=('cmake' 'git')
optdepends=('aria2: for downloading')
conflicts=('kikoplay-bin')
source=(
    "https://github.com/KikoPlayProject/KikoPlay/archive/refs/tags/${pkgver}.tar.gz"
    "git+https://github.com/KikoPlayProject/KikoPlayScript"
    "git+https://github.com/KikoPlayProject/KikoPlayApp"
)
sha256sums=(
    "da33b02f2b4264c3040feec8a24986f323174feac3505ec52e0a68e5c9ce7b76"
    SKIP
    SKIP
)

prepare() {
    # rename directory to "KikoPlay" to match the KikoPlay.pro file.
    # otherwise qmake could not find the KikoPlay.pro file.
    [ -d "KikoPlay" ] && rm -rf "KikoPlay"
    mv "${srcdir}/KikoPlay-${pkgver}" "KikoPlay"
}

build() {
    # use multi job compile
    CPU=$(grep 'processor' /proc/cpuinfo | wc -l)
    JOBNUMBER=$(($CPU/2))
    if [ $JOBNUMBER -lt 1 ]; then
        JOBNUMBER=1
    fi

    # https://github.com/KikoPlayProject/KikoPlay/issues/97#issuecomment-1427057614
    # compile a standalone liblua53.a, remove lua53 from depends.
    cmake -B"${srcdir}/build-lua53" -S"${srcdir}/KikoPlay/Extension/Lua"
    cd "${srcdir}/build-lua53"
    make -j$JOBNUMBER
    ln -sf "${srcdir}/build-lua53/libmyLua53.a" "${srcdir}/KikoPlay/lib/x64/linux/liblua53.a"
    ln -sf "${srcdir}/build-lua53/libmyLua53.a" "${srcdir}/KikoPlay/Extension/Lua/liblua53.a"

    # compile kikoplay
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"
    qmake "${srcdir}/KikoPlay"
    make -j$JOBNUMBER

    ## only for test, place the "script" under the path of KikoPlay binary
    ## then we can test the script function without packaging or installing KikoPlay
    #mkdir -p "${srcdir}/build/script"
    #cp -r "${srcdir}"/KikoPlayScript/* "${srcdir}/build/script"
}

package() {
    cd "${srcdir}/build"
    make install INSTALL_ROOT="${pkgdir}"
    ln -sf KikoPlay "${pkgdir}/usr/bin/kikoplay"
    
    # also package KikoPlayScript KikoPlayApp, but only exclude the ".git" directory
    install -dm755 "${pkgdir}/usr/share/kikoplay/extension/script"
    cp -r "${srcdir}"/KikoPlayScript/{bgm_calendar,danmu,library,resource} "${pkgdir}/usr/share/kikoplay/extension/script"
    install -dm755 "${pkgdir}/usr/share/kikoplay/extension/app"
    cp -r "${srcdir}"/KikoPlayApp/app/* "${pkgdir}/usr/share/kikoplay/extension/app"

    install -Dm644 "${srcdir}/KikoPlay/KikoPlay使用说明.pdf" "${pkgdir}/usr/share/doc/kikoplay/KikoPlay-user-manual.pdf"
    install -Dm644 "${srcdir}/KikoPlay/KikoPlayWeb接口参考.pdf" "${pkgdir}/usr/share/doc/kikoplay/KikoPlayWeb-api-reference.pdf"
    install -dm755 "${pkgdir}/usr/share/doc/kikoplay/KikoPlayScript"
    cp "${srcdir}"/KikoPlayScript/*.md "${pkgdir}/usr/share/doc/kikoplay/KikoPlayScript"
    install -dm755 "${pkgdir}/usr/share/doc/kikoplay/KikoPlayApp"
    cp "${srcdir}"/KikoPlayApp/*.md "${pkgdir}/usr/share/doc/kikoplay/KikoPlayApp"
    cp -r "${srcdir}"/KikoPlayApp/api/* "${pkgdir}/usr/share/doc/kikoplay/KikoPlayApp"

    install -Dm644 "${srcdir}/KikoPlay/LICENSE" "${pkgdir}/usr/share/licenses/kikoplay/KikoPlay.license"
    install -Dm644 "${srcdir}/KikoPlayScript/LICENSE" "${pkgdir}/usr/share/licenses/kikoplay/KikoPlayScript.license"
    install -Dm644 "${srcdir}/KikoPlayApp/LICENSE" "${pkgdir}/usr/share/licenses/kikoplay/KikoPlayApp.license"
}

