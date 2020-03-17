# Maintainer: peeweep <peeweep at 0x0 dot ee>
# Contributor: Modelmat <modelmat@outlook.com.au>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
# Contributor: David Naramski <david.naramski@gmail.com>
pkgname=ao-git
_pkgname=ao
pkgver=6.9.0.r12.g7533b53
_pkgver=${pkgver%%.r*}
pkgrel=3
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://github.com/klaussinani/ao"
license=('MIT')
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')
makedepends=('npm' 'electron' 'git')
provides=('ao')
conflicts=('ao')
source=(git+${url}.git)
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  npm install
  npx electron-builder --linux deb
}

package() {
  bsdtar -xf "${srcdir}/ao/dist/${_pkgname}_${_pkgver}_amd64.deb" \
    -C "${srcdir}" --include data.tar.xz
  tar xfJ ${srcdir}/data.tar.xz -C ${pkgdir}
  install -d ${pkgdir}/usr/bin/
  ln -s /opt/Ao/ao ${pkgdir}/usr/bin/${_pkgname}
  install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/ao.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  rm -rfv "${pkgdir}/usr/share/icons/hicolor"
}
