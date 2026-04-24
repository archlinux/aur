# Maintainer: Marco Scardovi <mscardovi95 at gmail dot com>

pkgname=davinci-resolve-studio-beta
_pkgname=davinci-resolve-studio
pkgver=21.0b1
pkgrel=4
arch=('x86_64')
url="https://blackmagicdesign.com"
license=('LicenseRef-Commercial')
depends=(
    'glu' 'libpng12' 'fuse2' 'opencl-driver' 'libxcrypt-compat'
    'apr-util' 'libpulse' 'libvpx' 'tbb' 'libxv' 'alsa-lib'
)
makedepends=('libarchive' 'xdg-user-dirs' 'patchelf')
conflicts=('davinci-resolve-studio' 'davinci-resolve' 'davinci-resolve-beta')
provides=('davinci-resolve-studio')
source=("file://DaVinci_Resolve_Studio_${pkgver}_Linux.zip" "davinci-control-panels-setup.sh")
sha256sums=(
    '30da326f147d53a71bbe7e69fe76089f7cf3f2e8e7370e0bd13036a84a97fce7'
    'c05dae170649006b6e8751d668e4a014e3169d02ff767bdfa582ac9829e49074'
)
options=('!strip')

prepare() {
  local _run_file="DaVinci_Resolve_Studio_${pkgver}_Linux.run"
  chmod +x "$_run_file"

  # Extract the AppImage
  "./$_run_file" --appimage-extract

  # Grant write permissions to everything to prevent "Permission denied" errors
  chmod -R u+w "squashfs-root"

  cd "squashfs-root"

  # Extract control panels framework
  pushd "share/panels"
  tar -zxf dvpanel-framework-linux-x86_64.tgz
  chmod -R u+w "lib"

  # Move panel libraries to main libs folder
  mv *.so "../../libs/"
  mv lib/* "../../libs/"
  popd

  # Clean up unnecessary files
  rm -rf installer AppRun*

  # Standardize permissions for the package
  find . -type d -exec chmod 755 {} +
  find . -type f -exec chmod 644 {} +
  find ./bin ./libs -type f -exec chmod 755 {} +

  # Fix RPATH for internal binaries
  find . -type f -executable -exec sh -c "file {} | grep -q 'ELF' && patchelf --set-rpath '/opt/$_pkgname/libs:\$ORIGIN' {}" \; 2>/dev/null || true

  # Set the correct install path in configuration files
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
  # Install launchers and bin link
  install -Dm755 "${srcdir}/davinci-control-panels-setup.sh" "${pkgdir}/usr/bin/davinci-control-panels-setup"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/$_pkgname/bin/resolve" "${pkgdir}/usr/bin/davinci-resolve-studio-beta"

  # Core files
  install -d "${pkgdir}/opt/$_pkgname"
  cp -rp squashfs-root/* "${pkgdir}/opt/$_pkgname/"

  cd "${pkgdir}/opt/$_pkgname"

  # Integration files
  install -Dm644 share/DaVinciResolve.desktop "${pkgdir}/usr/share/applications/davinci-resolve-studio.desktop"
  install -Dm644 share/blackmagicraw-player.desktop "${pkgdir}/usr/share/applications/blackmagicraw-player.desktop"
  install -Dm644 share/blackmagicraw-speedtest.desktop "${pkgdir}/usr/share/applications/blackmagicraw-speedtest.desktop"

  # Icons
  install -Dm644 graphics/DV_Resolve.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve.png"
  install -Dm644 graphics/DV_Panels.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve-panels-setup.png"

  # MIME and Udev
  install -Dm644 share/resolve.xml "${pkgdir}/usr/share/mime/packages/davinci-resolve.xml"
  install -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 share/etc/udev/rules.d/*.rules "${pkgdir}/usr/lib/udev/rules.d/"
}
