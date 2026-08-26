# Maintainer: ArcticLampyrid <ArcticLampyrid@outlook.com>

pkgname=netmount
pkgver=1.2.4
pkgrel=1
pkgdesc="Unified management and mounting of cloud storage facilities"
arch=('x86_64' 'aarch64')
url="https://github.com/VirtualHotBar/NetMount"
license=('AGPL-3.0-or-later')
depends=('atk'
         'cairo'
         'glib2'
         'gtk3'
         'libsoup3'
         'openssl'
         'pango'
         'webkit2gtk-4.1'
         'zstd'
         'zlib-ng')
makedepends=('moreutils'
             'pnpm'
             'rust'
             'jq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	    "${pkgname}.desktop")
sha512sums=('c5ec59e9ef0e66ea805c7e7be9096b1ed9784345a0f7665df845bedfa8354d373333eee5a3f47738904155a5fca151e08ea122e34c115fbbbe49bc62d9d8e9c0'
            'ce79c66b022eff25096e07f48519b8de9aa6049c2d3c9caea1eb6929e66fe8221206b57a5981dc9ec103ca2ef732cceeb3eadfed6ff92102be8a303cb2695434')
options=(!lto)
prepare() {
	cd $srcdir/NetMount-${pkgver}
	cd src-tauri
	jq '.bundle.active = false' tauri.conf.json | sponge tauri.conf.json
}

build() {
	cd $srcdir/NetMount-${pkgver}
	pnpm approve-builds --all
	pnpm install --frozen-lockfile
	pnpm tauri-build
}

package() {
	cd $srcdir/NetMount-${pkgver}
	install -Dm755 src-tauri/target/release/${pkgname} -t ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/lib/NetMount/binaries
	cp -r src-tauri/binaries ${pkgdir}/usr/lib/NetMount
	install -Dm644 public/img/color.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
	install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications
}
