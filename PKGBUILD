# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-denshi
_pkgname=seanime-denshi
pkgver=3.4.3
pkgrel=2
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration. (Denshi AppImage variant)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
depends=('fuse2' 'systemd')
conflicts=('seanime' 'seanime-bin')
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage")
sha256sums=('b267166f36ecfde6d3df1fd39d66209ee49b96ac61ea8a07adaf0e94e69ff937')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage" \
    "${pkgdir}/opt/${pkgname}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage"

  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  local user=${USER:-root}
  local group=${USER:-root}

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" <<EOF
[Unit]
Description=Seanime Denshi Service
After=network.target

[Service]
ExecStart=/usr/bin/${pkgname}
Restart=always
User=$user
Group=$group

[Install]
WantedBy=multi-user.target
EOF
}
