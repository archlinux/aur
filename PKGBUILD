# Contributor: grimi <grimi at poczta dot fm>

pkgname=mime-archpkg
pkgver=0.3.5.2
pkgrel=1
pkgdesc="mime type for archlinux packages"
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
depends=('shared-mime-info' 'gtk-update-icon-cache')
makedepends=('librsvg' 'imagemagick')
source=($pkgname archpkg-{hicolor,gnome,Tango,oxygen,nuoveXT2,Faenza,Faience,NITRUX,Numix,breeze,FaenzaFlattr2-Zephyr,elementary}.svgz)
md5sums=('1ff726f4e5e0dc7115aafb5f1b691455'
         'ca7ce5e44d24dfd584586ed730c2bd04'
         'f43f188fba6d3fb87ada25f3b213b0b9'
         'e4a31892492bedc9b5f16e6af7d4b33e'
         '422e489fe7228f351b7b141b7f3c5f38'
         'e043e732c37b46cd298c848b2dc27680'
         'c8bf1a978c2389cca649029167b94e39'
         'ce4f6e2ab892776e4a921d88c29a9fc1'
         'ef7d2bf5094388a7f6400811e56c4ccb'
         '1f3b9609f68415f1e7bcad3a144555e1'
         'ad3ea0380f0ec369fc0db5adc8181c63'
         'c08b56cffe6d3604627868c058e0d76e'
         '97e55cf040d5a4f2984929922baf468a')


# comment that variable to install all icons
# normally install for themes that already installed
INSTALLED_ONLY=1



package() {

  # function to make things shorter
  put_icons() {
    # args: $1 = icon name(nopref:archpkg, nosuff:.svgz) , $2 = sizes
    # args: $3 != [1,2]:YxY/folder; = 1:folder/Y , 2:special folder (size:folder_name)
    # args: $4 = 1:svg suff, else png, $5 = 1:no scalable folder
    local i iname="application-x-archpkg" ipath="${pkgdir}/usr/share/icons" suff="png"
    if [[ ${4} == 1 ]]; then suff="svg"; fi
    if [[ -z ${INSTALLED_ONLY} ]] || [[ -n ${INSTALLED_ONLY} && -f /usr/share/icons/${1}/index.theme ]]; then
      if [[ $5 != 1 ]]; then
        rsvg-convert -o archpkg.svg -f svg archpkg-${1}.svgz
        if [[ ${3} == 1 ]]; then
          install -Dm644 archpkg.svg "${ipath}"/${1}/mimetypes/scalable/${iname}.svg
        else
          install -Dm644 archpkg.svg "${ipath}"/${1}/scalable/mimetypes/${iname}.svg
        fi
      fi
      for i in ${2}; do
        [[ ${3} != 2 ]] && local x=${i} || local x=${i%:*}
        #rsvg-convert -w ${x} -h ${x} -f ${suff} -o archpkg.${suff} archpkg-${1}.svgz
        convert -resize ${x}x${x} -background none archpkg-${1}.svgz archpkg.${suff}
        if [[ ${3} == 1 ]]; then
          install -Dm644 archpkg.${suff} "${ipath}"/${1}/mimetypes/${x}/${iname}.${suff}
        elif [[ ${3} == 2 ]]; then
          install -Dm644 archpkg.${suff} "${ipath}"/${1}/mimetypes/${i#*:}/${iname}.${suff}
        else
          install -Dm644 archpkg.${suff} "${ipath}"/${1}/${x}x${x}/mimetypes/${iname}.${suff}
        fi
      done
    fi
  }

  # mime type
  install -Dm644 ${pkgname} "${pkgdir}"/usr/share/mime/packages/archpkg.xml
  # icons
  put_icons hicolor '16 22 24 32 48 64 72 96 128 192 256'
  put_icons gnome '16 22 24 32 48 256'
  put_icons Tango '16 22 24 32 48 64 96 128 256'
  put_icons oxygen '16 22 24 32 48 64 128 256'
  put_icons nuoveXT2 '16 22 24 32 36 48 64 72 96 128'
  put_icons Faenza '16 22 24 32 48 64 96' 1
  put_icons Faience '16 22 24 32 48 64 96' 1
  put_icons NITRUX '16 22 24 32' 1
  put_icons Numix '16 22 24 32 64 128 256' 0 1
  put_icons breeze '16 22 32 64' 1 1
  put_icons FaenzaFlattr2-Zephyr ''
  put_icons elementary '16 24 32 48 64 128' 1 1 1
}


# vim: set et sts=2 sw=2 ts=2 :

