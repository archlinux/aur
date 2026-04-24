# Maintainer: Marco Scardovi <mscardovi95 at gmail dot com>

pkgname=davinci-resolve-studio-beta
_pkgname=resolve-studio
pkgver=21.0b1
pkgrel=3
arch=('x86_64')
url="https://blackmagicdesign.com"
license=('LicenseRef-Commercial')
depends=('glu' 'gtk2' 'libpng12' 'fuse2' 'opencl-driver' 'qt5-x11extras' 'qt5-svg' 'qt5-webengine'
         'qt5-websockets' 'qt5-quickcontrols2' 'qt5-multimedia' 'libxcrypt-compat' 'xmlsec' 'libc++'
         'java-runtime' 'ffmpeg4.4' 'gst-plugins-bad-libs' 'python-numpy' 'tbb' 'apr-util' 'luajit' 'libc++abi')
makedepends=('libarchive' 'xdg-user-dirs' 'patchelf')
conflicts=('davinci-resolve-studio' 'davinci-resolve' 'davinci-resolve-beta' 'davinci-resolve-studio-beta')
provides=('davinci-resolve-studio')
install="${pkgname}.install"
source=("file://DaVinci_Resolve_Studio_${pkgver}_Linux.zip" "davinci-control-panels-setup.sh")
sha256sums=('30da326f147d53a71bbe7e69fe76089f7cf3f2e8e7370e0bd13036a84a97fce7'
            '906094162335734c2edbb2c3ae8d51df5a589621c0779b9f678407126a66c7b4')
options=('!strip')

prepare() {
  chmod u+x "./DaVinci_Resolve_Studio_${pkgver}_Linux.run"
  "./DaVinci_Resolve_Studio_${pkgver}_Linux.run" --appimage-extract
  chmod -R u+rwX,go+rX,go-w "squashfs-root"

  cd "squashfs-root"
  pushd "share/panels"
  tar -zxf dvpanel-framework-linux-x86_64.tgz
  chmod -R u+rwX,go+rX,go-w "lib"
  mv *.so "../../libs"
  mv lib/* "../../libs"
  popd

  rm -rf installer installer* AppRun*
  find . -type d -exec chmod 755 {} +
  find . -type f -exec chmod 644 {} +

  while IFS= read -r -d '' _file; do
    [[ -f "${_file}" && $(od -t x1 -N 4 "${_file}") == *"7f 45 4c 46"* ]] || continue
    chmod 0755 "${_file}"
    patchelf --set-rpath "/opt/${_pkgname}/libs:\$ORIGIN" "${_file}"
  done < <(find . -type f -size -32M -print0)

  find . -type f \( -name "*.desktop" -o -name "*.directory" -o -name "*.menu" \) -exec sed -i "s|RESOLVE_INSTALL_LOCATION|/opt/${_pkgname}|g" {} +
  ln -sf /usr/lib/libglib-2.0.so.0 "libs/libglib-2.0.so.0"
  ln -sf /usr/lib/libgio-2.0.so.0 "libs/libgio-2.0.so.0"
  ln -sf /usr/lib/libgmodule-2.0.so.0 "libs/libgmodule-2.0.so.0"
}

package() {
  install -Dm755 "davinci-control-panels-setup.sh" "${pkgdir}/usr/bin/davinci-control-panels-setup"
  install -d "${pkgdir}/usr/bin"
  echo -e "#!/bin/sh\nexport LD_LIBRARY_PATH=/opt/${_pkgname}/libs:\$LD_LIBRARY_PATH\ncd /opt/${_pkgname}/bin\nexec ./resolve \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -rf squashfs-root/* "${pkgdir}/opt/${_pkgname}"

  install -Dm644 "squashfs-root/share/DaVinciResolve.desktop" "${pkgdir}/usr/share/applications/davinci-resolve-studio.desktop"
  install -Dm644 "squashfs-root/share/DaVinciResolve.directory" "${pkgdir}/usr/share/desktop-directories/DaVinciResolve.directory"
  install -Dm644 "squashfs-root/share/DaVinciResolve.menu" "${pkgdir}/etc/xdg/menus/applications-merged/DaVinciResolve.menu"
  install -Dm644 "squashfs-root/graphics/DV_Resolve.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve.png"
}
