# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Frederick Gnodtke <frederick@gnodtke.net>

pkgname=onivim2-git
pkgver=643.72b120f8
pkgrel=1
pkgdesc='Native, lightweight modal code editor'
arch=('any')
url='https://github.com/onivim/oni2'
license=('commercial')
makedepends=('git' 'esy' 'ragel' 'nodejs' 'wget' 'bzip2' 'esy' 'fontconfig' 'fuse2' 'git' 'glu' 'gtk3' 'harfbuzz'
              'libglvnd' 'libice' 'libpng' 'libsm' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxinerama' 'libxrandr'
              'libxt' 'libxxf86vm' 'm4' 'nodejs' 'ragel' 'wget' 'fuse2')
options=('!strip')
source=("${pkgname}::git+https://github.com/onivim/oni2.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

# set ESY__PREFIX to avoid 5G of dependency cache ending up in ~/.esy
build() {
  cd ${pkgname}
  export ESY__PREFIX="${srcdir}"/esy_cache
  esy install
  esy bootstrap
  esy build
  node install-node-deps.js
  esy x Oni2 -f --checkhealth
  esy create-release
}

check() {
  cd ${pkgname}
  export ESY__PREFIX="${srcdir}"/esy_cache
  esy '@bench' install
  esy '@bench' build
  esy '@bench' run
}

package() {
  install -dm755 "${pkgdir}"/opt/onivim2
  install -dm755 "${pkgdir}"/usr/bin/
  install -Dm644 ${pkgname}/Outrun-Labs-EULA-v1.1.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt

  cd ${pkgname}/_release/
  install -Dm644 Onivim2.AppDir/usr/share/applications/Onivim2.desktop "${pkgdir}"/usr/share/applications/Onivim2.desktop
  install -Dm644 Onivim2.AppDir/usr/share/icons/hicolor/512x512/apps/Onivim2.png "${pkgdir}"/usr/share/pixmaps/Onivim2.png
  cp -Lr Onivim2.AppDir/{AppRun,usr} "${pkgdir}"/opt/onivim2
  cp -r $(find "${srcdir}"/esy_cache -type d -path '*i/*camomile-opam*/share/camomile') "${pkgdir}"/opt/onivim2/usr/share
  ln -s /opt/onivim2/AppRun "${pkgdir}"/usr/bin/Oni2
  # fix permissions
  find "${pkgdir}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}"/opt/onivim2/AppRun \
    "${pkgdir}"/opt/onivim2/usr/bin/{Oni2*,node,rg} \
    "${pkgdir}"/opt/onivim2/usr/lib/*
}
