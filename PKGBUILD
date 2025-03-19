# Maintainer: Leo <i@setuid0.dev>
pkgname=vgpu_unlock-rs
pkgver=2.5.0
pkgrel=1
pkgdesc="Unlock vGPU functionality for consumer grade GPUs"
arch=(x86_64)
url="https://github.com/mbilker/vgpu_unlock-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
backup=('etc/vgpu_unlock/config.toml')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mbilker/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	'ba66a6c.patch'
	'vgpu_unlock.conf'
	'config.toml'
)
sha256sums=(
	'dc1b37fa23ad5c69e5338e9f15e51275a81fbf12251edfdf91656fcd7572f1bb'
	'6da02cb73cce5dfa28a6bcecb776dc705e2b9453e5d12f978d9ea5870bf06552'
	'SKIP' 'SKIP'
)

prepare() {
	patch -p1 -i "${srcdir}/ba66a6c.patch" -d "${srcdir}/${pkgname}-${pkgver}"
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
