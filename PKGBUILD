# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime
pkgver=3.9.1
pkgrel=0
pkgdesc="A self-hosted media server for anime with anilist integration"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=(seanime-bin)
depends=('systemd')
makedepends=('go' 'npm' 'nodejs')
source=(https://github.com/5rahim/seanime/archive/refs/tags/v3.9.0.tar.gz)
sha256sums=('aadbbde992b14f4103e37d712caff4c4da1f86b46b6342887f4a2edd47153fb4')

prepare() {
    cd "${pkgname}-${pkgver}"
    cd seanime-web
    npm install
    npm run build

    mkdir -p ../web
    cp -r out/* ../web/
    cd ..
}

build() {
    cd "${pkgname}-${pkgver}"

    export CGO_ENABLED=1
    go build -o seanime -trimpath -ldflags="-s -w"
}

package() {
    cd "${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -m 755 seanime -t "${pkgdir}/opt/${pkgname}/"
    cp -r web "${pkgdir}/opt/${pkgname}/"
    ln -s "/opt/${pkgname}/seanime" "${pkgdir}/usr/bin/"

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/seanime.service" <<EOF
[Unit]
Description=Seanime Service
After=network.target

[Service]
ExecStart=/usr/bin/seanime
Restart=always

[Install]
WantedBy=default.target
EOF
}
