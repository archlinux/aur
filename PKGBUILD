# Maintainer: bjin <bjin@ctrl-d.org>
# Contributor: Alynx Zhou <alynx.zhou@gmail.com>

_pkgname=gyroflow
pkgname=${_pkgname}-git
pkgver=1.1.0.r0.g66fad8f
pkgrel=1
pkgdesc="Video stabilization using gyroscope data (Git version)"
arch=("x86_64")
url="https://gyroflow.xyz/"
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-appimage")
license=("GPL3")
depends=("libc++" "qt6-base" "qt6-quick3d" "qt6-declarative" "qt6-3d" "pulseaudio" "libxkbcommon" "opencv" "ocl-icd" "ffmpeg")
makedepends=("cargo" "opencl-headers" "git" "clang" "p7zip")
optdepends=("opencl-driver: OpenCL driver for GPU accelerated stabilization"
            "libva-mesa-driver: VAAPI video acceleration for NVIDIA and AMD GPU"
            "intel-media-driver: VAAPI video acceleration for Intel GPU")
source=("$_pkgname::git+https://github.com/gyroflow/gyroflow.git"
        "$_pkgname.desktop")
sha256sums=("SKIP"
            "1ee4e5f8471ef60a209d9ae6e630b7ca066cda295be54e3e95630b25a259db00")

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    cargo update
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}"
    # Currently Arch has both qt5 and qt6, and `/usr/bin/qmake` is qt5, this
    # package needs qt6.
    export QMAKE="/usr/bin/qmake6"
    # Use system libraries.
    export FFMPEG_DIR="/usr"
    export OPENCV_LINK_PATHS="/usr"
    # See <https://github.com/gyroflow/gyroflow/blob/master/__env-linux.sh>.
    # But I need to add `opencv_dnn` to build it.
    export OPENCV_LINK_LIBS="opencv_core,opencv_calib3d,opencv_features2d,opencv_imgproc,opencv_video,opencv_flann,opencv_dnn"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${_pkgname}"
    # Gyroflow currently has no compiling options for custom resource path,
    # so I have to install it into `/opt` to put it together with camera
    # presets.
    install -Dm0755 "target/release/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
    # I can't find any existing package for this file.
    install -Dm0755 "target/release/libmdk.so.0" "${pkgdir}/opt/${_pkgname}/libmdk.so.0"
    cp -a "resources/camera_presets" "${pkgdir}/opt/${_pkgname}"

    # Make camera presets directory writable. gyroflow will automatically
    # download and save new presets to this directory.
    find "${pkgdir}/opt/${_pkgname}/camera_presets" -type d -exec chmod 777 {} +

    install -Dm0644 "resources/icon.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
    install -Dm0644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Workaround for svg loading
    # See https://github.com/gyroflow/gyroflow/issues/353
    cp -a resources/icons/svg/* "${pkgdir}/usr/share/pixmaps/"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
