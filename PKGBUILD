# Maintainer: duzda <duzda666@gmail.com>

pkgname=deezer-enhanced-git
_pkgname=deezer-enhanced
pkgver=v0.2.0.r0.g57b61c6
pkgrel=1
pkgdesc='An unofficial application for Deezer with enhanced features, that is not just an electron wrapper.'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/duzda/deezer-enhanced"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
makedepends=('git' 'npm' 'nodejs' 'yarn')
provides=('deezer-enhanced')
conflicts=('deezer-enhanced')
source=(git+https://github.com/duzda/deezer-enhanced)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  yarn && yarn build:pacman
}

package() {
  cd $_pkgname/dist

  # v0.1.0.r1.g47e2cc3 => 0.1.0
  realversion=`echo $pkgver | sed 's/v//g;s/\([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\)\.\(r[0-9]\+\)\.\(g.*\)/\1.\2.\3/'`
  tar --extract -f $_pkgname-$realversion.pacman

  # Main program
  install -d "${pkgdir}/opt"
  cp -r opt "${pkgdir}"

  # Desktop icon + icons
  install -dm755 "${pkgdir}/usr/"
  cp -r usr "${pkgdir}"

  cd ..
  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd dist
  # Post install
  install -d "$pkgdir/usr/bin"
  ln -sf "${pkgdir}/opt/Deezer Enhanced/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # SUID chrome-sandbox for Electron 5+
  chmod 4755 "${pkgdir}/opt/Deezer Enhanced/chrome-sandbox" || true
}
