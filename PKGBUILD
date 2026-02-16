# Maintainer: Jared Van Bortel <cebtenzzre (AT) gmail (DOT) com>
pkgname=pia-tools
pkgver=1.2.1
pkgrel=4
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
        0006-systemd-stop-passing-credentials-on-the-command-line.patch
        pia-tools.sysusers
        pia-tools.tmpfiles)
b2sums=('51aeca6f81234bca75798334087b2be0a87fafc858137f7df28b92a55746144a745c4ca997cbdef5f91469e9be66158eff8e67db5f67254a564f64cce1f2acb2'
        'c53dce8104c990dbe39d8caf71b7cdf8737f6963ed20435b3f49ca384901dfa010d5ad771ca646ac13d2c2b23bc6407a2ee030280df4946ddcb8338eaa367e1f'
        'e552c1837895c74ebad0ce947b49eb1edceebf38dcb26e8c72b45574a9344f4886077325583929bfcfea73fa906a4358871c0e165271fb810e21c8bbfc30111c'
        '944a0fa2d9a519686f5af2ec5edbdce78107407047a3760dff5ea0f86ea806303f419a1fae6284c7ba3b543bdbac95f40cfa5dacd17c7137c2e5a7da41523a14'
        '240ba005b69b16b5d00437fe757f1731e9b2db6f72d53e7410209eeb78667805bd69ea689156e6b006acf145d2fb309358b8e5ddbf29318398a57aad6fded449'
        '7d929821894f778f66d1ddae29943f0108bc2ba546a7c5b6414a4ce03952665513eb7ce09011ca06f8a5787b7693cd8259e123733236ec7773ec877c075420ad'
        'e975fb5c76ec9e26e2dfad5ae31f6d4ed567378cd32a2cc300e19b614a1f3140243230016700902f08d20f31fb747e1cc2d62911b561a692dc067b930041144f'
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
