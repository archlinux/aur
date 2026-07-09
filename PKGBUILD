# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.9.1
pkgrel=0
pkgdesc="A self-hosted media server for anime with anilist integration (pre-compiled binary)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
provides=('seanime')
conflicts=('seanime')
depends=('systemd')
source=(https://github.com/5rahim/seanime/releases/download/v3.9.0/seanime-3.9.0_Linux_x86_64.tar.gz)
sha256sums=('bccb70d027ebd63851bfc1a17a2045a609373e12913e92f4330dd0d0bf7cc7be')

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
