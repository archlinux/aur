# Maintainer: WZ Ordinary Ventures <ordinarypaint@wzordinaryventures.com>
pkgname=ordinary-paint-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A screenshot annotation tool"
arch=('x86_64')
url="https://wzordinaryventures.com/ordinarypaint"
license=('custom:Ordinary Paint License')
provides=('ordinary-paint')
conflicts=('ordinary-paint')
depends=('gtk3' 'nss' 'alsa-lib')
options=(!debug)
source=("https://github.com/wz-ordinary-ventures/ordinary-paint-releases/releases/download/v${pkgver}/ordinary-paint-${pkgver}-linux-x64.tar.gz"
        "LICENSE")
sha256sums=('69ce629bbbcd0e8727a35121c5784f56fd485d1cad76a99f2c3d87623ebf176a'
            'SKIP')

package() {
  local _appdir="${srcdir}/ordinary-paint-${pkgver}-linux-x64"

  if [[ ! -d "${_appdir}" ]]; then
    echo "Missing ${_appdir}. Build the Electron unpacked app first with: npm run pack" >&2
    return 1
  fi

  install -dm755 "${pkgdir}/opt/ordinary-paint"
  cp -a "${_appdir}/." "${pkgdir}/opt/ordinary-paint/"
  chmod 755 "${pkgdir}/opt/ordinary-paint/ordinary-paint"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/ordinary-paint/ordinary-paint "${pkgdir}/usr/bin/ordinary-paint"

  local _icons_dir="${srcdir}/icons"
  for _size in 16 24 32 48 64 128 192 256 512; do
    install -Dm644 "${_icons_dir}/ordinary-paint-${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/ordinary-paint.png"
  done

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ordinary-paint.desktop" <<'EOF'
[Desktop Entry]
Name=Ordinary Paint
Comment=Screenshot annotation tool
Exec=ordinary-paint
Icon=ordinary-paint
Terminal=false
Type=Application
Categories=Graphics;Utility;
StartupNotify=true
StartupWMClass=ordinary-paint
X-GNOME-WMClass=ordinary-paint
EOF
}
