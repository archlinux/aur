# Maintainer: xifan <xifan2333@gmail.com>
pkgname=fcitx5-vinput-bin
_pkgname=fcitx5-vinput
pkgver=0.1.6
pkgrel=1
pkgdesc="Offline voice input addon for Fcitx5 with optional OpenAI-compatible postprocess"
arch=('x86_64')
url="https://github.com/xifan2333/fcitx5-vinput"
license=('GPL-3.0-only')
depends=('curl' 'fcitx5' 'pipewire' 'systemd-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
install="${pkgname}.install"
_model_name="sherpa-onnx-paraformer-zh-small-2024-03-09"
source_x86_64=("${_pkgname}-${pkgver}-1-archlinux-x86_64.pkg.tar.zst::https://github.com/xifan2333/fcitx5-vinput/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1-archlinux-x86_64.pkg.tar.zst" "${_model_name}.tar.bz2::https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/${_model_name}.tar.bz2")
sha256sums_x86_64=('b56354d6c81b8b09882a34d74413880a90f0544e879621ad54c7aacc4ca871f4' 'da92b3db5218c5be53aad53e57d1b6e63e7fc98a0e054fbdd6dbe18e9c6b1450')

package() {
	cd "${srcdir}"

	# Extract the pre-built Arch package (skip metadata files)
	tar -xf "${_pkgname}-${pkgver}-1-archlinux-x86_64.pkg.tar.zst" \
		--exclude='.BUILDINFO' \
		--exclude='.MTREE' \
		--exclude='.PKGINFO' \
		-C "${pkgdir}/"

	# Stage model to system path (post_install deploys to ~/.local/share/)
	local modeldir="${pkgdir}/usr/share/${_pkgname}/models/${_model_name}"
	install -dm755 "${modeldir}"
	install -Dm644 "${_model_name}/model.int8.onnx" "${modeldir}/model.int8.onnx"
	install -Dm644 "${_model_name}/tokens.txt" "${modeldir}/tokens.txt"
}
