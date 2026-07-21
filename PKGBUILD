# Maintainer:  Adam Mlady <adam.mlady@elevated.ovh>

pkgname="astra-music-git"
pkgdesc="Audiophile music player with advanced visualization"
pkgrel=1
pkgver=v0.6.1_beta_218_g32e8648

url="https://github.com/Boof2015/astra"
arch=('x86_64')
license=('GPL-3.0-only')
provides=('astra')
conflicts=('astra')
makedepends=('npm' 'python' 'alsa-lib' 'git')
options=('!strip' '!debug')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/astra"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

prepare() {
  cd "${srcdir}/astra"

  if [[ -v ASTRA_LASTFM_KEY ]] && [[ -v ASTRA_LASTFM_SECRET ]]; then
    cat >"${srcdir}/astra/.env.local" <<EOF
LASTFM_API_KEY=${ASTRA_LASTFM_KEY}
LASTFM_SHARED_SECRET=${ASTRA_LASTFM_SECRET}
EOF
    echo -e "\n[\033[1;32mINFO\033[0m] LastFM API Key and Secret Set\n"
  fi

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
  npm run build
  npx electron-builder --linux --dir
}

package() {
  _basedir="${srcdir}/astra"

  install -Dm644 "${_basedir}/LICENSE" "${pkgdir}/usr/share/licenses/astra/LICENSE"

  install -d "${pkgdir}/opt/astra"
  cp -r "${_basedir}/dist/linux-unpacked/"* "${pkgdir}/opt/astra/"

  install -Dm644 "${_basedir}/assets/logo/astra-logo-static.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/astra.svg"

  install -Dm644 "${srcdir}/astra.desktop" "${pkgdir}/usr/share/applications/astra.desktop"
}
