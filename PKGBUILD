# Maintainer: Marco Scardovi <mscardovi95 at gmail dot com>

# Hardware support is limited. Nvidia cards should work fine.
# If you're running a hybrid setup, try with primusrun/optirun or progl.

# Get the source file DaVinci_Resolve_Studio_${pkgver}_Linux.zip from:
# https://blackmagicdesign.com
# and save it in the same directory of this PKGBUILD

pkgname=davinci-resolve-studio-beta
_pkgname=davinci-resolve-studio
pkgver=21.0b1
pkgrel=2
arch=('x86_64')
url="https://blackmagicdesign.com"
license=('LicenseRef-Commercial')
depends=(
    'glu' 'gtk2' 'libpng12' 'fuse2' 'opencl-driver' 'qt5-x11extras' 'qt5-svg' 'qt5-webengine'
    'qt5-websockets' 'qt5-quickcontrols2' 'qt5-multimedia' 'libxcrypt-compat' 'xmlsec' 'libc++'
    'java-runtime' 'ffmpeg4.4' 'gst-plugins-bad-libs' 'python-numpy' 'tbb' 'apr-util' 'luajit'
    'libc++abi' 'libvpx' 'libpulse'
)
makedepends=('libarchive' 'xdg-user-dirs' 'patchelf')
conflicts=('davinci-resolve-studio' 'davinci-resolve' 'davinci-resolve-beta')
provides=('davinci-resolve-studio')
source=(
    "file://DaVinci_Resolve_Studio_${pkgver}_Linux.zip"
    "davinci-control-panels-setup.sh"
)
sha256sums=('8d49c7e95a589923d0bac5bd2c72f86742a613b47e1654a9fefcca83e4bf6920'
            'f17236fd68cead727c647bc31404e402922cdd491df5526f4b62364cbef9d3b8')
options=('!strip')

prepare() {
  local _run_file="DaVinci_Resolve_Studio_${pkgver}_Linux.run"
  chmod +x "$_run_file"

  # Extract the AppImage bundled in the .run installer
  "./$_run_file" --appimage-extract

  cd "squashfs-root"

  # Extract control panels framework
  pushd "share/panels"
  tar -zxf dvpanel-framework-linux-x86_64.tgz
  mv *.so "../../libs"
  mv lib/* "../../libs"
  popd

  # Remove unnecessary installer files
  rm -rf installer AppRun*

  # Standardize file and directory permissions
  find . -type d -exec chmod 755 {} +
  find . -type f -exec chmod 644 {} +
  find ./bin ./libs -type f -exec chmod 755 {} +

  # Patch RPATH for internal binaries
  find . -type f -executable -exec sh -c "file {} | grep -q 'ELF' && patchelf --set-rpath '/opt/$_pkgname/libs:\$ORIGIN' {}" \; 2>/dev/null || true

  # Fix hardcoded paths
  find . -type f \( -name "*.desktop" -o -name "*.directory" -o -name "*.menu" \) -exec sed -i "s|RESOLVE_INSTALL_LOCATION|/opt/$_pkgname|g" {} +

  # Improve taskbar integration
  echo "StartupWMClass=resolve" >> "share/DaVinciResolve.desktop"

  # Link critical system libraries to prevent crashes
  for lib in libglib-2.0.so.0 libgio-2.0.so.0 libgmodule-2.0.so.0 libgobject-2.0.so.0; do
    if [ -f "/usr/lib/$lib" ]; then
      rm -f "libs/$lib"
      ln -s "/usr/lib/$lib" "libs/$lib"
    fi
  done
}

package() {
  # 1. Install launchers
  install -Dm755 "${srcdir}/davinci-control-panels-setup.sh" "${pkgdir}/usr/bin/davinci-control-panels-setup"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/$_pkgname/bin/resolve" "${pkgdir}/usr/bin/davinci-resolve-studio-beta"

  # 2. Main folder
  install -d "${pkgdir}/opt/$_pkgname"
  cp -rp squashfs-root/* "${pkgdir}/opt/$_pkgname/"

  cd "${pkgdir}/opt/$_pkgname"

  # 3. Desktop Integration
  install -Dm644 share/DaVinciResolve.desktop "${pkgdir}/usr/share/applications/davinci-resolve-studio.desktop"
  install -Dm644 share/blackmagicraw-player.desktop "${pkgdir}/usr/share/applications/blackmagicraw-player.desktop"
  install -Dm644 share/blackmagicraw-speedtest.desktop "${pkgdir}/usr/share/applications/blackmagicraw-speedtest.desktop"

  # 4. Icons
  install -Dm644 graphics/DV_Resolve.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve.png"
  install -Dm644 graphics/DV_Panels.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve-panels-setup.png"

  # 5. MIME Types
  install -Dm644 share/resolve.xml "${pkgdir}/usr/share/mime/packages/davinci-resolve.xml"

  # 6. Udev rules
  install -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 share/etc/udev/rules.d/*.rules "${pkgdir}/usr/lib/udev/rules.d/"
}
