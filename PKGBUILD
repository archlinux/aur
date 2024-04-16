# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=neolink-git
_pkgname=neolink
pkgver=0.6.3.rc.1.r34.gd354b90
pkgrel=3
pkgdesc="An RTSP bridge to Reolink IP cameras."
arch=('x86_64')
url="https://github.com/QuantumEntangledAndy/${_pkgname}"
license=('AGPL3')
depends=('gst-rtsp-server' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('git' 'rust')
source=("git+https://github.com/QuantumEntangledAndy/$_pkgname.git"
				"$_pkgname.sysusers"
				"$_pkgname.service")
sha256sums=('SKIP'
            '27d0ecc90731e703228efd1c922421cab01c6495943b6f07a97a8c20518c8a17'
            'c44fab36cad34172c794eea36e9bdc403f987246d8450223361ae4ab2286f097')

backup=("etc/${_pkgname}.toml")

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	cargo build --release --workspace
}

package() {
	install -Dm755 "${_pkgname}/target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}/sample_config.toml" "$pkgdir/etc/${_pkgname}.toml"
	install -Dm 644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm 644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
