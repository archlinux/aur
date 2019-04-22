# Maintainer: Modelmat <modelmat@outlook.com.au>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
# Contributor: David Naramski <david.naramski@gmail.com>
pkgname=ao-git
_pkgname=${pkgname%%-git}
pkgver=6.8.0.r6.gf3fe9b0
_pkgver=6.8.0
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://github.com/klaussinani/ao"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator' 'libxtst' 'nss' 'libxss')
makedepends=('npm' 'electron' 'git')
provides=('ao-git')
conflicts=('ao')
source=(git+$url.git) 
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_pkgver() {
  cd $_pkgname
  echo ${git describe --abbrev=0:1}
}

build() {
  cd ao
  npm install
  npx electron-builder --linux deb
}

package() {
  bsdtar -xf "${srcdir}/ao/dist/${_pkgname}_${_pkgver}_amd64.deb" \
   -C "${srcdir}" --include data.tar.xz
  tar xfJ ${srcdir}/data.tar.xz -C ${pkgdir}
  install -d ${pkgdir}/usr/bin/
  ln -s /opt/Ao/ao-app ${pkgdir}/usr/bin/ao
}
