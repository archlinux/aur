# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=kerio-firewall-admin
pkgver=6.7.1.6544
pkgrel=5
_wineversion=1.7.53
pkgdesc="Kerio Administration Console to manage Kerio Firewall (previously named Kerio Winroute) servers"
arch=('i686' 'x86_64')
url="http://download.kerio.com/archive/download.php"
license=('custom')
depends=('gtk-update-icon-cache' 'desktop-file-utils' 'shared-mime-info')
depends_i686=('libxext')
depends_x86_64=('lib32-freetype2' 'lib32-alsa-lib' 'lib32-glu' 'lib32-libldap' 'lib32-libsm' 'lib32-libxml2')
makedepends_i686=('freetype2')
makedepends_x86_64=('lib32-freetype2')
install=${pkgname}.install
source=("http://download.kerio.com/dwn/kwf/kerio-kwf-admin-${pkgver%.*}-${pkgver##*.}-win32.exe"
        "wine-${_wineversion}-linux-x86.tar.gz::http://www.playonlinux.com/wine/binaries/linux-x86/PlayOnLinux-wine-${_wineversion}-linux-x86.pol"
        "files-needed-by-wine-${_wineversion}.txt"
        "${pkgname}"
        "${pkgname}-16.png"
        "${pkgname}-24.png"
        "${pkgname}-32.png"
        "${pkgname}-48.png"
        "${pkgname}.desktop"
        "${pkgname}-wradmin.desktop"
        "${pkgname}.xml")
sha256sums=('231a51ace76f94464b107cabfed5c8fd79cfce8a6d618f33a94c01f73d7979bf'
            '460f16e2cf5c9851305d4f5f411c93e46731e0e3af5ff9fcf78757c2df93b490'
            '22ed5585b6d52bf9914b1ad48b97d55d66288ebee3d005800b403b13282b47e4'
            'fa4e1af9669c91252c705063deb5f8de83d249dd5f5de4fd4c4f8a16ce67a650'
            '950c6f17587578c1a6a900790112261437e41af34769e8eff17a34307a2bdc5e'
            '0000cb7a8225e6bdbc00e28e3c660f919e563d0153322dcf9581f3d97ea7ebcb'
            'c2f7a59b33a0c6862003f7461fc573cac5c6a7468c24e6d567e5d13aae00e311'
            '13ec6a852125cd499936e54560fd5d7593b93241fc3ff222d26aec2b557118a3'
            '89685e598ca5daacd1a0eed90407474c0122c3095e2a4f581cc2bebd0593fe88'
            '0225a313576ddd8211cac7f6a979c7a20a5718d04907b77371818106a54ebc0d'
            '8b614c7bcb589f7e7dee22e3a43c634cad6d9f45ad3df8c3b34e1b13fe2e6c7c')

build() {
  # Prepares the wine environment
  install -m755 -d "${srcdir}/wine" "${srcdir}/local"
  export WINEPREFIX="${srcdir}/wine"
  export XDG_DATA_HOME="${srcdir}/local"
  export WINEDLLOVERRIDES="mscoree,mshtml,winemp3.acm="
  export WINEDEBUG=-all
  msg2 "Install Kerio Firewall Administration in a temporary wine environment"
  LD_PRELOAD= wineversion/${_wineversion}/bin/wine "${srcdir}/kerio-kwf-admin-${pkgver%.*}-${pkgver##*.}-win32.exe" /S /v'/qn INSTALLDIR="C:\\Kerio"'
}

package() {
  msg2 "Copy the Kerio program files"
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/wine/drive_c/Kerio/Admin" "${pkgdir}/usr/share/${pkgname}/Admin"

  msg2 "Copy the files needed by the portable wine instance"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/wine"
  while read file
  do
    if [ ! "${file:0:1}" = '#' ]
    then
      if [ "${file:${#file}-1}" = '/' ]
      then
        # Create directory
        install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/wine/${file}"
      else
        # Copy file
        install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/wine/${file%/*}" "${srcdir}/wineversion/${_wineversion}/${file}"
      fi
    else
      msg2 "Skipping file ${file:1}"
    fi
  done < files-needed-by-wine-${_wineversion}.txt
  msg2 "Create libraries symlinks"
  ln -s "libwine.so.1.0" "${pkgdir}/usr/lib/${pkgname}/wine/lib/libwine.so"
  ln -s "libwine.so.1.0" "${pkgdir}/usr/lib/${pkgname}/wine/lib/libwine.so.1"

  msg2 "Change files permissions"
  chmod +x "${pkgdir}/usr/lib/${pkgname}/wine/bin"/*
  chmod +x "${pkgdir}/usr/lib/${pkgname}/wine/lib"/*
  chmod +x "${pkgdir}/usr/lib/${pkgname}/wine/lib/wine"/*
  msg2 "Install startup script"
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}"
  msg2 "Install the license file"
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../${pkgname}/Admin/acknowledgments.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
  msg2 "Install icons and desktop files"
  install -m 644 -D ${pkgname}-16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -m 644 -D ${pkgname}-24.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${pkgname}.png"
  install -m 644 -D ${pkgname}-32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -m 644 -D ${pkgname}-48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -m 644 -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m 644 -D ${pkgname}-wradmin.desktop "${pkgdir}/usr/share/applications/${pkgname}-wradmin.desktop"
  install -m 644 -D ${pkgname}.xml "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
}

