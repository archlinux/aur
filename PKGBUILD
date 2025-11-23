# Maintainer: duzda <duzda@disroot.org>

pkgname=deezer-enhanced-git
_pkgname=deezer-enhanced
# version.r0.g<gitcommit>
pkgver=v1.4.1.r0.g4081513
pkgrel=1
pkgdesc='An unofficial application for Deezer with enhanced features, that is not just an electron wrapper.'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/duzda/deezer-enhanced"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3' 'libxcrypt-compat')
makedepends=('git' 'npm' 'nodejs')
provides=('deezer-enhanced')
conflicts=('deezer-enhanced')
options=('!debug')
source=(git+https://github.com/duzda/deezer-enhanced)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  npm i && npx electron-forge make --targets pacman 
}

package() {
  cd $_pkgname/out/make

  # v0.1.0.r1.g47e2cc3 => 0.1.0
  realversion=`echo $pkgver | sed 's/v//g;s/\([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\)\.\(r[0-9]\+\)\.\(g.*\)/\1.\2.\3/'`
  tar --extract -f $_pkgname-$realversion.pacman

  # Main program
  install -d "${pkgdir}/opt"
  cp -r opt "${pkgdir}"

  # Desktop icon + icons
  install -dm755 "${pkgdir}/usr/"
  cp -r usr "${pkgdir}"

  cd ../..
  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd out/make
  # Post install
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/deezer-enhanced/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Hopefully temp fix
  chmod 755 "${pkgdir}/opt/deezer-enhanced"
  sed -i '2s/.*/Name=Deezer Enhanced/' "${pkgdir}/usr/share/applications/deezer-enhanced.desktop"
  sed -i '7s/.*/StartupWMClass=Deezer Enhanced/' "${pkgdir}/usr/share/applications/deezer-enhanced.desktop"
  sed -i '9s/.*/Categories=Audio;AudioVideo;/' "${pkgdir}/usr/share/applications/deezer-enhanced.desktop"

  # SUID chrome-sandbox for Electron 5+
  chmod 4755 "${pkgdir}/opt/deezer-enhanced/chrome-sandbox" || true
}
