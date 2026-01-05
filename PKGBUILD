# Maintainer: Nikola PHILIP-SINIBALDI <contact@nphilipsinibaldi.fr>
pkgname=3utools-bin
pkgver=3.01.003
pkgrel=1
pkgdesc="3uTools - Apple Device Management Tool (binary, repackaged from Debian)"
arch=('x86_64')
url="https://www.3u.com/"
license=('custom')
provides=('3utools')
conflicts=('3utools')

depends=(
  'glibc'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'libxrender'
  'libxinerama'
  'libxcomposite'
  'libxcursor'
  'libxi'
  'libxtst'
  'fontconfig'
  'freetype2'
  'mesa'
)

optdepends=(
  'pipewire-pulse: audio support'
)

source=("https://dl.3u.com/update/v900/dl/linux/com.3u.3utools_${pkgver}_amd64.deb")
sha256sums=('SKIP')

prepare() {
    export GDB_ADD_INDEX=false
    mkdir -p "$srcdir/deb"
    dpkg-deb -x "$srcdir/com.3u.3utools_${pkgver}_amd64.deb" "$srcdir/deb"
}


package() {
  # Copier les fichiers extraits dans $pkgdir
  cp -a "$srcdir/deb/opt" "$pkgdir/"
  install -d "$pkgdir/usr/bin"

  # Wrapper pour lancer l'application
  cat << 'EOF' > "$pkgdir/usr/bin/3utools"
#!/bin/bash
export QTWEBENGINE_DISABLE_SANDBOX=1
export QT_XCB_GL_INTEGRATION=none
export LD_LIBRARY_PATH=/opt/apps/com.3u.3utools/lib:/opt/apps/com.3u.3utools:$LD_LIBRARY_PATH
exec /opt/apps/com.3u.3utools/3uTools "$@"
EOF
  chmod +x "$pkgdir/usr/bin/3utools"

  # Desktop entry
  if [[ -f "$pkgdir/opt/apps/com.3u.3utools/com.3u.3utools.desktop" ]]; then
    install -Dm644 "$pkgdir/opt/apps/com.3u.3utools/com.3u.3utools.desktop" \
      "$pkgdir/usr/share/applications/com.3u.3utools.desktop"
  fi

  # Permissions sûres
  [[ -d "$pkgdir/opt/apps/com.3u.3utools" ]] && chmod -R go-w "$pkgdir/opt/apps/com.3u.3utools"
}
