# Maintainer: taotieren <admin@taotieren.com>

pkgname=vnts-git
pkgver=2.0.3.r0.g7f6388c
pkgrel=1
pkgdesc="vnt server"
arch=($CARCH)
url="https://github.com/vnt-dev/vnts"
license=(Apache-2.0)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    libgcc
)
makedepends=(
    git
    protobuf
    rust
    npm
    pnpm
    nodejs
)
optdepends=('vnt: A virtual network tool (or VPN),简便高效的异地组网、内网穿透工具')
backup=(
    'etc/vnts/config.toml'
)
options=('!lto' '!debug')
install=vnts.install
source=(
    "${pkgname}::git+${url}.git"
    "vnts.install"
)
sha256sums=('SKIP'
            '5d3129ee455c0180ebd1ff15bd6765080db0206f01cc2a6559fc06c2704ff318')

pkgver() {
    cd "${srcdir}/${pkgname}/"

    git describe --exclude=nightly --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx

    cd "${srcdir}/${pkgbase}/"

    #     cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/frontend"
    pnpm install
    pnpm build

    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    # cargo test  --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +

    install -Dvm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/vnts.service" <<EOF
[Unit]
Description=VNT2 virtual network service (vnts2)
Documentation=https://github.com/vnt-dev/vnts
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=vnts
Group=vnts
WorkingDirectory=/var/lib/vnts
ExecStart=/usr/bin/vnts2 --conf /etc/vnts/config.toml
Restart=on-failure
RestartSec=5s
# 服务端仅转发数据，无需 TUN 虚拟网卡能力
NoNewPrivileges=true
# 运行数据与日志目录
ReadWritePaths=/var/lib/vnts
ProtectSystem=strict
ProtectHome=true
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF

    # 系统用户 vnts，用于以最小权限运行服务端
    install -Dvm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/vnts.conf" <<EOF
#Type  Name  ID  GECOS                    Home directory  Shell
u       vnts  -   "VNT virtual network server"  /var/lib/vnts  /usr/bin/nologin
EOF

    # 运行数据与日志目录
    install -Dvm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/vnts.conf" <<EOF
#Type  Path              Mode  User  Group  Age  Argument
d      /var/lib/vnts     0750  vnts  vnts   -    -
d      /var/lib/vnts/logs  0750  vnts  vnts   -    -
EOF

    # vnts2 配置文件模板（自动生成自 vnts2 --conf-example，备份，升级时保留用户修改）
    {
        cat <<'EOF'
# ============================================
# VNTS2 服务端配置文件 (vnts2)
# 修改后执行: sudo systemctl restart vnts
#
# ⚠️ 安全提示:
#   默认启用网页管理 web_bind="0.0.0.0:29871"，账号 admin/admin
#   若监听公网请务必修改 username / password，避免管理端被公开访问
# ============================================
EOF
        ./target/release/vnts2 --conf-example
    } > config.toml
    install -Dvm644 config.toml -t "${pkgdir}/etc/vnts/"

    install -Dvm644 /dev/stdin "${pkgdir}/etc/sysctl.d/80-vnts.conf" <<EOF
net.ipv4.ip_forward = 1
net.ipv6.conf.default.forwarding = 1
net.ipv6.conf.all.forwarding = 1
EOF
}
