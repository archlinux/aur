pkgname=webcord-git-screenshare
pkgver=4.1.1.git.e5c2ded
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron (screenshare-with-audio branch)."
arch=("any")

_repo="WebCord"
_author="SpacingBat3,kakxem"

url="https://github.com/kakxem/WebCord.git"
license=('MIT')
optdepends=(
  'xdg-desktop-portal-impl: Screen share UI and other portals under Wayland'
  'pipewire: WebRTC screen sharing under Wayland'
  'org.freedesktop.secrets: Encryption using stored key in the secret service'
)
makedepends=('nodejs-lts-hydrogen' 'npm' 'git' 'python3' 'sed')
provides=("${pkgname}")
conflicts=("${pkgname}" "webcord-git" "webcord")
#source=(
#  "${pkgname}::git+https://github.com/kakxem/WebCord.git#commit=e5c2ded3ee53b6397736a262bbec5d253375b745"
#  "https://github.com/SpacingBat3/WebCord/releases/download/v4.1.1/webcord-4.1.1-1.x86_64.rpm"
#)
source=(
  "${pkgname}::git+https://github.com/kakxem/WebCord.git#branch=feature/screenshare-with-audio"
  "https://github.com/SpacingBat3/WebCord/releases/download/v4.1.1/webcord-4.1.1-1.x86_64.rpm"
)
md5sums=(
  'SKIP'
  '8b73858325a0ffcc6dabf10c80f54302'
)

prepare() {
  python3 -c "\
import json

pj = json.load(open('${pkgname}/package.json', 'r'))
pj['devDependencies']['electron'] = '21.0.0'
del pj['scripts']['prepare']
json.dump(pj, open('${pkgname}/package.json', 'w'))"
}

build() {
  cd "${pkgname}"
  npm --no-audit --no-fund i --package-lock-only
  npm --no-audit --no-fund ci
  npm --no-audit --no-fund run package
}

package() {
  sed -i 's/Name=WebCord/Name=WebCord-git/g' "${srcdir}/usr/share/applications/webcord.desktop"
  sed -i 's/Exec=webcord/Exec=webcord-git/g' "${srcdir}/usr/share/applications/webcord.desktop"
  sed -i 's/Icon=webcord/Icon=\/usr\/share\/pixmaps\/webcord\.png/g' "${srcdir}/usr/share/applications/webcord.desktop"
  mv "${srcdir}/usr/share/applications/webcord.desktop" "${srcdir}/usr/share/applications/webcord-git.desktop"
  mkdir -p "${pkgdir}/usr/"
  mv "${srcdir}/usr/share/" "${pkgdir}/usr/"

  mkdir -p "${pkgdir}/opt/"
  mv "${srcdir}/${pkgname}/out/devel/WebCord-linux-x64/" "${pkgdir}/opt/webcord-git"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "${pkgdir}/opt/webcord-git/webcord" "${pkgdir}/usr/bin/webcord-git"
  chmod +x "${pkgdir}/usr/bin/webcord-git"
}

