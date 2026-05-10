# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-bin
pkgver=3.8.1
pkgrel=2
pkgdesc="A self-hosted media server for anime with anilist integration (pre-compiled binary)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
provides=('seanime')
conflicts=('seanime')
depends=('systemd')
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('911b3dc3ceb75ab6fd4c14e193cee80055719bccc7e1fb5ea7afc4137a3cb7e3')

package() {
    # Extracting to the source directory happens automatically
    cd "${srcdir}"

    # Create directories
    install -d "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/opt/seanime"

    # Install the binary and web assets to /opt/seanime
    # Note: The Linux release tarball usually contains the 'seanime' binary and 'web' folder
    install -m 755 seanime -t "${pkgdir}/opt/seanime/"

    # Check if 'web' exists in the release archive before copying
    if [ -d "web" ]; then
        cp -r web "${pkgdir}/opt/seanime/"
    fi

    # Create the symlink in /usr/bin
    ln -s "/opt/seanime/seanime" "${pkgdir}/usr/bin/seanime"

    # Install the systemd user service
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
