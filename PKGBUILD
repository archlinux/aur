# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.8.7
pkgrel=1
pkgdesc="A self-hosted media server for anime with anilist integration (pre-compiled binary)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
provides=('seanime')
conflicts=('seanime')
depends=('systemd')
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('86876eecca29a88d6b1eb1deb18857649630b7c85402fb291d2ed442c246eca6')

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
