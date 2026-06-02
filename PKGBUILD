# Maintainer: bobpaul <90864+bobpaul@users.noreply.github.com>
pkgname=stremio-enhanced-git
pkgver=1.1.5
pkgrel=1
pkgdesc="Unofficial Stremio desktop client with plugins and themes (git version)"
arch=('x86_64')
url="https://github.com/REVENGE977/stremio-enhanced"
license=('MIT')
depends=('electron')
makedepends=('git' 'npm')
source=(
	"git+https://github.com/REVENGE977/stremio-enhanced.git"
	"stremio-enhanced.desktop"
)
sha256sums=('SKIP'
            '09c04a9886c2afb115f88dd7c2e74ca438bc089c5f73b76efdcc54652ce70ac6')
provides=("stremio-enhanced=${pkgver}")
conflicts=("stremio-enhanced" "stremio-enhanced-bin")

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags --always --exclude='v20[0-9][0-9]*' | sed 's/^v//;s/\([^-]*\)-\([0-9]*\)-g\([0-9a-f]*\)/\1.r\2.g\3/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  [ -d release-builds ] && rm -f release-builds/*.AppImage || true
}

build() {
  cd "${pkgname%-git}"
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}/usr/lib/stremio-enhanced"
  install -d "${pkgdir}/usr/bin"

  install -Dm644 "${srcdir}/${pkgname%-git}/release-builds/linux-unpacked/resources/app.asar"  "${pkgdir}/usr/lib/stremio-enhanced/app.asar"

  cat << EOF > "${pkgdir}/usr/bin/stremio-enhanced"
#!/bin/bash
exec electron /usr/lib/stremio-enhanced/app.asar "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/stremio-enhanced"

  install -Dm644 stremio-enhanced.desktop "${pkgdir}/usr/share/applications/stremio-enhanced.desktop"
  install -Dm644 "${srcdir}/${pkgname%-git}/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/stremio-enhanced.png"
  install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
