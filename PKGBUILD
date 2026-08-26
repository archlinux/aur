# Maintainer: taotieren <admin@taotieren.com>

pkgname=vnt-git
pkgver=2.0.3.r0.g058a5e1
pkgrel=1
pkgdesc="A virtual network tool (or VPN),简便高效的异地组网、内网穿透工具"
arch=($CARCH)
url="https://github.com/vnt-dev/vnt"
license=(Apache-2.0)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    libgcc
    glibc
)
makedepends=(
    git
    npm
    pnpm
    rust
    cargo-tauri
    nodejs
)
optdepends=(
    'iptables: Linux kernel packet control tool (using legacy interface)'
    'vnts: vnt server'
)
backup=(
    'etc/vnt/config.toml'
    'etc/vnt/vnt-web.env'
)
options=('!lto' '!debug')
install=vnt.install
source=(
    "${pkgname}::git+${url}.git"
    "vnt.install"
)
sha256sums=('SKIP'
            'f775788c22362103758b1c9c5c5e0d8b2bb9f2c17bd0bc2cd4cdac4f393abeb2')

pkgver() {
    cd "${srcdir}/${pkgname}/"

    git describe --exclude=nightly --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx

    cd "${srcdir}/${pkgbase}/"

    # git submodule update --init --recursive
    #     cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    pnpm install
    pnpm build:web
    cargo build --release --bin vnt2_web --features vnt-web
    cargo build --release --bin vnt2_cli --features vnt-ipc
    cargo build --release --bin vnt2_ctrl --features vnt-ipc
}

check() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    # cargo test -p vnt-cli --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +

    # systemd 服务: vnt2_cli 组网客户端（核心守护进程）
    install -Dvm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/vnt2-cli.service" <<EOF
[Unit]
Description=VNT2 virtual network client (vnt2_cli)
Documentation=https://github.com/vnt-dev/vnt
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=vnt
Group=vnt
WorkingDirectory=/var/lib/vnt
ExecStart=/usr/bin/vnt2_cli --conf /etc/vnt/config.toml
Restart=on-failure
RestartSec=5s
# 创建 TUN/TAP 虚拟网卡需要网络管理能力
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_RAW
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_RAW
DeviceAllow=/dev/net/tun rw
NoNewPrivileges=true
# 运行状态与日志目录
ReadWritePaths=/var/lib/vnt
ProtectSystem=strict
ProtectHome=true
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF

    # systemd 服务: vnt2_web 网页管理服务
    install -Dvm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/vnt2-web.service" <<EOF
[Unit]
Description=VNT2 web management service (vnt2_web)
Documentation=https://github.com/vnt-dev/vnt
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=vnt
Group=vnt
WorkingDirectory=/var/lib/vnt
EnvironmentFile=-/etc/vnt/vnt-web.env
ExecStart=/usr/bin/vnt2_web --addr 127.0.0.1:19099
Restart=on-failure
RestartSec=5s
# 网页端组网同样会创建 TUN/TAP 虚拟网卡
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_RAW
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_RAW
DeviceAllow=/dev/net/tun rw
NoNewPrivileges=true
# 网页管理的配置与日志
ReadWritePaths=/var/lib/vnt
ProtectSystem=strict
ProtectHome=true
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF

    # 系统用户 vnt，用于以最小权限运行 vnt2 服务
    install -Dvm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/vnt.conf" <<EOF
#Type  Name  ID  GECOS                    Home directory  Shell
u       vnt   -   "VNT virtual network"    /var/lib/vnt    /usr/bin/nologin
EOF

    # 运行状态与日志目录
    install -Dvm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/vnt.conf" <<EOF
#Type  Path                    Mode  User  Group  Age  Argument
d      /var/lib/vnt            0750  vnt   vnt    -    -
d      /var/lib/vnt/logs       0750  vnt   vnt    -    -
d      /var/lib/vnt/vnt_config 0750  vnt   vnt    -    -
EOF

    # vnt2_cli 配置文件模板（备份，升级时保留用户修改）
    ./target/release/vnt2_cli --conf-example > config.toml  
    install -Dvm644 config.toml -t "${pkgdir}/etc/vnt/"

    # vnt2_web 访问令牌环境变量模板（备份）
    install -Dvm644 /dev/stdin "${pkgdir}/etc/vnt/vnt-web.env" <<'EOF'
# vnt2_web 网页服务访问令牌
# 取消注释并设置为固定令牌后，重启 vnt2-web 服务即可固定访问地址
# 生成方法: openssl rand -hex 32
#VNT_WEB_TOKEN=
EOF

    install -Dvm644 /dev/stdin "${pkgdir}/etc/sysctl.d/80-vnt.conf" <<EOF
net.ipv4.ip_forward = 1
net.ipv6.conf.default.forwarding = 1
net.ipv6.conf.all.forwarding = 1
EOF

    install -Dvm644 /dev/stdin "${pkgdir}/etc/vnt/iptables-vnt.rules" <<EOF
*nat
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING ! -o vnt-tun -s 10.26.0.0/24 -j MASQUERADE
COMMIT
EOF
}
