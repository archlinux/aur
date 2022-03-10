# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=gyroflow
# Hyphens are not allowed in `pkgver`.
_pkgver=1.0.0-rc5
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Video stabilization using gyroscope data"
arch=("x86_64")
url="https://gyroflow.xyz/"
license=("GPL3")
depends=("qt6-base" "qt6-quick3d" "qt6-declarative" "qt6-3d" "pulseaudio" "libxkbcommon" "opencv" "opencl-driver" "libva-mesa-driver" "ocl-icd" "ffmpeg")
makedepends=("cargo" "opencl-headers")
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${_pkgver}.tar.gz"
        "use-system-dynamic-opencv.patch"
        "gyroflow.desktop")
sha512sums=("e0e81888ce27634ba49fe2bb3831d870b29e0dd9e1818ff9ccc914b079db623c793aa538cc4996b1625bcd3389b83d9204b15de5117856fdc5aea2296068dab2"
	    "7d0b2be79f97304d814279ba1382864cdc314a81994b7cebc2126f20dbe70f1a6260bb3af3379f2d7a98ce36255aa928f2955afdebcd7b141bfed2fc824613f8"
	    "03279c2568350619f1cbdd88960e77773f55bafa4da81de4fb9276743fa66ff11edd0149af9caae7ecba3afa3b8704217552634973373aaaf98f20f64fa95a84")

prepare() {
	cd "${pkgname}-${_pkgver}"
	patch --forward --strip=1 --input="${srcdir}/use-system-dynamic-opencv.patch"
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
