# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya
pkgver=2.0.5
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v2rayA/v2rayA"
license=('AGPL3')
depends=('glibc')
makedepends=('git' 'go>=2:1.17.0-1' 'nodejs>=14' 'nodejs<=19' 'yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/v2rayA/v2rayA/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')
backup=("etc/default/v2raya")

build() {
    cd "$srcdir/v2rayA-$pkgver/gui"
    # https://github.com/webpack/webpack/issues/14532#issuecomment-947012063
    export NODE_OPTIONS=--openssl-legacy-provider
    yarn --check-files
    OUTPUT_DIR="$srcdir/v2rayA-$pkgver/service/server/router/web" yarn build

    cd "$srcdir/v2rayA-$pkgver/service"
    export GO111MODULE=on
    export GOPROXY=https://mirrors.aliyun.com/goproxy/,direct
    go build -ldflags '-X github.com/v2rayA/v2rayA/conf.Version='$pkgver' -s -w' -o v2raya
    
    # generate default config
    cat > "$srcdir/v2rayA-$pkgver/v2raya.conf" << EOF
# v2raya config example
# Everything has defaults so you only need to uncomment things you want to
# change

EOF
    chmod +x ./v2raya
    ./v2raya --report config | sed '1,6d' | fold -s -w 78 | sed -E 's/^([^#].+)/# \1/'  >> "$srcdir/v2rayA-$pkgver/v2raya.conf"
}

package() {
    depends+=('v2ray>=5.0.0')

    cd "${srcdir}"/"v2rayA-${pkgver}"/
    install -Dm 755 service/v2raya -t "${pkgdir}"/usr/bin/
    install -dm 750 "${pkgdir}"/etc/v2raya/
    install -Dm 644 install/universal/v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 install/universal/v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 install/universal/v2raya-lite.service -t "${pkgdir}"/usr/lib/systemd/user/
    install -Dm 644 gui/public/img/icons/android-chrome-512x512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
    install -Dm 644 v2raya.conf "${pkgdir}"/etc/default/v2raya
}
