# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=beremiz-hg
provides=('beremiz')
conflicts=('beremiz')
_pkgver=1.2
pkgver=${_pkgver}.r1879.e5ddbaf756cb
pkgrel=1
pkgdesc="An integrated development environment for machine automation"
depends=('matiec' 'python2' 'wxgtk3' 'python2-numpy' 'nevow' 'python2-matplotlib' 'python2-lxml' 'python2-pyro3' 'python2-zeroconf' 'matiec' 'gtk-update-icon-cache' 'desktop-file-utils')
builddepends=('mercurial' 'icoutils')
arch=('i686' 'x86_64')
url="https://bitbucket.org/skvorl/beremiz"
license=('GPL2' 'LGPL2')
source=("$pkgname::hg+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "${_pkgver}.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/beremiz"
  mkdir -p "${pkgdir}/usr/share/pixmaps"

  cp -R "${srcdir}/${pkgname}/." "${pkgdir}/usr/share/beremiz"
  rm -r "${pkgdir}/usr/share/beremiz/.hg"

  icotool -x "${srcdir}/${pkgname}/images/brz.ico" -i 4 -o "${pkgdir}/usr/share/pixmaps/beremiz.png" 2>/dev/null
  icotool -x "${srcdir}/${pkgname}/images/poe.ico" -i 1 -o "${pkgdir}/usr/share/pixmaps/PLCOpenEditor.png" 2>/dev/null

  cat > "${pkgdir}/usr/bin/beremiz-service" <<'EOF'
#!/bin/bash
python2 /usr/share/beremiz/Beremiz_service.py "$@"
EOF

  cat > "${pkgdir}/usr/bin/beremiz" <<'EOF'
#!/bin/bash
python2 /usr/share/beremiz/Beremiz.py
EOF

  cat > "${pkgdir}/usr/bin/PLCOpenEditor" <<'EOF'
#!/bin/bash
python2 /usr/share/beremiz/PLCOpenEditor.py
EOF

  cat > "${pkgdir}/usr/share/applications/Beremiz.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=Beremiz IDE
Comment=An integrated development environment for machine automation
Path=/usr/bin
Exec=beremiz
Icon=beremiz
Terminal=false
Categories=Development;IDE;
EOF

  cat > "${pkgdir}/usr/share/applications/PLCOpenEditor.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=PLCOpenEditor
Comment=An integrated development for PLC programs which conform to the IEC-61131-3 and PLCopen XML.
Path=/usr/bin
Exec=PLCOpenEditor
Icon=PLCOpenEditor
Terminal=false
Categories=Development;IDE;
EOF

  find "${pkgdir}/usr/bin" -type f -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/applications" -type f -name *.desktop -exec chmod 644 {} \;
  find "${pkgdir}/usr/share/beremiz" -type f -name *.py -exec chmod 644 {} \;
  find "${pkgdir}/usr/share/pixmaps" -type f -name *.png -exec chmod 644 {} \;
}
