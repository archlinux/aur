# Maintainer: Monika Crichton <monika+aur@mcrichton.net>
pkgname=celeste-bin
pkgver=1.4.0.0
pkgrel=2
pkgdesc="Super-tight hand-crafted 2D platformer"
arch=("x86_64")
url="http://www.celestegame.com/"
license=('custom:commercial')
depends=("sdl2")
makedepends=()
optdepends=("olympus: Mod Manager for Celeste")
provides=("celeste")
conflicts=("celeste")
source=("celeste-linux.zip::celeste://celeste-linux.zip" "celeste.desktop")
sha256sums=('ab8827892820d345378f94d9a6f2199d29aa03208777fa4e540b90deb0d8100b'
            '1431f41ca122fad2fa26a2e0ff7eff5cb2b55115f1e430d11a36f60f8bfa2954')
noextract=('celeste-linux.zip')

DLAGENTS+=("celeste::/usr/bin/echo Could not find %u. Please ensure that you have downloaded a copy of Celeste and that it is located in \"$(pwd)\".")

prepare() {
	mkdir -p "${srcdir}/celeste-linux"
	bsdtar -xf "celeste-linux.zip" -C "${srcdir}/celeste-linux"
	cd "${srcdir}/celeste-linux"
	sed -i -e '/^cd /  s@`dirname "$0"`@$(dirname $(realpath $0))@' Celeste
}

package() {
  DESTDIR="${pkgdir}/opt/${pkgname}"

  install -dm775 "${DESTDIR}"
  cp -R "${srcdir}"/celeste-linux/* "${DESTDIR}"
  
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/Celeste" "${pkgdir}/usr/bin/celeste"

  chgrp -R games "${DESTDIR}"
  chmod o-w -R "${DESTDIR}"
  chmod g+w -R "${DESTDIR}"

  install -D "${srcdir}/celeste-linux/Celeste.png" "${pkgdir}/usr/share/pixmaps/celeste.png"
  install -D celeste.desktop "${pkgdir}/usr/share/applications/celeste.desktop"  
}
