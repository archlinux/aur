# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com> https://keybase.io/swordfeng

pkgbase=shadowsocks-go-git
pkgname=('shadowsocks-go-server' 'shadowsocks-go-local')
groups=('shadowsocks-go')
pkgver=1.2.1.r2.g5c6f652
pkgrel=1
pkgdesc="Shadowsocks go version"
arch=('x86_64' 'i686')
url="https://github.com/shadowsocks/shadowsocks-go/"
license=('Apache')
makedepends=('go')
#options=('!strip')
_gourl=github.com/shadowsocks/shadowsocks-go

prepare() {
    GOPATH="$srcdir" go get -d -fix -v -x -u ${_gourl}/cmd/shadowsocks-server
    GOPATH="$srcdir" go get -d -fix -v -x -u ${_gourl}/cmd/shadowsocks-local
}

pkgver() {
    cd "$srcdir/src/${_gourl}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    GOPATH="$srcdir" go install ${_gourl}/cmd/shadowsocks-server
    GOPATH="$srcdir" go install ${_gourl}/cmd/shadowsocks-local
}

check() {
    GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
}

package_shadowsocks-go-server() {
    mkdir -p "$pkgdir/usr/bin"
    install -p -m755 "$srcdir/bin/shadowsocks-server" "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cat > "$pkgdir/usr/lib/systemd/system/shadowsocks-go-server@.service" <<EOF
[Unit]
Description=Shadowsocks Server Service (Go Version)
After=network.target

[Service]
Type=simple
#User=nobody
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
ExecStart=/usr/bin/shadowsocks-server -c /etc/shadowsocks/%i.json

[Install]
WantedBy=multi-user.target
EOF
}

package_shadowsocks-go-local() {
    mkdir -p "$pkgdir/usr/bin"
    install -p -m755 "$srcdir/bin/shadowsocks-local" "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cat > "$pkgdir/usr/lib/systemd/system/shadowsocks-go@.service" <<EOF
[Unit]
Description=Shadowsocks Client Service (Go Version)
After=network.target

[Service]
Type=simple
#User=nobody
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
ExecStart=/usr/bin/shadowsocks-local -c /etc/shadowsocks/%i.json

[Install]
WantedBy=multi-user.target
EOF
}

