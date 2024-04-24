# Maintainer: Fang Erjing <szdytom@qq.com>
# Contributor: Mikata Riko <sanbikappa@qq.com>
# Contributor: pureboys <yuyuud@yuyuud@gmail.com>

pkgname='kikoplay-beta'
pkgcommit='5a26d8c2807118e6bb405202d091de0916043b81'
pkgver="1.0.2_${pkgcommit}"
pkgrel=1
pkgdesc="NOT ONLY A Full-Featured Danmu Player"
arch=('any')
license=('GPL3')
url="https://github.com/KikoPlayProject/KikoPlay"
depends=('mpv' 'qt5-base' 'qhttpengine' 'qt5-websockets')
makedepends=('cmake' 'git')
optdepends=('aria2: for downloading')
conflicts=('kikoplay-bin' 'kikoplay')
provides=('kikoplay')
source=(
	"https://github.com/KikoPlayProject/KikoPlay/archive/${pkgcommit}.tar.gz"
    "git+https://github.com/KikoPlayProject/KikoPlayScript"
    "git+https://github.com/KikoPlayProject/KikoPlayApp"
)
sha256sums=(
    SKIP
    SKIP
	SKIP
)

prepare() {
    # rename directory to "KikoPlay" to match the KikoPlay.pro file.
    # otherwise qmake could not find the KikoPlay.pro file.
    [ -d "KikoPlay" ] && rm -rf "KikoPlay"
    mv "${srcdir}/KikoPlay-${pkgcommit}" "KikoPlay"
}

build() {
    # use multi job compile
    CPU=$(grep 'processor' /proc/cpuinfo | wc -l)
    JOBNUMBER=$(($CPU*3/4))
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
}

package() {
    cd "${srcdir}/KikoPlay"
    install -Dm644 KikoPlay使用说明.pdf "${pkgdir}/usr/share/doc/kikoplay/help.pdf"
    install -Dm644 KikoPlay脚本开发参考.pdf "${pkgdir}/usr/share/doc/kikoplay/script-api.pdf"
    install -Dm644 KikoPlayWeb接口参考.pdf "${pkgdir}/usr/share/doc/kikoplay/web-api.pdf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/kikoplay/LICENSE"
    
    cd "${srcdir}/build"
    make install INSTALL_ROOT="${pkgdir}"
    ln -sf KikoPlay "${pkgdir}/usr/bin/kikoplay"
    
    # also package KikoPlayScript, but only exclude the ".git" directory
    install -dm755 "${pkgdir}/usr/share/kikoplay/extension/script"
    cp -r "${srcdir}"/KikoPlayScript/* "${pkgdir}/usr/share/kikoplay/extension/script"

    # package KikoPlayApp
    install -dm755 "${pkgdir}/usr/share/kikoplay/extension/app"
    cp -r "${srcdir}"/KikoPlayApp/app/* "${pkgdir}/usr/share/kikoplay/extension/app"
}

