# Maintainer: primordialhuman https://github.com/primordial-human
pkgname=seanime
pkgver=2.8.4
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=('systemd')
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('623b7e3aae3640c7781fa32dcd995268361abf910439a9189164c2c73c9cf0ce')

package() {
    # Install the binary
    install -d "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -m 755 "${srcdir}/seanime" -t "${pkgdir}/opt/${pkgname}/"
    ln -s "/opt/${pkgname}/seanime" "${pkgdir}/usr/bin/"

    # Dynamically insert the user who runs the script
    local user=${USER:-root}  # Get the username of the user running the script, default to root
    local group=${USER:-root}  # Same for the group

    # Create the systemd service file with the dynamic user and group
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/seanime.service" <<EOF
[Unit]
Description=Seanime Service
After=network.target

[Service]
ExecStart=/usr/bin/seanime
Restart=always
User=$user
Group=$group

[Install]
WantedBy=multi-user.target
EOF
}

post_install() {
    # Enable and start the service after installation
    systemctl enable seanime.service
    systemctl start seanime.service
}

