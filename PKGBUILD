# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Leone <comdir@infonix.info>
pkgname=litemanager
pkgver=5237
pkgrel=1
epoch=
pkgdesc="remote access software for remote administration of computers over the Internet or remote control in a local network, for distant learning, providing remote support to users and supervising work activity of employees."
arch=('x86_64')
url="https://www.litemanager.com"
license=('custom')
groups=()
depends=()
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("LiteManager_linux-${pkgver}.zip::https://litemanager.com/soft/LiteManager_linux.zip"
litemanager.png)

noextract=()
md5sums=('547643ca271903f153bb51345810b916'
         'ce19ee278e856d0e17610979ede081b4')

validpgpkeys=()

prepare() {
	
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories="GTK;GNOME;X-GNOME-NetworkSettings;Network;" \
    --icon "/usr/share/pixmaps/${pkgname}.png" \
    --exec "litemanager"
	
}



package() {
  install -d "${pkgdir}/" "$pkgdir/opt/${pkgname}"

  # Внутри общего архива лежат два билда: старый (в папке
  # LiteManager_linux/LiteManager, с readme) и отдельный zip
  # "LiteManager_linux_<версия>.zip" с голым бинарником более новой сборки.
  # Начиная с 5237 используем именно второй - он новее старого.
  local _new_build="${srcdir}/LiteManager_linux_${pkgver}.zip"

  if [ -f "${_new_build}" ]; then
    msg2 "Используется отдельный билд LiteManager_linux_${pkgver}.zip"
    mkdir -p "${srcdir}/new_build_extract"
    bsdtar -xf "${_new_build}" -C "${srcdir}/new_build_extract"
    install -Dm755 "${srcdir}/new_build_extract/LiteManager" "$pkgdir/opt/litemanager/litemanager"
  else
    warning "LiteManager_linux_${pkgver}.zip не найден - используем старую упаковку (LiteManager_linux/LiteManager)."
    install -Dm755 "${srcdir}/LiteManager_linux/LiteManager" "$pkgdir/opt/litemanager/litemanager"
  fi

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/litemanager/litemanager" "$pkgdir/usr/bin/litemanager"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/litemanager.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
