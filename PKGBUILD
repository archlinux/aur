# Maintainer: Your Name <your@email.com>
# Contributor: PerfLite

pkgname=github-desktop-mod
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop GitHub repository manager — an alternative to GitHub Desktop for Linux"
arch=('any')
url="https://github.com/PerfLite/Github_DesktopMod"
license=('custom')
depends=(
  'python'
  'python-pywebview'
  'python-requests'
  'python-gitpython'
  'python-watchdog'
  'python-gobject'
  'webkit2gtk-4.1'
  'git'
)
makedepends=('git')
source=("${pkgname}::git+https://github.com/PerfLite/Github_DesktopMod")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo "$pkgver"
}

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r app.py github_client.py requirements.txt ui "${pkgdir}/usr/share/${pkgname}/"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash
exec /usr/bin/python "/usr/share/${pkgname}/app.py"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=GitHub Desktop Mod
Comment=Manage GitHub repositories
Exec=${pkgname}
Icon=/usr/share/${pkgname}/ui/github-64.png
Terminal=false
Categories=Development;Git;
StartupNotify=true
EOF
}
