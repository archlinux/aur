# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=amdgpud-bin
pkgname=('amdgpud-glow-bin' 'amdgpud-wayland-bin')
pkgver=1.0.9
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache' 'MIT')
depends=('gcc-libs')
provides=('amdgpud')
conflicts=('amdgpud')
backup=("etc/amdgpud/config.toml")
source=("$pkgbase-$pkgver.zip::$url/releases/download/v$pkgver/archlinux.zip"
				"amdgpud-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('87b0d1235a19561a48e0448852abb4351bd6f9ccf2fcba2b47123827018afc2c'
            '3242e1d9090735fc0afe26c9753664b47ff9cd4ca9ddc440af39f78058b3180e')

prepare() {
	mkdir -p glow wayland
	bsdtar -xf amdguid-glow.zip -C glow
	bsdtar -xf amdguid-wayland.zip -C wayland
}

_package() {
	install -D amdfand amdmond amdvold amdgui-helper -t "$pkgdir/usr/bin/"
	cd "amdgpud-$pkgver"
	install -Dm644 services/*.service -t "$pkgdir/usr/lib/systemd/systemd/"
	install -Dm644 examples/default_config.toml "$pkgdir/etc/amdgpud/config.toml"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 LICENSE.APACHE2.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_amdgpud-glow-bin() {
	pkgdesc+=' -- Xorg version'
	provides+=('amdguid-glow')
	conflicts+=('amdguid-wayland')

	install -D glow/amdguid -t "$pkgdir/usr/bin/"
	_package
}

package_amdgpud-wayland-bin() {
	pkgdesc+=' -- Wayland version'
	provides+=('amdguid-wayland')
	conflicts+=('amdguid-glow')

	install -D wayland/amdguid -t "$pkgdir/usr/bin/"
	_package
}
