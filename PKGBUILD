# Maintainer: MSOB7YY <namida.coo@gmail.com>
# Contributor: MSOB7YY <namida.coo@gmail.com>

pkgname=namida-bin
pkgver=5.8.5
_buildnumber=260319033
pkgrel=2
pkgdesc="A Beautiful and Feature-rich Music Player, With YouTube & Video Support Built in Flutter"
arch=('x86_64')
url="https://github.com/namidaco/namida-snapshots"
license=('EULA')
depends=('gtk3' 'glib2' 'pango' 'freetype2' 'bzip2' 'libpng' 'brotli' 'fontconfig' 'expat' 'fribidi' 'libepoxy' 'libxi' 'libxext' 'libx11' 'libxcb' 'libxau' 'libxdmcp' 'at-spi2-core' 'dbus' 'systemd-libs' 'libcloudproviders' 'tinysparql' 'json-glib' 'libxml2' 'icu' 'sqlite' 'libxfixes' 'wayland' 'libffi' 'libxcursor' 'libxrender' 'libxdamage' 'libxcomposite' 'libxrandr' 'libxinerama' 'zlib' 'cairo' 'gdk-pixbuf2' 'glycin' 'lcms2' 'libseccomp' 'atk' 'libthai' 'libdatrie' 'pixman' 'harfbuzz' 'graphite' 'util-linux-libs' 'pcre2' 'gcc-libs' 'glibc')
provides=(namida)
conflicts=(namida)
makedepends=()
source=("namida-v${pkgver}-beta.linux.tar.gz::https://github.com/namidaco/namida-snapshots/releases/download/${pkgver}-beta%2B${_buildnumber}/namida-v${pkgver}-beta.linux.tar.gz")
sha256sums=('e5a0dabbe40c75c8a5b6ce0e40600071c0991d439d63df7eb533a4a9d89f65c6')

package() {
  cd "${srcdir}"
  
  # install namida
  install -Dm755 "namida" "${pkgdir}/opt/namida/namida"
  
  # install /bin
  if [ -d "bin" ]; then
    install -dm755 "${pkgdir}/opt/namida/bin"
    for binary in bin/*; do
      if [ -f "$binary" ]; then
        install -m755 "$binary" "${pkgdir}/opt/namida/bin/"
      fi
    done
  fi
  
  # install /lib
  if [ -d "lib" ]; then
    install -dm755 "${pkgdir}/opt/namida/lib"
    for libfile in lib/*; do
      if [ -f "$libfile" ]; then
        install -m755 "$libfile" "${pkgdir}/opt/namida/lib/"
      elif [ -d "$libfile" ]; then
        # For subdirectories in lib
        subdir=$(basename "$libfile")
        install -dm755 "${pkgdir}/opt/namida/lib/${subdir}"
        for subfile in "$libfile"/*; do
          if [ -f "$subfile" ]; then
            install -m755 "$subfile" "${pkgdir}/opt/namida/lib/${subdir}/"
          fi
        done
      fi
    done
  fi
  
  # install /data
  if [ -d "data" ]; then
    install -dm755 "${pkgdir}/opt/namida/data"
    find data -type f -exec install -Dm644 {} "${pkgdir}/opt/namida/{}" \;
    find data -type d -exec install -dm755 "${pkgdir}/opt/namida/{}" \;
  fi
  
  # install desktop file
  install -Dm644 "share/applications/namida.desktop" \
    "${pkgdir}/usr/share/applications/namida.desktop"

  # install metainfo
  install -Dm644 "share/metainfo/namida.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/namida.metainfo.xml"

  # install icons
  install -Dm644 "share/icons/namida.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/namida.png"

  install -Dm644 "share/icons/namida_512.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/namida.png"

  install -Dm644 "share/icons/namida_128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/namida.png"

  install -Dm644 "share/icons/namida_256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/namida.png"
  
  # symlink to bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/namida/namida" "${pkgdir}/usr/bin/namida"
}