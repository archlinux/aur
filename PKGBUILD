# Maintainer: Mikata Riko <sanbikappa at qq dot com>
# Contributor: pureboys <yuyuud at gmail dot com>

pkgname='kikoplay'
pkgver=2.0.0
pkgrel=2
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3' 'MIT')
url="https://github.com/KikoPlayProject/KikoPlay"
# using standalone liblua53.a, remove 'lua53' from depends.
depends=('mpv' 'qt6-webengine' 'qt6-websockets' 'onnxruntime')
makedepends=('cmake' 'git' 'protobuf')
optdepends=('aria2: for downloading')
conflicts=('kikoplay-bin' 'kikolpay-beta' 'kikoplay-git')
source=(
    "https://github.com/KikoPlayProject/KikoPlay/archive/refs/tags/${pkgver}.tar.gz"
    "git+https://github.com/KikoPlayProject/KikoPlayScript"
    "git+https://github.com/KikoPlayProject/KikoPlayApp"
)
sha256sums=(
    "d80805a37921a4ba041e2a9d7a0a4269c6f67ca599c5d1552b3b03b3b0061e3a"
    SKIP
    SKIP
)

_check_api_secrets_file() {
    if [ -f "${srcdir}/KikoPlay/Common/secrets.h" ];then
        return
    elif [ -f "${srcdir}/secrets.h" ];then
        cp "${srcdir}/secrets.h" "${srcdir}/KikoPlay/Common/secrets.h"
        return
    else
        if [[ "$LANG" == "zh_"* ]];then
            echo "#################################################################"
            echo "开启KService需要app_id/app_secrets信息，但未找到 secrets.h 文件。"
            echo "详情可参考："
            echo "https://github.com/KikoPlayProject/KikoPlay/blob/master/linux.md"
            echo "和"
            echo "https://github.com/KikoPlayProject/KikoPlay/blob/master/.github/workflows/build-package.yml"
            echo ""
            echo "如果你有该文件，可以将其放置在以下位置："
            echo "${srcdir}/secrets.h"
            echo "如果你没有该文件，可以跳过相关功能的编译。"
            echo ""
            echo "是否跳过？[Y(是)/c(取消)]:"
        else
            echo "#################################################################"
            echo "KService function requires app_id and app_secrets information in secrets.h file."
            echo "secrets.h file was not found."
            echo "For details, please refer:"
            echo "https://github.com/KikoPlayProject/KikoPlay/blob/master/linux.md"
            echo "and"
            echo "https://github.com/KikoPlayProject/KikoPlay/blob/master/.github/workflows/build-package.yml"
            echo ""
            echo "If you have secrets.h , please copy this file to this location:"
            echo "${srcdir}/secrets.h"
            echo "otherwise, you can skip compiling related function."
            echo ""
            echo "Skip this function? [Y(yes)/c(cancel)]:"
        fi
    fi
    read -n 1 RETURN_REPLY
    case $RETURN_REPLY in
        Y| y)
            sed -i 's|DEFINES += KSERVICE|#DEFINES += KSERVICE|' "${srcdir}/KikoPlay/KikoPlay.pro"
            ;;
        C| c)
            echo ""
            echo "Cancelled."
            exit
            ;;
        *)
            echo ""
            echo "Unknow reply. Procceed without KService function."
            sed -i 's|DEFINES += KSERVICE|#DEFINES += KSERVICE|' "${srcdir}/KikoPlay/KikoPlay.pro"
            ;;
    esac

}

prepare() {
    # rename directory to "KikoPlay" to match the KikoPlay.pro file.
    # otherwise qmake could not find the KikoPlay.pro file.
    [ -d "KikoPlay" ] && rm -rf "KikoPlay"
    mv "${srcdir}/KikoPlay-${pkgver}" "KikoPlay"

    # new feature from version 2.0.0 requires secret file "secrets.h".
    _check_api_secrets_file

    # patch
    # only for version 2.0.0
    # https://github.com/KikoPlayProject/KikoPlay/issues/203
    sed -i '705a \
#ifdef Q_OS_LINUX\
#if (QT_VERSION >= QT_VERSION_CHECK(6, 9, 0))\
    static bool inited = false;\
    if (!inited)\
    {\
        inited = true;\
        return;\
    }\
#endif\
#endif' "${srcdir}/KikoPlay/Play/Video/mpvplayer.cpp"

    # adjust user manual location in usage tip
    sed -i 's|file:///{AppPath}\\KikoPlay使用说明.pdf|file:///usr/share/doc/kikoplay|g' "${srcdir}/KikoPlay/res/tip"

    # fix - "No cmake_minimum_required command is present" in KikoPlay/Extension/Lua/CMakeLists.
    sed -i '1 i\cmake_minimum_required(VERSION 3.21)' "${srcdir}/KikoPlay/Extension/Lua/CMakeLists.txt"

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
    mkdir -p "${srcdir}/KikoPlay/lib/x64/linux"
    ln -sf "${srcdir}/build-lua53/libmyLua53.a" "${srcdir}/KikoPlay/lib/x64/linux/liblua53.a"
    ln -sf "${srcdir}/build-lua53/libmyLua53.a" "${srcdir}/KikoPlay/Extension/Lua/liblua53.a"

    # compile kikoplay
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"
    qmake6 "${srcdir}/KikoPlay"
    make release -j$JOBNUMBER
}

package() {
    cd "${srcdir}/build"
    make install INSTALL_ROOT="${pkgdir}"
    ln -sf KikoPlay "${pkgdir}/usr/bin/kikoplay"
    
    # also package KikoPlayScript and KikoPlayApp, but only exclude the ".git" directory
    install -dm755 "${pkgdir}/usr/share/kikoplay/extension/script"
    cp -r "${srcdir}"/KikoPlayScript/{bgm_calendar,danmu,library,match,resource} "${pkgdir}/usr/share/kikoplay/extension/script"
    install -dm755 "${pkgdir}/usr/share/kikoplay/extension/app"
    cp -r "${srcdir}"/KikoPlayApp/app/* "${pkgdir}/usr/share/kikoplay/extension/app"

    install -Dm644 "${srcdir}/KikoPlay/docs/KikoPlay使用说明.pdf" "${pkgdir}/usr/share/doc/kikoplay/KikoPlay-user-manual.pdf"
    install -Dm644 "${srcdir}/KikoPlay/docs/KikoPlayWeb接口参考.pdf" "${pkgdir}/usr/share/doc/kikoplay/KikoPlayWeb-api-reference.pdf"
    install -dm755 "${pkgdir}/usr/share/doc/kikoplay/KikoPlayScript"
    cp "${srcdir}"/KikoPlayScript/*.md "${pkgdir}/usr/share/doc/kikoplay/KikoPlayScript"
    install -dm755 "${pkgdir}/usr/share/doc/kikoplay/KikoPlayApp"
    cp "${srcdir}"/KikoPlayApp/*.md "${pkgdir}/usr/share/doc/kikoplay/KikoPlayApp"
    cp -r "${srcdir}"/KikoPlayApp/api/* "${pkgdir}/usr/share/doc/kikoplay/KikoPlayApp"

    install -Dm644 "${srcdir}/KikoPlay/LICENSE" "${pkgdir}/usr/share/licenses/kikoplay/KikoPlay.license"
    install -Dm644 "${srcdir}/KikoPlayScript/LICENSE" "${pkgdir}/usr/share/licenses/kikoplay/KikoPlayScript.license"
    install -Dm644 "${srcdir}/KikoPlayApp/LICENSE" "${pkgdir}/usr/share/licenses/kikoplay/KikoPlayApp.license"
}

