# Maintainer: Senge Dev <sengedev at gmail dot com>
# Contributor: Senge Dev <sengedev at gmail dot com>

pkgname=1panel-git
pkgver=2024.3.9.archlinux
pkgrel=1
pkgdesc="1Panel, a modern open source linux panel."
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
license=('GPL-3.0-or-later')
install=1panel.install
makedepends=(
    'pwgen'             # Generate username, password and 1Panel entrance before compile.
    'go'                # Compile the backend of 1Panel.
    'nodejs'            # Compile the frontend of 1Panel.
    'git'               # Clone the 1Panel repository.
    'lsof'              # Make sure the port will not be occupied.
)
optdepends=(
    'ufw'               # Firewall manager
    'firewalld'         # Firewall manager
    'docker'            # Docker image manager
    'docker-compose'    # Docker compose plugin, make sure 1Panel app store works.
)
conflicts=('1panel-dev-bin' '1panel-bin')
source=("${pkgname}"::"git+https://github.com/1Panel-dev/1Panel.git")
sha256sums=("SKIP")

build() {
    _1panel_port=`expr $RANDOM % 55535 + 10000`
    while lsof -i:$_1panel_port > /dev/null 2>&1; do
        _1panel_port=`expr $RANDOM % 55535 + 10000`
    done
    # Create 1pctl file, or 1Panel systemd service cannot start.
    cat > ${srcdir}/1pctl << EOF
#!/bin/bash
BASE_DIR=/opt
ORIGINAL_PORT=${_1panel_port}
ORIGINAL_VERSION=${pkgver}
ORIGINAL_ENTRANCE=$(pwgen -nABCv 10 1)
ORIGINAL_USERNAME=$(pwgen -nABCv 10 1)
ORIGINAL_PASSWORD=$(pwgen -nBCv 20 1)
1panel \$@
EOF
    # Create systemd service
    cat> ${srcdir}/1panel.service << EOF
[Unit]
Description=1Panel, a modern open source linux panel
After=syslog.target network.target

[Service]
ExecStart=/usr/bin/1panel
ExecReload=/bin/kill -s HUP \$MAINPID
Restart=always
RestartSec=5
LimitNOFILE=1048576
LimitNPROC=1048576
LimitCORE=1048576
Delegate=yes
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
    # Edit the source code using sed
    sed -i 's/当前已经是最新版本/当前版本为AUR版本，如需更新，请使用AUR更新/g' ${srcdir}/${pkgname}/frontend/src/lang/modules/zh.ts
    sed -i 's/當前已經是最新版本/當前版本為AUR版本，如需更新，請使用AUR更新/g' ${srcdir}/${pkgname}/frontend/src/lang/modules/tw.ts
    sed -i 's/It is currently the latest version/It is ArchLinux AUR version, if you want to update it, please use AUR./g' ${srcdir}/${pkgname}/frontend/src/lang/modules/en.ts
    # Compile 1Panel using Makefile
    cd ${srcdir}/${pkgname}
    make build_all
}

package() {
    install -vd ${pkgdir}/opt/1panel
    install -vDm755 ${srcdir}/${pkgname}/build/1panel ${pkgdir}/usr/bin/1panel
    install -vDm644 ${srcdir}/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 ${srcdir}/1pctl ${pkgdir}/usr/bin/1pctl
}
