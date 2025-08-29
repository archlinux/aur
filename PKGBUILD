# Maintainer: taotieren <admin@taotieren.com>

pkgbase=serverstatus-git
pkgname=(serverstatus-git
    serverstatus-clients-linux-git
    serverstatus-clients-psutil-git
    serverstatus-server-git)
pkgver=1.1.6.r3.g68a1d37
pkgrel=1
groups=()
pkgdesc="云探针、多服务器探针、云监控、多服务器云监控"
arch=(any)
url="https://github.com/cppla/ServerStatus"
license=('MIT')
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
depends=(
    curl
    gcc-libs
    glibc
    python
    python-requests
    python-psutil
    python-prettytable
    python-queuelib
    openssl
    systemd
    python)
makedepends=(git)
optdepends=(python-psutil)
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgbase}"
    make -C server PREFIX=/usr
}

package_serverstatus-git() {
    depends=(
        serverstatus-clients-linux-git
        serverstatus-clients-psutil-git
        serverstatus-server-git)
}

package_serverstatus-clients-linux-git() {
    pkgdesc+="-- Linux 客户端"
    depends=(
        python
        python-queuelib
        systemd)
    arch=(any)
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    install -Dm0755 "${srcdir}/${pkgbase}/clients/client-linux.py" -t ${pkgdir}/usr/share/${pkgbase%-git}/clients
    install -Dm0644 /dev/stdin ${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service <<EOF
[Unit]
Description=ServerStatus-Client
After=network.target

[Service]
ExecStart=/usr/bin/python /usr/share/serverstatus/clients/client-linux.py
ExecReload=/bin/kill -HUP \$MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
}
package_serverstatus-clients-psutil-git() {
    pkgdesc+="-- Linux psutil 客户端"
    depends=(
        python
        python-psutil
        python-queuelib
        systemd)
    arch=(any)
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    install -Dm0755 "${srcdir}/${pkgbase}/clients/client-psutil.py" -t ${pkgdir}/usr/share/${pkgbase%-git}/clients
    install -Dm0644 /dev/stdin ${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service <<EOF
[Unit]
Description=ServerStatus-Client psutil
After=network.target

[Service]
ExecStart=/usr/bin/python /usr/share/serverstatus/clients/client-psutil.py
ExecReload=/bin/kill -HUP \$MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
}

package_serverstatus-server-git() {
    pkgdesc+="-- 服务端"
    depends=(
        curl
        gcc-libs
        glibc
        python
        python-prettytable
        python-requests
        openssl
        systemd)
    arch=($CARCH)
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgbase}"

    install -Dm0755 "${srcdir}/${pkgbase}/server/sergate" -t ${pkgdir}/usr/bin
    install -Dm0755 "${srcdir}/${pkgbase}/server/config.json" -t ${pkgdir}/usr/share/${pkgbase%-git}/server
    cp -rva "${srcdir}/${pkgbase}"/web ${pkgdir}/usr/share/${pkgbase%-git}
    cp -rva "${srcdir}/${pkgbase}"/plugin ${pkgdir}/usr/share/${pkgbase%-git}
    install -Dm0644 /dev/stdin ${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service <<EOF
[Unit]
Description=ServerStatus-Server
After=network.target

[Service]
ExecStart=sergate --config=/usr/share/serverstatus/server/config.json --web-dir=/usr/share/serverstatus/web
ExecReload=/bin/kill -HUP \$MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
}
