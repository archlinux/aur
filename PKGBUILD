# Maintainer: RedLim <yt.redlim@gmail.com>
pkgname='cpro-ngate'
_pkgpath='cprongate'
_pkgver='1.0.20-98'
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='CryptoPro NGate VPN Client'
arch=('x86_64')
options=('!debug')
url='https://www.cryptopro.ru/products/ngate'
license=('unknown')
depends=(
'cryptopro-csp-k1'
'fontconfig'
'freetype2'
'gcc-libs'
'glib2'
'glibc'
'libglvnd'
'libx11'
'libxau'
'libxcomposite'
'libxext'
'zlib'
)
makedepends=('binwalk' '7zip')
install="${pkgname}.install"

source=("installerLin-offline-1.0.20-98-ga6f39b7-x64::local://installerLin-offline-1.0.20-98-ga6f39b7-x64" # download from https://cryptopro.ru/sites/default/files/private/ngate/1.0.22/clients/desktop/installerLin-offline-1.0.20-98-ga6f39b7-x64
        "cpro-ngate.service"
        "ngateclient.desktop"
        "cpro-ngate.install")

sha256sums=('9c93447123bbd98200b95b73e9f7fb32b70831fb84a805fea3f8c78840aa893e'
            '95ce0bb096a03001b9091020cdde9ee663a3d8d68331283972464dfa1cf9191a'
            '646fb774c19a6e90c7905609ada12eff3702732835bc6322f81a17a4c158b85f'
            'fd33cf8818e3df2c2d78824bcd08ccb17c8bec13c1c84a899cd4deb49a0ecde4')

prepare() {
  cd "$srcdir"
  echo "Unpacking installer..."
  binwalk -e --include='7zip' "installerLin-offline-1.0.20-98-ga6f39b7-x64"
}

package() {
  local extracted_dir
  extracted_dir=$(find "$srcdir" -type d -name 'installerLin-offline-1.0.20-98-ga6f39b7-x64.extracted' -print -quit)

  if [[ -z "$extracted_dir" ]]; then
    echo "Can't find extraction directory."
    return 1
  fi

  install -d "${pkgdir}/opt/${_pkgpath}"
  cp -a "${extracted_dir}"/*/* "${pkgdir}/opt/${_pkgpath}/" 2>/dev/null

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgpath}/ngateclient" "${pkgdir}/usr/bin/ngateclient"
  ln -s "/opt/${_pkgpath}/ngateconsoleclient" "${pkgdir}/usr/bin/ngateconsoleclient"

  install -Dm644 "${srcdir}/ngateclient.desktop" "${pkgdir}/usr/share/applications/ngateclient.desktop"

  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  install -m644 "${pkgdir}/opt/${_pkgpath}/ngate_logo_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgpath}.png"

  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/ngatetun.service"
  rm -rf extracted/
}
