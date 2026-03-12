# Maintainer: awh (https://aur.archlinux.org/account/awh)
# Contributor: jeskko (https://aur.archlinux.org/account/jeskko)

pkgname=baballonia
pkgver=v1.1.1.0rc6
_trainerver=1.3.8-linux-paths
_calibrationver=v1.0.7rc1
pkgrel=1
pkgdesc="A cross-platform, hardware-agnostic VR eye and face tracking application."
arch=('x86_64')
url="https://github.com/Project-Babble/Baballonia"
_trainerurl="https://github.com/Project-Babble/BabbleTrainer"
license=('LicenseRef-Babble Software Distribution License 1.0')

makedepends=(
    dotnet-sdk-10.0
    git
    ca-certificates
    unzip

    # babbletrainer
    python-build
    python-installer
    python-wheel
    python-setuptools
)
depends=(
    dotnet-runtime-10.0
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
sha256sums=('8b91ae22735f32999480db5f49d21cfdfad60210a0b075aaec9ed77f9030d5be'
            '5b3cd1a2a4be0021ee74ca3bb836dd8bc2e9fe23b2f16cf746da564d36362f2d'
            '5ba6642d7500a23ec0783143a0072da0cbdb744795c9abbaa0f8238ecda40aff'
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
    dotnet publish -r linux-x64 -c Release --self-contained -f net10.0

    cd "${srcdir}/babbletrainer/babble_data"
    python -m build --wheel --no-isolation
}
package() {
    cd "${pkgname}"

    export _publishdir="src/Baballonia.Desktop/bin/Release/net10.0/linux-x64/publish"

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
