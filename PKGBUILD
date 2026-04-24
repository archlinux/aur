# Maintainer: Marco Scardovi <mscardovi95 at gmail dot com>

pkgname=davinci-resolve-beta
_pkgname=davinci-resolve
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
conflicts=('davinci-resolve-studio' 'davinci-resolve' 'davinci-resolve-studio-beta')
provides=('davinci-resolve')
source=("file://DaVinci_Resolve_${pkgver}_Linux.zip" "davinci-control-panels-setup.sh")
sha256sums=(
    '8d49c7e95a589923d0bac5bd2c72f86742a613b47e1654a9fefcca83e4bf6920'
    'be7f99d534fce5eac38e46a409a029d3e70273aca72a9ed505d816a995b2183b'
)
options=('!strip')

prepare() {
  local _run_file="DaVinci_Resolve_${pkgver}_Linux.run"
  chmod +x "$_run_file"

  "./$_run_file" --appimage-extract
  chmod -R u+w "squashfs-root"

  cd "squashfs-root"

  pushd "share/panels"
  tar -zxf dvpanel-framework-linux-x86_64.tgz
  chmod -R u+w "lib"
  mv *.so "../../libs/"
  mv lib/* "../../libs/"
  popd

  rm -rf installer AppRun*

  find . -type d -exec chmod 755 {} +
  find . -type f -exec chmod 644 {} +
  find ./bin ./libs -type f -exec chmod 755 {} +

  find . -type f -executable -exec sh -c "file {} | grep -q 'ELF' && patchelf --set-rpath '/opt/$_pkgname/libs:\$ORIGIN' {}" \; 2>/dev/null || true

  find . -type f \( -name "*.desktop" -o -name "*.directory" -o -name "*.menu" \) -exec sed -i "s|RESOLVE_INSTALL_LOCATION|/opt/$_pkgname|g" {} +
  echo "StartupWMClass=resolve" >> "share/DaVinciResolve.desktop"

  for lib in libglib-2.0.so.0 libgio-2.0.so.0 libgmodule-2.0.so.0 libgobject-2.0.so.0; do
    if [ -f "/usr/lib/$lib" ]; then
      rm -f "libs/$lib"
      ln -s "/usr/lib/$lib" "libs/$lib"
    fi
  done
}

package() {
  install -Dm755 "${srcdir}/davinci-control-panels-setup.sh" "${pkgdir}/usr/bin/davinci-control-panels-setup"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/$_pkgname/bin/resolve" "${pkgdir}/usr/bin/davinci-resolve-beta"

  install -d "${pkgdir}/opt/$_pkgname"
  cp -rp squashfs-root/* "${pkgdir}/opt/$_pkgname/"

  cd "${pkgdir}/opt/$_pkgname"

  install -Dm644 share/DaVinciResolve.desktop "${pkgdir}/usr/share/applications/davinci-resolve.desktop"
  install -Dm644 share/blackmagicraw-player.desktop "${pkgdir}/usr/share/applications/blackmagicraw-player.desktop"
  install -Dm644 share/blackmagicraw-speedtest.desktop "${pkgdir}/usr/share/applications/blackmagicraw-speedtest.desktop"

  install -Dm644 graphics/DV_Resolve.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve.png"
  install -Dm644 graphics/DV_Panels.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve-panels-setup.png"

  install -Dm644 share/resolve.xml "${pkgdir}/usr/share/mime/packages/davinci-resolve.xml"
  install -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 share/etc/udev/rules.d/*.rules "${pkgdir}/usr/lib/udev/rules.d/"
}
