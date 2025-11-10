# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime
pkgver=3.0.1
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=('systemd')
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('ab09c1117e7a29ac16457292c89fc6c4d1e2a6bcf35d3d9bf1ea2b65d25ca940')

package() {
  install -d "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -m 755 "${srcdir}/seanime" -t "${pkgdir}/opt/${pkgname}/"
  ln -s "/opt/${pkgname}/seanime" "${pkgdir}/usr/bin/"

  local user=${USER:-root}
  local group=${USER:-root}

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
  systemctl enable seanime --now
}
