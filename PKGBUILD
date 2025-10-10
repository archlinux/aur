# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=anythingllm
pkgname="${_appname}-desktop-bin"
_pkgname=Anything-LLM-Desktop
pkgver=1.9.0
_electronversion=31
pkgrel=1
pkgdesc="The all-in-one AI application, tool suite, and API for RAG & Agents for Docker & Desktop.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://anythingllm.com/"
_ghurl="https://github.com/Mintplex-Labs/anything-llm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
    'ollama'
    'ollama-cuda'
    'ollama-rocm'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::https://cdn.anythingllm.com/latest/${_pkgname//-/}-Arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::https://cdn.anythingllm.com/latest/${_pkgname//-/}.AppImage")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('dd34c3b37e026fafa4a2eaf826571da805490c75c9cecb1e610cc91cecb74a42')
sha256sums_x86_64=('aea9aded067976d9a638dc4b2537c48a11b8e3edc6d5085bfe7c6b070fe8b03f')
pkgver() {
    cd "${srcdir}/squashfs-root"
    set -o pipefail
    grep "X-AppImage-Version" "${pkgname%-bin}.desktop" | sed "s/X-AppImage-Version=//;s/-/_/g"
}
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist-electron" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} \;
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    ln -sf "/usr/bin/ollama" "${srcdir}/squashfs-root/resources/ollama/bin/llm"
    _file_list=(libggml-base.so libggml-cpu-alderlake.so libggml-cpu-haswell.so libggml-cpu-icelake.so libggml-cpu-sandybridge.so \
        libggml-cpu-skylakex.so libggml-cpu-sse42.so libggml-cpu-x64.so libggml-cuda.so libggml-hip.so)
	for _files in "${_file_list[@]}";do
		ln -sf "/usr/lib/ollama/${_files}" "${srcdir}/squashfs-root/resources/ollama/lib/${_files}"
	done
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,backend,ollama,static} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}