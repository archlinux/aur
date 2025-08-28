# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

# Hardware support is limited. Nvidia cards should work fine.
# If you're running a hybrid setup, try with primusrun/optirun.

# Get the source file DaVinci_Resolve_${pkgver}_Linux.zip from:
# https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion
# and save it in the same directory of this PKGBUILD

_pkgname=resolve
pkgname=davinci-resolve
pkgver=20.1.1
pkgrel=1
pkgdesc='Professional A/V post-production software suite from Blackmagic Design'
arch=('x86_64')
url="https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion"
license=('LicenseRef-Commercial')
depends=('glu' 'gtk2' 'libpng12' 'fuse2' 'opencl-driver' 'qt5-x11extras' 'qt5-svg' 'qt5-webengine'
         'qt5-websockets' 'qt5-quickcontrols2' 'qt5-multimedia' 'libxcrypt-compat' 'xmlsec'
         'java-runtime' 'ffmpeg4.4' 'gst-plugins-bad-libs' 'python-numpy' 
         'tbb' 'apr-util' 'luajit' 'libc++' 'libc++abi')
makedepends=('libarchive' 'xdg-user-dirs' 'patchelf')
conflicts=('davinci-resolve-studio' 'davinci-resolve-beta' 'davinci-resolve-studio-beta')
source=("file://DaVinci_Resolve_${pkgver}_Linux.zip"
        "davinci-control-panels-setup.sh")
sha256sums=('f9526cbd447705a0b8171cede208cb2346c1570f67d61cd380525c109ef340d7'
            'f17236fd68cead727c647bc31404e402922cdd491df5526f4b62364cbef9d3b8')
install="${pkgname}.install"
options=('!strip')

prepare() {
  chmod u+x "./DaVinci_Resolve_${pkgver}_Linux.run"
  "./DaVinci_Resolve_${pkgver}_Linux.run" --appimage-extract

  # Fix permission to all files and dirs
  chmod -R u+rwX,go+rX,go-w "squashfs-root"

  pushd "squashfs-root/share/panels"
  tar -zxf dvpanel-framework-linux-x86_64.tgz
  chmod -R u+rwX,go+rX,go-w "lib"
  mv *.so "${srcdir}/squashfs-root/libs"
  mv lib/* "${srcdir}/squashfs-root/libs"
  popd

  rm -rf squashfs-root/installer squashfs-root/installer* squashfs-root/AppRun squashfs-root/AppRun*

  while IFS= read -r -d '' _file; do
    chmod 0755 "${_file}"
  done < <(find "squashfs-root" -type d -print0)

  while IFS= read -r -d '' _file; do
    [[ -f "${_file}" && $(od -t x1 -N 4 "${_file}") == *"7f 45 4c 46"* ]] || continue
    chmod 0755 "${_file}"
  done < <(find "squashfs-root" -type f -print0)

  # Prepare list of paths for patchelf
  _patchelf_paths=("libs"
                   "libs/plugins/sqldrivers"
                   "libs/plugins/xcbglintegrations"
                   "libs/plugins/imageformats"
                   "libs/plugins/platforms"
                   "libs/Fusion"
                   "plugins"
                   "bin"
                   "BlackmagicRAWSpeedTest/BlackmagicRawAPI"
                   "BlackmagicRAWSpeedTest/plugins/platforms"
                   "BlackmagicRAWSpeedTest/plugins/imageformats"
                   "BlackmagicRAWSpeedTest/plugins/mediaservice"
                   "BlackmagicRAWSpeedTest/plugins/audio"
                   "BlackmagicRAWSpeedTest/plugins/xcbglintegrations"
                   "BlackmagicRAWSpeedTest/plugins/bearer"
                   "BlackmagicRAWPlayer/BlackmagicRawAPI"
                   "BlackmagicRAWPlayer/plugins/mediaservice"
                   "BlackmagicRAWPlayer/plugins/imageformats"
                   "BlackmagicRAWPlayer/plugins/audio"
                   "BlackmagicRAWPlayer/plugins/platforms"
                   "BlackmagicRAWPlayer/plugins/xcbglintegrations"
                   "BlackmagicRAWPlayer/plugins/bearer"
                   "Onboarding/plugins/xcbglintegrations"
                   "Onboarding/plugins/qtwebengine"
                   "Onboarding/plugins/platforms"
                   "Onboarding/plugins/imageformats"
                   "DaVinci Control Panels Setup/plugins/platforms"
                   "DaVinci Control Panels Setup/plugins/imageformats"
                   "DaVinci Control Panels Setup/plugins/bearer"
                   "DaVinci Control Panels Setup/AdminUtility/PlugIns/DaVinciKeyboards"
                   "DaVinci Control Panels Setup/AdminUtility/PlugIns/DaVinciPanels")
  for _index in "${!_patchelf_paths[@]}"
  do
    _patchelf_paths[${_index}]="/opt/${_pkgname}/${_patchelf_paths[${_index}]}"
  done
  while IFS= read -r -d '' _file; do
    [[ -f "${_file}" && $(od -t x1 -N 4 "${_file}") == *"7f 45 4c 46"* ]] || continue
    patchelf --set-rpath "$(IFS=":"; echo "${_patchelf_paths[*]}:\$ORIGIN")" "${_file}"
  done < <(find "squashfs-root" -type f -size -32M -print0)

  while IFS= read -r -d '' _file; do
    sed -i "s|RESOLVE_INSTALL_LOCATION|/opt/${_pkgname}|g" "${_file}"
  done < <(find . -type f '(' -name "*.desktop" -o -name "*.directory" -o -name "*.directory" -o -name "*.menu" ')' -print0)

  rm "squashfs-root/libs/libc++.so.1" \
    "squashfs-root/libs/libglib-2.0.so.0" \
    "squashfs-root/libs/libgio-2.0.so.0" \
    "squashfs-root/libs/libgmodule-2.0.so.0" \
    "squashfs-root/libs/libc++abi.so.1"
  ln -s "../BlackmagicRAWPlayer/BlackmagicRawAPI" "squashfs-root/bin/"
  ln -s /usr/lib/libc++.so.1.0 "squashfs-root/libs/libc++.so.1"
  ln -s /usr/lib/libc++abi.so.1.0 "squashfs-root/libs/libc++abi.so.1"
  ln -s /usr/lib/libglib-2.0.so.0 "squashfs-root/libs/libglib-2.0.so.0"
  ln -s /usr/lib/libgio-2.0.so.0 "squashfs-root/libs/libgio-2.0.so.0"
  ln -s /usr/lib/libgmodule-2.0.so.0 "squashfs-root/libs/libgmodule-2.0.so.0"
  ln -s /usr/lib/libgdk_pixbuf-2.0.so.0 "squashfs-root/libs/libgdk_pixbuf-2.0.so.0"

  echo "StartupWMClass=resolve" >> "squashfs-root/share/DaVinciResolve.desktop"

  echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="096e", MODE="0666"' > "squashfs-root/share/etc/udev/rules.d/99-DavinciPanel.rules"

  # Fix desktop files
  sed -i 's#Exec=.*#Exec=davinci-control-panels-setup#' \
    "squashfs-root/share/DaVinciControlPanelsSetup.desktop"
  sed -i 's#Icon=.*#Icon=davinci-resolve.png#' \
    "squashfs-root/share/DaVinciResolve.desktop"
  sed -i 's#Icon=.*#Icon=davinci-resolve-panels-setup.png#' \
    "squashfs-root/share/DaVinciControlPanelsSetup.desktop"
  sed -i 's#Icon=.*#Icon=blackmagicraw-player.png#' \
    "squashfs-root/share/blackmagicraw-player.desktop"
  sed -i 's#Icon=.*#Icon=blackmagicraw-speedtest.png#' \
    "squashfs-root/share/blackmagicraw-speedtest.desktop"
}

package() {
  # Install binary launchers
  install -D -m 0755 "${srcdir}/davinci-control-panels-setup.sh" \
    "${pkgdir}/usr/bin/davinci-control-panels-setup"
  ln -s "/opt/resolve/bin/resolve" "${pkgdir}/usr/bin/${pkgname}"
  # Install other files
  install -d -m 0755 "${pkgdir}/opt/${_pkgname}"
  cp -rf squashfs-root/* "${pkgdir}/opt/${_pkgname}"

  # Distribute files into other directories
  pushd "${pkgdir}/opt/${_pkgname}"
  install -D -m 0644 -t "${pkgdir}/opt/${_pkgname}/configs" \
    "share/default-config.dat" \
    "share/log-conf.xml"
  install -D -m 0644 -t "${pkgdir}/opt/${_pkgname}/DolbyVision" \
    "share/default_cm_config.bin"
  install -d -m 0755 "${pkgdir}/opt/${_pkgname}/.license"
  install -d -m 0755 "${pkgdir}/opt/${_pkgname}/Apple Immersive/Calibration"
  # Install Desktop files and menu
  install -D -m 0644 -t "${pkgdir}/usr/share/applications" \
    "share/DaVinciResolve.desktop" \
    "share/DaVinciControlPanelsSetup.desktop" \
    "share/blackmagicraw-player.desktop" \
    "share/blackmagicraw-speedtest.desktop"
  install -D -m 0644 -t "${pkgdir}/usr/share/desktop-directories" \
    "share/DaVinciResolve.directory"
  install -D -m 0644 -t "${pkgdir}/etc/xdg/menus" \
    "share/DaVinciResolve.menu"
  # Install icons
  install -D -m 0644 -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps" \
    "graphics/DV_Resolve.png" \
    "graphics/DV_ResolveProj.png"
  install -D -m 0644 "graphics/DV_Resolve.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve.png"
  install -D -m 0644 "graphics/DV_Panels.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve-panels-setup.png"
  install -D -m 0644 "graphics/blackmagicraw-player_256x256_apps.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/blackmagicraw-player.png"
  install -D -m 0644 "graphics/blackmagicraw-speedtest_256x256_apps.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/blackmagicraw-speedtest.png"
  # Install other files
  install -D -m 0644 -t "${pkgdir}/usr/share/mime/packages" \
    "share/resolve.xml"
  install -D -m 0644 -t "${pkgdir}/usr/lib/udev/rules.d" \
    "share/etc/udev/rules.d"/{99-BlackmagicDevices.rules,99-ResolveKeyboardHID.rules,99-DavinciPanel.rules}
  popd
}

