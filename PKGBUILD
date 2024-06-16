# Maintainer: Kimiblock Moe

pkgname=conduwuit
pkgdesc="a very cool, featureful fork of conduit"
url="https://github.com/girlbossceo/conduwuit"
license=("Apache-2.0")
arch=("x86_64")
pkgver=0.4.2
pkgrel=2
makedepends=("rust" "cargo" "git" "clang")
depends=("gcc-libs" "glibc" "liburing")
source=("git+https://github.com/girlbossceo/conduwuit#tag=v${pkgver}")
md5sums=("SKIP")
provides=("conduwuit")
conflicts=()
options=(!lto)
backup=("etc/conduwuit/conduwuit.toml")
install=conduwuit.install

function prepare() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	export CONDUWUIT_VERSION_EXTRA=$(git rev-parse --short HEAD)
}

function build() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --locked
}

function check() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen --locked --all-features
}

function package() {
	install -Dm755 "${srcdir}/conduwuit/target/release/conduit" "${pkgdir}/usr/bin/conduwuit"
	install -Dm644 "${srcdir}/conduwuit/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/conduwuit/conduwuit-example.toml" "${pkgdir}/etc/conduwuit/conduwuit.toml"
	install -d "${pkgdir}/usr/lib/systemd/system/"
	echo '''[Unit]
Description=conduwuit Matrix homeserver
After=network.target
RequiresMountsFor=/var/lib/private/conduwuit

[Service]
DynamicUser=yes
Type=notify

AmbientCapabilities=
CapabilityBoundingSet=

DevicePolicy=closed
LockPersonality=yes
MemoryDenyWriteExecute=yes
NoNewPrivileges=yes
ProcSubset=pid
ProtectClock=yes
ProtectControlGroups=yes
ProtectHome=yes
ProtectHostname=yes
ProtectKernelLogs=yes
ProtectKernelModules=yes
ProtectKernelTunables=yes
ProtectProc=invisible
ProtectSystem=strict
PrivateDevices=yes
PrivateMounts=yes
PrivateTmp=yes
PrivateUsers=yes
PrivateIPC=yes
RemoveIPC=yes
RestrictAddressFamilies=AF_INET AF_INET6 AF_UNIX
RestrictNamespaces=yes
RestrictRealtime=yes
RestrictSUIDSGID=yes
SystemCallArchitectures=native
SystemCallFilter=@system-service @resources
SystemCallFilter=~@clock @debug @module @mount @reboot @swap @cpu-emulation @obsolete @timer @chown @setuid @privileged @keyring @ipc
SystemCallErrorNumber=EPERM
StateDirectory=conduwuit

RuntimeDirectory=conduwuit
RuntimeDirectoryMode=0750

Environment="CONDUWUIT_CONFIG=/etc/conduwuit/conduwuit.toml"

ExecStart=/usr/bin/conduwuit
Restart=on-failure
RestartSec=5

TimeoutStopSec=4m
TimeoutStartSec=4m

StartLimitInterval=1m
StartLimitBurst=5

[Install]
WantedBy=multi-user.target''' >"${pkgdir}/usr/lib/systemd/system/conduwuit.service"
}

