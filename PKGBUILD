# Maintainer:  Adam Mlady <adam.mlady@elevated.ovh>

pkgname="astra-music-git"
pkgdesc="Audiophile music player with advanced visualization"
pkgrel=1
pkgver="v0.6.0_beta_18_g85efb13"

url="https://github.com/Boof2015/astra"
arch=('x86_64')
license=('GPL-3.0-only')
provides=('astra')
conflicts=('astra')
depends=('fuse2')
makedepends=('npm' 'base-devel' 'python' 'alsa-lib')
options=('!strip' '!debug')
source=("git+$url.git")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/astra"

  npm install

  cat >"${srcdir}/astra.desktop" <<EOF
[Desktop Entry]
Name=Astra
Comment=Audiophile music player with advanced visualization
Exec=/opt/astra/astra %U
Icon=astra
Type=Application
Categories=Audio;
Terminal=false
StartupWMClass=astra
EOF
}

build() {
  cd "${srcdir}/astra"
  npm run build && npx electron-builder --linux --dir
}

package() {
  basedir="${srcdir}/astra"

  install -Dm644 "${basedir}/LICENSE" "${pkgdir}/usr/share/licenses/astra/LICENSE"

  install -d "${pkgdir}/opt/astra"
  cp -r "${basedir}/dist/linux-unpacked/"* "${pkgdir}/opt/astra/"

  install -Dm644 "${basedir}/assets/logo/astra-logo-static.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/astra.svg"

  install -Dm644 "${srcdir}/astra.desktop" "${pkgdir}/usr/share/applications/astra.desktop"
}
