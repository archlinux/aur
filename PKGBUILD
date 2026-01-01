# Maintainer: awh (https://aur.archlinux.org/account/awh)

pkgname=baballonia
pkgver=v1.1.0.9rc6
_trainerver=1.3.8-linux-paths
_calibrationver=1.0.6
pkgrel=2
pkgdesc="A cross-platform, hardware-agnostic VR eye and face tracking application."
arch=('x86_64')
url="https://github.com/Project-Babble/Baballonia"
_trainerurl="https://github.com/Project-Babble/BabbleTrainer"
license=('LicenseRef-Babble Software Distribution License 1.0')

makedepends=(
    dotnet-sdk-8.0
    git
    ca-certificates

    # babbletrainer
    python-build
    python-installer
    python-wheel
    python-setuptools
)
depends=(
    dotnet-runtime-8.0
    lttng-ust
    fontconfig
    libglvnd
    libjpeg
    hicolor-icon-theme
    gstreamer
    gst-plugins-base-libs
    glib2
    onnxruntime
    espflash

    # babbletrainer
    python
    opencv
    python-pytorch
    python-numpy
    python-opencv
    python-pillow
    python-onnx
    python-onnxscript
    python-tqdm
)
optdepends=(
    'python-pytorch-opt: with AVX2 CPU optimizations for training'
    'python-pytorch-cuda: with CUDA for training'
    'python-pytorch-opt-cuda: with CUDA and AVX2 CPU optimizations for training'
    'python-pytorch-rocm: with ROCm for training'
    'python-pytorch-opt-rocm: with ROCm and AVX2 CPU optimizations for training'
)

source=(
    "${pkgname}::git+${url}.git#tag=${pkgver}"
    "babbletrainer::git+${_trainerurl}.git#tag=${_trainerver}"
    "BabbleCalibration_${_calibrationver}.zip::https://github.com/Project-Babble/BabbleCalibration/releases/download/${_calibrationver}/Linux.zip"

    "baballonia.sh"
    "babbletrainer.sh"
    "Baballonia.desktop"
    "LICENSE"
   )
noextract=(
    "BabbleCalibration_${_calibrationver}.zip"
)
sha256sums=('f1c1d8023293bc3abf81758c9a32d57a0da96b7f683446fc2444c6c0f8d6c4cd'
            '5b3cd1a2a4be0021ee74ca3bb836dd8bc2e9fe23b2f16cf746da564d36362f2d'
            '3a36a498005a31a2512ffa73625895b3eb43bba1a5b64313838ab28df0586884'
            'f14601e1bca1b90fa4a83198fe7982cc4503efd83d2f5094fdfafc9abb66d760'
            '168707bdb44a6c76e2f430041689438216f431730c700e233909c6f96a5be0a3'
            'c79d564f433ef8786b125c58da586c2f40779d8978bf0d708ce68e02823ff450'
            'a0c3fedbc0083597993489730d8178d2e79fdb6c03d596cb4bebfafc819d063f')
prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
}
build() {
    cd "${srcdir}/${pkgname}/src/Baballonia.Desktop"
    dotnet publish -r linux-x64 -c Release --self-contained -f net8.0

    cd "${srcdir}/babbletrainer/babble_data"
    python -m build --wheel --no-isolation
}
package() {
    cd "${pkgname}"

    export _publishdir="src/Baballonia.Desktop/bin/Release/net8.0/linux-x64/publish"

    # force system onnxruntime since shipped library only includes cpu execution provider
    rm "${_publishdir}/libonnxruntime"*

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "$_publishdir/"* "${pkgdir}/opt/${pkgname}/"

    install -Dm644 "${_publishdir}/Assets/Icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/baballonia.png"
    install -Dm644 "${_publishdir}/Assets/Icon_32x32.ico"   "${pkgdir}/usr/share/icons/hicolor/32x32/apps/baballonia.ico"

    install -Dm755 "${srcdir}/baballonia.sh"      "${pkgdir}/usr/bin/baballonia"
    install -Dm644 "${srcdir}/Baballonia.desktop" "${pkgdir}/usr/share/applications/Baballonia.desktop"
    install -Dm644 "${srcdir}/LICENSE"            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # BabbleCalibration
    unzip "${srcdir}/BabbleCalibration_${_calibrationver}.zip" -d "${pkgdir}/opt/${pkgname}/Calibration/Linux/Overlay/"

    # espflash
    mkdir -p "${pkgdir}/opt/${pkgname}/Firmware/Linux/"
    ln -s /usr/bin/espflash "${pkgdir}/opt/${pkgname}/Firmware/Linux/espflash"

    # BabbleTrainer
    python -m installer --destdir="$pkgdir" "${srcdir}/babbletrainer/babble_data/dist/"*.whl
    mkdir -p "${pkgdir}/opt/${pkgname}/_babbletrainer"
    cp -a "${srcdir}/babbletrainer/"*.py "${pkgdir}/opt/${pkgname}/_babbletrainer"
    install -Dm755 "${srcdir}/babbletrainer.sh" "${pkgdir}/opt/${pkgname}/Calibration/Linux/Trainer/BabbleTrainer"
}
