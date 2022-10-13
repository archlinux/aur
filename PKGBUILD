# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=gyroflow
# Hyphens are not allowed in `pkgver`.
_pkgver=1.2.0
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="Video stabilization using gyroscope data"
arch=("x86_64")
url="https://gyroflow.xyz/"
license=("GPL3")
depends=("libc++" "qt6-base" "qt6-quick3d" "qt6-declarative" "qt6-3d" "pulseaudio" "libxkbcommon" "opencv" "opencl-driver" "libva-mesa-driver" "ocl-icd" "ffmpeg")
makedepends=("cargo" "opencl-headers")
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${_pkgver}.tar.gz"
        "gyroflow.desktop")
sha512sums=('92ff3a5e7a7e1916d3617ea3d132ea5ab6171e8cea81a00db46da289e66873eda86a57c2cb4d999524cc1375d82744f38caf241599a9490af883eb8e6d8f56b9'
            '03279c2568350619f1cbdd88960e77773f55bafa4da81de4fb9276743fa66ff11edd0149af9caae7ecba3afa3b8704217552634973373aaaf98f20f64fa95a84')

prepare() {
	cd "${pkgname}-${_pkgver}"
	cargo update
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${_pkgver}"
	# Currently Arch has both qt5 and qt6, and `/usr/bin/qmake` is qt5, this
	# package needs qt6.
	export QMAKE="/usr/bin/qmake6"
	# Use system libraries.
	export FFMPEG_DIR="/usr"
	# Since 9eecb6c1ee89ea5d137758c5ada45e1c5895e636, if OPENCV_LINK_PATHS
	# does not contain `vcpkg`, it will dynamically link to system opencv.
	export OPENCV_LINK_PATHS="/usr"
	# See <https://github.com/gyroflow/gyroflow/blob/master/__env-linux.sh>.
	# But I need to add `opencv_dnn` to build it.
	export OPENCV_LINK_LIBS="opencv_core,opencv_calib3d,opencv_features2d,opencv_imgproc,opencv_video,opencv_flann,opencv_dnn"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

# It seems that runing tests will rebuild program again...
# check() {
# 	cd "${pkgname}-${_pkgver}"
# 	export RUSTUP_TOOLCHAIN=stable
# 	cargo test --frozen --all-features
# }

package() {
	cd "${pkgname}-${_pkgver}"
	# Gyroflow currently has no compiling options for custom resource path,
	# so I have to install it into `/opt` to put it together with camera
	# presets.
	install -Dm0755 "target/release/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
	# I can't find any existing package for this file.
	install -Dm0755 "target/release/libmdk.so.0" "${pkgdir}/opt/${pkgname}/libmdk.so.0"
	cp -a "resources/camera_presets" "${pkgdir}/opt/${pkgname}"
	install -Dm0644 "resources/icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
	install -Dm0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
