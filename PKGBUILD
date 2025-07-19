# Maintainer: Leo <i@hardrain980.com>
pkgname=vgpu_unlock-rs
pkgver=2.5.0
pkgrel=3
pkgdesc="Unlock vGPU functionality for consumer grade GPUs"
arch=(x86_64)
url="https://github.com/mbilker/vgpu_unlock-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
backup=('etc/vgpu_unlock/config.toml')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mbilker/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	'0001-lib-do-not-take-mdev-UUID-as-17.x-may-get-the-vGPU-i.patch'
	'0002-lib-added-params_size-of-5232-bytes-for-v18-driver-c.patch'
	'0003-nvidia-ctrla081-replace-R550-link-reference.patch'
	'0004-nvidia-ctrla081-sync-vGPU-18.x-R570-fields.patch'
	'0005-nvidia-ctrl0000vgpu-sync-vGPU-18.x-R570-fields.patch'
	'0006-nvidia-ctrl0080gpu-sync-vGPU-18.x-R570-fields.patch'
	'0007-lib-added-params_size-for-v18-driver-compatibility.patch'
	'vgpu_unlock.conf'
	'config.toml'
)
sha256sums=(
	'dc1b37fa23ad5c69e5338e9f15e51275a81fbf12251edfdf91656fcd7572f1bb'
	'1a3d0fa15137da9fadd359fb3114cd4c2de9302f897475dcb561b08fa527b160'
	'dd87df7ec6848919955324957112f11a9079afa42130a2eae4c09ad8798a5888'
	'5430c0809181d228c5ebb3fff1fc2c2ab9b6f48d827f327813674563b26bf0dc'
	'cc1bb3a2d71fe294a665493377d1204bd1f197f5c9a2b4f60b12f293cf87456d'
	'53e1eed7b0243145304fb02d62d4cb0c06b721e38f8b1ae3053a435f30a8dc42'
	'344c10cc499904f57d215f604c41b571e912604433ec3dcf2601fd9317452af2'
	'3527ff168f696614911674c6d047f2a523454b6479c7573478a0dc351385c713'
	'SKIP' 'SKIP'
)

prepare() {
	for i in "${srcdir}/"*.patch; do
		patch -p1 -i "${i}" -d "${srcdir}/${pkgname}-${pkgver}";
	done
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	install -Dm0755 target/release/libvgpu_unlock_rs.so "${pkgdir}/usr/lib/vgpu_unlock_rs/libvgpu_unlock_rs.so"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm0644 "${srcdir}/config.toml" "${pkgdir}/etc/vgpu_unlock/config.toml"
	install -Dm0644 "${srcdir}/vgpu_unlock.conf" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpud.service.d/vgpu_unlock.conf"
	install -Dm0644 "${srcdir}/vgpu_unlock.conf" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpu-mgr.service.d/vgpu_unlock.conf"
}
