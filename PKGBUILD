# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=netron-with-mime-bin
_pkgname=Netron
pkgver=9.1.0
_electronversion=42
pkgrel=2
pkgdesc="Visualizer for neural network, deep learning and machine learning models (Prebuilt, system-wide electron, with MIME file associations)"
arch=('x86_64')
url="https://netron.app/"
_ghurl="https://github.com/lutzroeder/netron"
license=('MIT')
conflicts=('netron-bin' 'netron')
provides=('netron' 'netron-bin')
depends=(
    "electron${_electronversion}"
    'shared-mime-info'
    'hicolor-icon-theme'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lutzroeder/netron/v${pkgver}/LICENSE"
    "netron.sh"
    "netron-mime.xml"
)
source_x86_64=("netron-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.rpm")
sha256sums=('535cb2c7c8990f967c106e3035e4df8d3e070144af1163b86c8bb58b65fe5e88'
            'SKIP'
            'SKIP')
sha256sums_x86_64=('dda054b987c2f7f070d9addf296d4fe76c5c2bdc822ec24c0040744a9821742a')

_check_electron_version() {
    echo "Verifying Electron version..."
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
    local _main_exe=""
    if [[ -n "${_app_dir}" ]]; then
        _main_exe=$(find "${_app_dir}" -maxdepth 1 -type f -executable -printf '%s %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)
    fi
    if [[ -n "${_main_exe}" ]]; then
        local _elec_ver=$(strings "${_main_exe}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1 | head -n 1)
        if [[ -n "${_elec_ver}" ]]; then
            if [[ "${_elec_ver}" != "${_electronversion}" ]]; then
                echo -e "\033[1;31mWarning: Electron version mismatch! Detected: ${_elec_ver}, Expected: ${_electronversion}\033[0m"
            else
                echo -e "Electron version verified: \033[1;31m${_elec_ver}\033[0m"
            fi
        fi
    else
        echo -e "\033[1;33mNote: Could not find Electron binary for version verification.\033[0m"
    fi
}

prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/netron/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/netron.sh"
    _check_electron_version
    # Fix desktop Exec path from /opt/Netron/ to /usr/bin/
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/netron.desktop"
    # Append MimeType to desktop file
    sed -i '/^Categories=/a MimeType=application/x-onnx;application/x-ort;application/x-tflite;application/x-tensorflow-pb;application/x-tensorflow-pbtxt;application/x-pytorch;application/x-safetensors;application/x-gguf;application/x-keras;application/x-coreml;application/x-mlnet;application/x-caffe;application/x-caffe-prototxt;application/x-cntk;application/x-paddle;application/x-mindir;application/x-openvino;application/x-tensorrt;application/x-ncnn;application/x-mnn;application/x-tnn;application/x-mlir;application/x-rknn;application/x-ascend-om;application/x-cambricon;application/x-megengine;application/x-kmodel;application/x-xmodel;application/x-bigdl;application/x-mar;application/x-armnn;application/x-circle;application/x-nnef;application/x-torch7;application/x-uff;application/x-kann;application/x-netron;application/x-catboost;application/x-xgboost;application/x-espdl;application/x-litertlm;' "${srcdir}/usr/share/applications/netron.desktop"
}

package() {
    # Install launch script and app resources
    install -Dm755 "${srcdir}/netron.sh" "${pkgdir}/usr/bin/netron"
    install -Dm755 -d "${pkgdir}/usr/lib/netron"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/netron/"

    # Install icon for app launcher
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/netron.png" -t "${pkgdir}/usr/share/pixmaps"

    # Install the same icon as mimetype icon for all registered MIME types
    local _mime_icons_dir="${pkgdir}/usr/share/icons/hicolor/512x512/mimetypes"
    mkdir -p "${_mime_icons_dir}"
    local _mime_types=(
        application-x-onnx
        application-x-ort
        application-x-tflite
        application-x-tensorflow-pb
        application-x-tensorflow-pbtxt
        application-x-pytorch
        application-x-safetensors
        application-x-gguf
        application-x-keras
        application-x-coreml
        application-x-mlnet
        application-x-caffe
        application-x-caffe-prototxt
        application-x-cntk
        application-x-paddle
        application-x-mindir
        application-x-openvino
        application-x-tensorrt
        application-x-ncnn
        application-x-mnn
        application-x-tnn
        application-x-mlir
        application-x-rknn
        application-x-ascend-om
        application-x-cambricon
        application-x-megengine
        application-x-kmodel
        application-x-xmodel
        application-x-bigdl
        application-x-mar
        application-x-armnn
        application-x-circle
        application-x-nnef
        application-x-torch7
        application-x-uff
        application-x-kann
        application-x-netron
        application-x-catboost
        application-x-xgboost
        application-x-espdl
        application-x-litertlm
    )
    local _src_icon="${srcdir}/usr/share/icons/hicolor/512x512/apps/netron.png"
    for _type in "${_mime_types[@]}"; do
        ln -sf "/usr/share/pixmaps/netron.png" "${_mime_icons_dir}/${_type}.png"
    done

    install -Dm644 "${srcdir}/usr/share/applications/netron.desktop" -t "${pkgdir}/usr/share/applications"

    # Install MIME type definitions
    install -Dm644 "${srcdir}/netron-mime.xml" "${pkgdir}/usr/share/mime/packages/netron-mime.xml"

    # Install license
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
