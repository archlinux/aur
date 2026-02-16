# Maintainer: Jared Van Bortel <cebtenzzre (AT) gmail (DOT) com>
pkgname=pia-tools
pkgver=1.2.1
pkgrel=2
pkgdesc='PIA WireGuard/systemd-networkd integration suite'
arch=('x86_64')
url='https://github.com/jdelkins/pia-tools'
license=('MIT')
depends=('glibc' 'systemd' 'wireguard-tools')
makedepends=('git' 'go')
optdepends=('rtorrent: port forwarding notification to rtorrent'
            'transmission-cli: port forwarding notification to Transmission')
backup=('etc/pia.conf'
        'etc/pia-tools/pia.netdev.tmpl'
        'etc/pia-tools/pia.network.tmpl')
install=$pkgname.install
options=('!lto')
_tag=36abae01d8782c5f029b7be59fc965ce10403856 # git rev-parse v$pkgver
source=("git+$url.git?signed#tag=$_tag"
        0001-systemd-use-usr-bin-instead-of-usr-local-bin.patch
        0002-systemd-load-network-templates-from-etc-pia-tools.patch
        0003-network-template-drop-invalid-IPv4-zone-ID-from-DNS-.patch
        0004-systemd-harden-pia-pf-refresh-service.patch
        0005-systemd-drop-sudo-and-harden-pia-reset-tunnel-servic.patch
        pia-tools.sysusers
        pia-tools.tmpfiles)
b2sums=('51aeca6f81234bca75798334087b2be0a87fafc858137f7df28b92a55746144a745c4ca997cbdef5f91469e9be66158eff8e67db5f67254a564f64cce1f2acb2'
        '0ecc0364c7010150bdc23dc99f0a51935222a83c19f14b3b14e2ce4bed560cdc2220f59815163d571a976f523775ba1a57906ce71355c225bcae1c344752de14'
        'f516db5afe0eeed31874f3c7f4ef8a14d8cc71b7486af30404dd900cad61793d85c31c6460b25ebf85a74133839276e98e2a8aa86168e8d2030cc64b12ed53d8'
        'c1dbc9dfc49db1ef90b905b7c6a62d494aaa7cea5193045ead3de5ac124d6241ece789776003d73c5598784911ce61608d741db16c661189a7d05892c1f74b42'
        '437b91533b81f4319de61b98808e4c22d6c7cf1134acf2ec08d5d5f3d3eb421e9463d6bc93bae59fdd78ea6c1f4f9510dd6f26869ff05dc7263ef1bdc46e1d15'
        'c5fa49d8ae6521bc3ffff3c20ec961663a3440b2b6a75dedfcf0876509431dcbf7de826a60578849f0b259fb7aca73a8bbe364752a7285822508a35d117733e1'
        'd0b58b0199dbfd8ca8e373ca6cf06ec63d4f941fb9dd306adcdc4a0bc86013325416fc33caa5a7459c6ef03e763a354444e4491483a9c49d3b6d575c5f713739'
        '267bca292c120542570d5daefbe59998b587b5fb40c3d0091f3f3730604d5feab8a0abd2dc13afbc2efc2fc2100fd05f16b2e00ee9457cd5a269943dd7d7264f')
# Import with: curl -sL https://github.com/jdelkins.gpg | gpg --import
validpgpkeys=('0EDDEB73698C79E9E22BF7161F7DD64DB353F680') # Joel D. Elkins <joel@elkins.co>

prepare() {
	cd "$pkgname"
	local src
	for src in "${source[@]}"; do
		src=${src%%::*}
		src=${src##*/}
		[[ $src = *.patch ]] || continue
		patch -Np1 < "../$src"
	done
	mkdir -p build
	go mod download
}

build() {
	cd "$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

package() {
	cd "$pkgname"

	# Binaries
	install -Dm755 -t "$pkgdir/usr/bin/" build/*

	# License
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Systemd units
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" systemd/system/*.service
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" systemd/system/*.timer

	# Configuration file
	install -Dm600 systemd/pia.conf "$pkgdir/etc/pia.conf"

	# Network templates (loaded at runtime by pia-setup-tunnel)
	install -Dm644 -t "$pkgdir/etc/$pkgname/" systemd/network/*.tmpl

	# System user and cache directory
	install -Dm644 "$srcdir/pia-tools.sysusers" "$pkgdir/usr/lib/sysusers.d/pia-tools.conf"
	install -Dm644 "$srcdir/pia-tools.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/pia-tools.conf"
}
