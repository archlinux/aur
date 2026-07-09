# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.9.1
pkgrel=1
pkgdesc="A self-hosted media server for anime with anilist integration (pre-compiled binary)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
provides=('seanime')
conflicts=('seanime')
depends=('systemd')
source=(https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz)
sha256sums=('47874e0f5e23b1d27b7d0a3cf8c77bd1e3311a556a39ef0758dcc1f8f71ea56f')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/opt/seanime"

    install -m 755 seanime -t "${pkgdir}/opt/seanime/"

    if [ -d "web" ]; then
        cp -r web "${pkgdir}/opt/seanime/"
    fi

    ln -s "/opt/seanime/seanime" "${pkgdir}/usr/bin/seanime"

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
