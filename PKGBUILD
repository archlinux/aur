# Maintainer: BobbyUnknown <https://github.com/bobbyunknown>
pkgname=fusiontunx
pkgver=1.0.3
pkgrel=4
pkgdesc="FusionTunX - Controller and manager for Mihomo (Clash Meta) core"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/bobbyunknown/FusionTunX"
license=('MIT')
depends=('iptables' 'iproute2' 'ca-certificates')
makedepends=('go' 'npm' 'git' 'wget' 'unzip')
optdepends=('nftables: Modern firewall backend')
backup=('etc/fusiontunx/app.yaml'
        'etc/fusiontunx/configs/config.yaml'
        'etc/fusiontunx/proxy_providers/proxy.yaml'
        'etc/fusiontunx/rule_providers/rule.yaml')

_branch="dev"
_mihomo_version="v1.19.17"

source=("${pkgname}-${pkgver}::git+https://github.com/bobbyunknown/FusionTunX.git#branch=${_branch}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cd src
    export GOPATH="${srcdir}/gopath"
    go mod download
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    cd src/dash
    npm install
    npm run build
    cd ../..
    
    rm -rf src/internal/ui/dist
    cp -r src/dash/dist src/internal/ui/dist
    chmod -R 755 src/internal/ui/dist
    
    cd src
    export GOPATH="${srcdir}/gopath"
    export PATH="${GOPATH}/bin:${PATH}"
    go install github.com/swaggo/swag/cmd/swag@latest
    swag init -g cmd/server/main.go -o docs
    go mod tidy
    
    export CGO_ENABLED=0
    export GIN_MODE=release
    
    case "${CARCH}" in
        x86_64)
            _goarch="amd64"
            ;;
        aarch64)
            _goarch="arm64"
            ;;
        armv7h)
            _goarch="arm"
            export GOARM=7
            ;;
    esac
    
    GOOS=linux GOARCH=${_goarch} go build -ldflags="-s -w" -o ../fusiontunx ./cmd/server
    cd ..
    
    case "${CARCH}" in
        x86_64)
            _mihomo_arch="amd64"
            ;;
        aarch64)
            _mihomo_arch="arm64"
            ;;
        armv7h)
            _mihomo_arch="armv7"
            ;;
    esac
    
    wget -q -O mihomo.gz "https://github.com/MetaCubeX/mihomo/releases/download/${_mihomo_version}/mihomo-linux-${_mihomo_arch}-${_mihomo_version}.gz"
    gunzip -f mihomo.gz
    chmod +x mihomo
    
    wget -q -O country.mmdb https://github.com/rtaserver/meta-rules-dat/releases/latest/download/country.mmdb
    wget -q -O geoip.dat https://github.com/rtaserver/meta-rules-dat/releases/latest/download/geoip.dat
    wget -q -O geosite.dat https://github.com/rtaserver/meta-rules-dat/releases/latest/download/geosite.dat
    wget -q -O geoip.metadb https://github.com/rtaserver/meta-rules-dat/releases/download/latest/geoip.metadb
    
    mkdir -p ui/zashboard
    wget -q -O zashboard.zip "https://github.com/Zephyruso/zashboard/releases/latest/download/dist.zip"
    unzip -q zashboard.zip -d temp_zashboard
    mv temp_zashboard/dist/* ui/zashboard/
    rm -rf temp_zashboard zashboard.zip
    
    mkdir -p ui/metacubexd
    wget -q -O metacubexd.tgz "https://github.com/MetaCubeX/metacubexd/releases/latest/download/compressed-dist.tgz"
    tar -xzf metacubexd.tgz -C ui/metacubexd
    rm metacubexd.tgz
    
    mkdir -p ui/yacd
    wget -q -O yacd.zip "https://github.com/MetaCubeX/Yacd-meta/archive/refs/heads/gh-pages.zip"
    unzip -q yacd.zip -d temp_yacd
    mv temp_yacd/Yacd-meta-gh-pages/* ui/yacd/
    rm -rf temp_yacd yacd.zip
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    install -Dm755 fusiontunx "${pkgdir}/usr/share/fusiontunx/fusiontunx"
    install -Dm755 mihomo "${pkgdir}/usr/bin/mihomo"
    
    install -Dm644 files/app.yaml "${pkgdir}/etc/fusiontunx/app.yaml"
    install -Dm644 country.mmdb "${pkgdir}/etc/fusiontunx/country.mmdb"
    install -Dm644 geoip.dat "${pkgdir}/etc/fusiontunx/geoip.dat"
    install -Dm644 geosite.dat "${pkgdir}/etc/fusiontunx/geosite.dat"
    install -Dm644 geoip.metadb "${pkgdir}/etc/fusiontunx/geoip.metadb"
    
    install -dm755 "${pkgdir}/etc/fusiontunx/configs"
    install -dm755 "${pkgdir}/etc/fusiontunx/proxy_providers"
    install -dm755 "${pkgdir}/etc/fusiontunx/rule_providers"
    
    if [ -d "files/configs" ]; then
        cp -r files/configs/* "${pkgdir}/etc/fusiontunx/configs/"
    fi
    if [ -d "files/proxy_providers" ]; then
        cp -r files/proxy_providers/* "${pkgdir}/etc/fusiontunx/proxy_providers/"
    fi
    if [ -d "files/rule_providers" ]; then
        cp -r files/rule_providers/* "${pkgdir}/etc/fusiontunx/rule_providers/"
    fi
    
    install -dm755 "${pkgdir}/etc/fusiontunx/ui"
    cp -r ui/* "${pkgdir}/etc/fusiontunx/ui/"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
