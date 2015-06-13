# Maintainer: Muflone <muflone@vbsimple.net>

pkgname=kerio-firewall-admin
pkgver=6.7.1.6544
pkgrel=4
_pkgmainver=6.7.1
_pkgsubver=6544
_wineversion=1.3.11
pkgdesc="Kerio Administration Console to manage Kerio Firewall (previously named Kerio Winroute) servers"
arch=('i686' 'x86_64')
url="http://download.kerio.com/archive/download.php"
license=('custom')
depends=(glibc libxext hicolor-icon-theme gtk-update-icon-cache desktop-file-utils shared-mime-info)
makedepends=()
install=$pkgname.install
source=("http://download.kerio.com/dwn/kwf/kerio-kwf-admin-${_pkgmainver}-${_pkgsubver}-win32.exe"
        "wine-${_wineversion}-linux-x86.tar.gz::http://www.playonlinux.com/wine/binaries/linux-x86/PlayOnLinux-wine-${_wineversion}-linux-x86.pol"
        "files-needed-by-wine-${_wineversion}.txt"
        "${pkgname}"
        "${pkgname}-16.png"
        "${pkgname}-24.png"
        "${pkgname}-32.png"
        "${pkgname}-48.png"
        "${pkgname}.desktop"
        "${pkgname}.xml"
       )
md5sums=('83b7adf85da2f2948d0a6629fd30b8db'
         '7fb1bcabb94592de791705cfc72e6b60'
         '6ea34509a717806f75fb2c74ba90408f'
         '4377e2436f55062d065a61e5aba34f3a'
         '0c9d42e9abaaa2d03640e74c608d292c'
         '7b6acf1cb87630b08f9b0758e6ea0bc3'
         'bfeca82192a9520b526f0bb53ad00506'
         '0a016cf1daf2958b236aad4676a2c96e'
         'e10a5c9abc956c667e889d2d1802eefe'
         '8f21e8dca28c3f8d68fa6b48a89e6fb6'
        )

if [ "$CARCH" = "x86_64" ]
then
  depends+=(lib32-glibc lib32-alsa-lib lib32-gcc-libs lib32-mesa lib32-glu lib32-libldap lib32-libsm lib32-libxext lib32-libxml2)
fi

build() {
  # Prepares the wine environment
  install -m755 -d "${srcdir}/wine" "${srcdir}/local"
  export WINEPREFIX="$srcdir"/wine
  export XDG_DATA_HOME="${srcdir}/local"
  export WINEDLLOVERRIDES="mscoree,mshtml,winemp3.acm="
  msg2 "Install Kerio Firewall Administration in a temporary wine environment"
  LD_PRELOAD= wineversion/${_wineversion}/bin/wine "${srcdir}/kerio-kwf-admin-${_pkgmainver}-${_pkgsubver}-win32.exe" /S /v'/qn INSTALLDIR="C:\\Kerio"'
}

package() {
  msg2 "Copy the Kerio program files"
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/wine/drive_c/Kerio/Admin" "${pkgdir}/usr/share/${pkgname}/Admin"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/wine/bin"

  msg2 "Copy the files needed by the portable wine instance"
  while read file
  do
    if [ "${file:${#file}-1}" = '/' ]
    then
      # Create directory
      install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/wine/${file}"
    else
      # Copy file
      install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/wine/${file%/*}" "${srcdir}/wineversion/${_wineversion}/${file}"
    fi
  done < files-needed-by-wine-${_wineversion}.txt

  msg2 "Change files permissions"
  chmod +x "${pkgdir}/usr/lib/${pkgname}/wine/bin"/*
  chmod +x "${pkgdir}/usr/lib/${pkgname}/wine/lib"/*
  chmod +x "${pkgdir}/usr/lib/${pkgname}/wine/lib/wine"/*
  msg2 "Create libraries symlinks"
  ln -s "libwine.so.1.0" "${pkgdir}/usr/lib/${pkgname}/wine/lib/libwine.so"
  ln -s "libwine.so.1.0" "${pkgdir}/usr/lib/${pkgname}/wine/lib/libwine.so.1"
  msg2 "Install startup script"
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}"
  msg2 "Install the license file"
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../${pkgname}/Admin/acknowledgments.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  msg2 "Install icons and desktop files"
  install -m 644 -D ${pkgname}-16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -m 644 -D ${pkgname}-24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/${pkgname}.png"
  install -m 644 -D ${pkgname}-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -m 644 -D ${pkgname}-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -m 644 -D ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -m 644 -D ${pkgname}.xml "$pkgdir/usr/share/mime/packages/${pkgname}.xml"
}

