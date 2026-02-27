# Maintainer: xifan <xifan2333@gmail.com>
# NOTE: This is an unofficial, community-maintained package.
# 注意：这是一个非官方维护的社区版本。

pkgname=hapi-git
pkgver=0.15.3
pkgrel=1
pkgdesc="App for agentic coding - access coding agent anywhere (Built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/tiann/hapi"
license=('AGPL-3.0')
depends=('bun')
provides=('hapi')
options=('!strip')

source=("git+https://github.com/tiann/hapi.git#tag=v${pkgver}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/hapi"
	git describe --tags | sed 's/^v//'
}

build() {
	cd "${srcdir}/hapi"
	bun install
	bun run build:single-exe
}

package() {
	cd "${srcdir}/hapi" || exit 1

	# Find the built executable - build outputs to bun-linux-x64 regardless of CARCH
	local bin_path="cli/dist-exe/bun-linux-x64/hapi"

	if [[ ! -f "${bin_path}" ]]; then
		echo "Error: Could not find built hapi binary at ${bin_path}"
		return 1
	fi

	install -Dm755 "${bin_path}" "${pkgdir}/usr/bin/hapi"

	# Install systemd user services
	install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/hapi-hub.service" <<EOF
[Unit]
Description=HAPI Hub
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/hapi hub
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF

	install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/hapi-runner.service" <<EOF
[Unit]
Description=HAPI Runner
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/hapi runner start --foreground
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF

	echo "==> To use the official relay service, edit hapi-hub.service:"
	echo "    systemctl --user edit hapi-hub.service"
	echo "    Change ExecStart to: /usr/bin/hapi hub --relay"
	echo ""
	echo "==> To enable and start the services:"
	echo "    systemctl --user enable --now hapi-hub.service"
	echo "    systemctl --user enable --now hapi-runner.service"
}
