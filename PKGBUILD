# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=gigalomania
pkgver=1.0.1
pkgrel=1
pkgdesc="2D real time strategy game that is a clone of Mega-Lo-Mania"
arch=('i686' 'x86_64')
url="http://homepage.ntlworld.com/mark.harman/comp_gigalomania.html"
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
source=(${pkgname}-${pkgver}::http://launchpad.net/gigalomania/trunk/${pkgver}/+download/gigalomaniasrc.zip)
sha512sums=('255eb3d5ce566fbff42c1075c850cd2c7e2490f91bcf97954aa36ad9fb8bb787c1e817e682b0954e53c758c79ec76c431bedbf37b8197764ee40b48d09e75bcc')

build() {
  cd ${srcdir}/${pkgname}src

  # patch .desktop files
  sed 's#/opt/gigalomania/gigalomania#/usr/bin/gigalomania#g' -i gigalomania.desktop
  sed 's#/opt/gigalomania/#/usr/share/gigalomania/#g' -i gigalomania.desktop

  make
}

package() {
  cd "${srcdir}/${pkgname}src"
  mkdir -p ${pkgdir}/usr/bin/

  make install DESTDIR="${pkgdir}"

  #chgrp users ${pkgdir}/opt/gigalomania/{gfx,islands,music,sound}

  # install icon
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
  install -Dm 644 gigalomania64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gigalomania64.png"
  install -Dm 644 gigalomania64.png "${pkgdir}/usr/share/pixelmaps/gigalomania64.png"

  echo -e "#!/bin/sh\ncd /opt/${pkgname}\n./${pkgname}" > "${pkgdir}/usr/bin/${pkgname}" 
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}

