# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Frederick Gnodtke <frederick@gnodtke.net>

pkgname=onivim2-git
pkgver=554.f4cd1e28
pkgrel=1
pkgdesc='Native, lightweight modal code editor'
arch=('any')
url='https://github.com/onivim/oni2'
license=('comercial')
makedepends=('git' 'esy' 'ragel' 'nodejs')
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
  ESY__PREFIX=${srcdir}/esy_cache esy install
  ESY__PREFIX=${srcdir}/esy_cache esy bootstrap
  ESY__PREFIX=${srcdir}/esy_cache esy build
  ESY__PREFIX=${srcdir}/esy_cache esy x Oni2 -f --checkhealth
  ESY__PREFIX=${srcdir}/esy_cache esy create-release
}

check() {
  cd ${pkgname}
  ESY__PREFIX=${srcdir}/esy_cache esy '@bench' install
  ESY__PREFIX=${srcdir}/esy_cache esy '@bench' build
  ESY__PREFIX=${srcdir}/esy_cache esy '@bench' run
}

package() {
  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"

  cd ${pkgname}/_release/
  install -D -m 644 Onivim2.AppDir/usr/share/applications/Onivim2.desktop "${pkgdir}/usr/share/applications/Onivim2.desktop"
  install -D -m 644 Onivim2.AppDir/usr/share/icons/hicolor/512x512/apps/Onivim2.png "${pkgdir}/usr/share/pixmaps/Onivim2.png"
  cp -ar Onivim2.AppDir "${pkgdir}/opt/onivim2"
  cp -ar linux/bin "${pkgdir}/opt/onivim2/usr/"
  ln -s "${pkgdir}/opt/onivim2/AppRun" "${pkgdir}/usr/bin/Oni2"
}
