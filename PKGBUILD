# Maintainer: Levitating <me@levitati.ng>
pkgname=incus-ui
pkgver=0.14
pkgrel=1
epoch=
pkgdesc="LXD-UI patched for Incus"
arch=(any)
url="https://github.com/canonical/lxd-ui"
license=('GPL')
makedepends=('yarn' 'git' 'npm')
source=("git+https://github.com/zabbly/incus.git"
		"lxd-ui-$pkgver.tar.gz::https://github.com/canonical/lxd-ui/archive/refs/tags/${pkgver}.tar.gz"
		"incus-ui.conf"
)
sha256sums=('SKIP'
            'e54e681d1ae40b90a57df00b126deaf085b1697154db442d9eaa1980a26e091e'
            'f6f1a4669e7ac2c733544c6ee96ae739f77981184603d36fc8ae906481177bee')

prepare() {
	cd "$srcdir/lxd-ui-$pkgver"
	git init # helps git apply
	for patchfile in $srcdir/incus/patches/ui-canonical-*.patch
	do
		echo Applying $patchfile
		git apply -v $patchfile
	done
	sed -i -f "$srcdir/incus/patches/ui-canonical-renames.sed" src/*/*.ts* src/*/*/*.ts* src/*/*/*/*.ts* src/*/*/*/*/*.ts*

	yarn install
}

build() {
	cd "$srcdir/lxd-ui-$pkgver"
	yarn build
}

package() {
	mkdir -p "$pkgdir/usr/share/incus-ui"
	cp -r "$srcdir/lxd-ui-$pkgver/build/ui/"* "$pkgdir/usr/share/incus-ui"
	install -Dvm 644 "$srcdir/incus-ui.conf" "$pkgdir/usr/lib/systemd/system/incus.service.d/incus-ui.conf"
}
