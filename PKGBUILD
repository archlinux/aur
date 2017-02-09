# Maintainer: Reinforce-II <reinforceii@linux.com>
pkgname=shadowsocks-rss-auto
pkgver=0.01
pkgrel=1
pkgdesc="Deploy Shadowsocks RSS Server with random configuration"
arch=(any)
license=('unknown')
depends=(
    'python'
    'libsodium'
)
makedepends=(
    'git'
)

build() {
    git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git
    cat << EOF > shadowsocksr.service
[Unit]
Description=ShadowsocksR server
After=network.target
Wants=network.target

[Service]
Type=forking
PIDFile=/var/run/shadowsocksr.pid
ExecStart=/usr/bin/python /opt/shadowsocksr/shadowsocks/server.py --pid-file /var/run/shadowsocksr.pid -p 8080 -k $(cat /dev/urandom | head -n 10 | md5sum | head -c 10) -m chacha20 -O auth_sha1_v4 -o http_simple -d start
ExecStop=/usr/bin/python /opt/shadowsocksr/shadowsocks/server.py --pid-file /var/run/shadowsocksr.pid -d stop
ExecReload=/bin/kill -HUP \$MAINPID
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target
EOF
}

package() {
    mkdir -p ${pkgdir}/opt/
    mkdir -p ${pkgdir}/usr/lib/systemd/system/
    cp -r shadowsocksr "${pkgdir}/opt/"
    cp shadowsocksr.service "${pkgdir}/usr/lib/systemd/system/"
    chmod -R 755 "${pkgdir}/opt/shadowsocksr"
    chmod -R 755 "${pkgdir}/usr/lib/systemd/system/shadowsocksr.service"
}

