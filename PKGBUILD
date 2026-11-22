# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=gputaskman
pkgname=$_pkgname-bin
pkgver=0.4.5
pkgrel=1
pkgdesc='An htop for what is inside your GPU: per-process VRAM, engines and LLM buffer breakdown'
arch=('x86_64' 'aarch64')
url='https://github.com/shanselman/gputaskman'
license=('MIT')
depends=('zlib')
optdepends=('nvidia-utils: NVIDIA telemetry via NVML (AMD/Intel GPUs use DRM fdinfo, no extra deps)')
provides=("gputaskman=$pkgver")
conflicts=('gputaskman')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-$pkgver-linux-x64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('acf640b0d2782c63614744cd970eaa9112353261e7e1fd514abbc983d203762f')
sha256sums_aarch64=('28050ddf6041bfb26700b63fa67ae4c9b65a50dd80bd73b84f5c2fddf40bd16e')
options=('!debug')

package() {
	cd "$_pkgname-$pkgver-linux-"*

	# PyInstaller onedir tree: launcher resolves _internal beside itself
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -a gputaskman _internal "$pkgdir/usr/lib/$pkgname/"

	# upstream ships two console entry points: gputaskman and gtm; the
	# PyInstaller bootloader locates _internal via /proc/self/exe, so
	# symlinks into the lib tree work without a shell wrapper
	install -d "$pkgdir/usr/bin"
	ln -s /usr/lib/$pkgname/gputaskman "$pkgdir/usr/bin/gputaskman"
	ln -s /usr/lib/$pkgname/gputaskman "$pkgdir/usr/bin/gtm"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 LICENSE PYTHON-LICENSE.txt THIRD-PARTY-NOTICES.txt \
		"$pkgdir/usr/share/licenses/$pkgname/"
	cp -a licenses "$pkgdir/usr/share/licenses/$pkgname/licenses"
	install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
}
