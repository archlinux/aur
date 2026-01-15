# Maintainer: MSOB7YY <namida.coo@gmail.com>
# Contributor: MSOB7YY <namida.coo@gmail.com>

pkgname=namida-bin
pkgver=5.6.5
_buildnumber=260114196
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
sha256sums=('SKIP')

package() {
  cd "${srcdir}"
  
  # install namida
  if [ -f "namida" ]; then
    install -Dm755 "namida" "${pkgdir}/opt/namida/namida"
  fi
  
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
  if [ -f "share/applications/namida.desktop" ]; then
    install -Dm644 "share/applications/namida.desktop" \
      "${pkgdir}/usr/share/applications/namida.desktop"
  fi
  
  # install icon
  if [ -f "share/pixmaps/namida.png" ]; then
    install -Dm644 "share/pixmaps/namida.png" \
      "${pkgdir}/usr/share/pixmaps/namida.png"
  fi
  
  # symlink to bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/namida/namida" "${pkgdir}/usr/bin/namida"
}