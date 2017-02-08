# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gmail.com>
#
pkgname=epsxe
_pkgname=ePSXe
pkgver=2.0.5
pkgrel=9
pkgdesc="Enhanced PSX emulator"
url="http://epsxe.com"
arch=('i686' 'x86_64')
#depends=(gtk2 sdl_ttf ncurses5-compat-libs libtinfo-5 libcurl-compat)
depends_i686+=(gtk3 sdl_ttf libtinfo libcurl-compat)
depends_x86_64+=(lib32-gtk3 lib32-libxt lib32-sdl_ttf lib32-libtinfo lib32-libcurl-compat)
#depends=(gtk3 sdl_ttf ilib32-libtinfo lib32-libcurl-compat)
license=('unknown')
install=${pkgname}.install
options=(!strip)
source=(${pkgname}.desktop ${pkgname}.png ${pkgname}.sh)
md5sums=('aeb34e2ca34f968630ca133ea821c61c'
         'eb0c46b8ae1355c589792f6be1835e47'
         '071c43c1cb8f6b6470b7af60ad69247a')
#if [[ $CARCH == "x86_64" ]]; then
#    source+=("http://www.epsxe.com/files/ePSXe${pkgver//./}linux_x64.zip")
#    md5sums+=('79fefeb4bff26bf1d374befb35b390df')
#else
    source+=("http://www.epsxe.com/files/ePSXe${pkgver//./}linux.zip")
    md5sums+=('3e1976822eb260722b31c9f24cb1d6e1')
#fi

package () {
  #srcpath="${srcdir}/${_pkgname}${pkgver//./}linux"
  binary="${_pkgname}"
 # if [[ $CARCH == "x86_64" ]]; then
  #    srcpath+="_x64"
 #     binary="${pkgname}_x64"
 # fi

  #cd "${srcpath}"
  cd "${srcdir}"
#  install -m775 -g games -d "${pkgdir}/opt/${pkgname}/"{plugins,bios,memcards,cfg,cdimages,cheats,patches,sstates,snap}
  install -d "${pkgdir}"/usr/{share/doc/"${pkgname}",lib}

  find docs -name 'e???e_*.txt' -execdir install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} \{\} +
  #  find . -name '*.cht' -execdir "install -Dm 644 -t \${pkgdir}/opt/${pkgname}/${pkgver}/cheats\"" \{\} +


  install -Dm 755 "${binary}" "${pkgdir}/opt/${pkgname}/${pkgname}"
#  install -Dm 644 keycodes.lst "${pkgdir}/opt/${pkgname}/keycodes.lst"

  cd "${srcdir}"
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/epsxe.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${srcdir}/epsxe.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  ln -sf "$HOME/.${pkgname}rc" -T "${pkgdir}/opt/${pkgname}/.${pkgname}rc"

  # libtinfo and ncurses crap
  ln -s /usr/lib32/libncursesw.so.6 "$pkgdir"/opt/"$pkgname"/libncurses.so.5
  ln -s /usr/lib32/libtinfo.so.6 "$pkgdir"/opt/"$pkgname"/libtinfo.so.5
}
