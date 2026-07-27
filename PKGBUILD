# Maintainer: Menma736 <mantainer@unrealnetwork.net>
pkgname=unreallauncher-git
pkgver=0.6.18.r309.g8b5caa6
pkgrel=1
pkgdesc="Unreal Launcher, launcher made for UnrealStudios needs"
arch=('any')
url="https://github.com/unh0lyalexzero/Unreal-Launcher"
license=('Apache-2.0')
depends=('electron43' 'nodejs')
makedepends=('git' 'npm' 'jq')
provides=('unreallauncher')
conflicts=('unreallauncher')

source=("unreallauncher-src::git+${url}.git"
        "unreallauncher"
        "unreallauncher.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/unreallauncher-src"
  
  local _version=$(jq -r '.version' package.json)
  
  local _count=$(git rev-list --count HEAD)
  local _hash=$(git rev-parse --short HEAD)
  
  printf "%s.r%s.g%s" "$_version" "$_count" "$_hash"
}

build() {
  cd "${srcdir}/unreallauncher-src"
  npm install --production
}

package() {
  install -d "${pkgdir}/usr/share/unreallauncher"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  cp -r "${srcdir}/unreallauncher-src"/* "${pkgdir}/usr/share/unreallauncher/"
  install -m755 "${srcdir}/unreallauncher" "${pkgdir}/usr/bin/unreallauncher"
  install -m644 "${srcdir}/unreallauncher.desktop" "${pkgdir}/usr/share/applications/unreallauncher.desktop"

  if [ -f "${srcdir}/unreallauncher-src/icon.png" ]; then
    install -m644 "${srcdir}/unreallauncher-src/icon.png" "${pkgdir}/usr/share/pixmaps/unreallauncher.png"
  elif [ -f "${srcdir}/unreallauncher-src/src/assets/icon.png" ]; then
    install -m644 "${srcdir}/unreallauncher-src/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/unreallauncher.png"
  else
    find "${srcdir}/unreallauncher-src" -name "*icon*.png" -o -name "*logo*.png" | head -n 1 | xargs -I {} cp {} "${pkgdir}/usr/share/pixmaps/unreallauncher.png"
  fi
}
