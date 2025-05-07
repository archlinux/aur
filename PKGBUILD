# Maintainer: Leo <i@hardrain980.com>
pkgname=vgpu_unlock-rs
pkgver=2.5.0
pkgrel=2
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
	'vgpu_unlock.conf'
	'config.toml'
)
sha256sums=(
	'dc1b37fa23ad5c69e5338e9f15e51275a81fbf12251edfdf91656fcd7572f1bb'
	'25f7f51fec20a453ca6ba765be58f6a8b529c80610ff53a7d4d2b23373db854a'
	'26911c7585e82e8338b4d469a3da50f0a63864b7b4a8ce0c781ef26c03a2c884'
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
