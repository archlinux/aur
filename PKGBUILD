# Maintainer: Alex Pylypenko <macaquedev@gmail.com>
pkgname=zyzzyva-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Collins Zyzzyva word study/search tool (Qt5) - git build"
arch=('x86_64')
url="https://github.com/macaquedev/zyzzyva"
source=("zyzzyva::git+${url}.git#branch=main")
sha256sums=('SKIP')
license=('GPL-2.0-or-later')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git')
provides=('zyzzyva')
conflicts=('zyzzyva')

pkgver() {
  cd "${srcdir}/zyzzyva"
  git describe --tags --long --always 2>/dev/null | sed 's/^v//;s/-/./g' \
    || echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/zyzzyva"
  qmake-qt5 CONFIG+=no_rpath QMAKE_RPATHDIR= zyzzyva.pro
  make
}

package() {
  cd "${srcdir}/zyzzyva"

  install -d \
    "${pkgdir}/usr/lib/zyzzyva" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps"

  # Main executable (built to bin/)
  install -m755 bin/zyzzyva "${pkgdir}/usr/lib/zyzzyva/zyzzyva"

  # Shared library to public libdir with proper symlinks
  if [[ -f bin/libzyzzyva5.so.1.0.0 ]]; then
    install -Dm755 bin/libzyzzyva5.so.1.0.0 -t "${pkgdir}/usr/lib/"
    ln -sr "${pkgdir}/usr/lib/libzyzzyva5.so.1.0.0" "${pkgdir}/usr/lib/libzyzzyva5.so.1"
    ln -sr "${pkgdir}/usr/lib/libzyzzyva5.so.1.0.0" "${pkgdir}/usr/lib/libzyzzyva5.so"
  fi

  # App resources (app expects these next to the exe via applicationDirPath)
  install -m644 zyzzyva.top "${pkgdir}/usr/lib/zyzzyva/zyzzyva.top"
  cp -a data images "${pkgdir}/usr/lib/zyzzyva/"

  # Launcher wrapper
  cat > "${pkgdir}/usr/bin/zyzzyva" << 'EOF'
#!/bin/sh
exec /usr/lib/zyzzyva/zyzzyva "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/zyzzyva"

  # Desktop entry
  cat > "${pkgdir}/usr/share/applications/zyzzyva.desktop" << 'EOF'
[Desktop Entry]
Name=Zyzzyva
Comment=Word study and search tool
Exec=zyzzyva
Icon=zyzzyva
Terminal=false
Type=Application
Categories=Education;Games;
EOF

  # Icon
  install -m644 images/zyzzyva-128x128-red.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/zyzzyva.png"
}
