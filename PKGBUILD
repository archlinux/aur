# Maintainer: bartus <aur \at bartus.33mail.com>
# Old maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: perpetrator
pkgname=indigo-renderer
pkgver=4.0.66
_package_src_dir=IndigoRenderer_x64_v${pkgver}
_pkgver_blendigo=4.0.10
_blender=$(blender -v | head -n1 | cut -f2 -d ' ')
pkgrel=2
pkgdesc="Physically-based unbiased render engine"
arch=('x86_64')
url="http://www.indigorenderer.com/"
license=('custom')
depends=('libpng12')
backup=('opt/indigo/inifile.xml')
options=(docs)
install=indigo.install
source=("http://downloads.indigorenderer.com/dist/beta/IndigoRenderer_x64_v${pkgver}.tar.gz" \
        "indigo-renderer.desktop" "indigo-renderer.png" "indigo.sh" "indigo_console.sh" \
        "http://downloads.indigorenderer.com/dist/exporters/blendigo/blendigo-${_pkgver_blendigo}.zip" )
md5sums=('c6fe27e58f027166a81707835ef08ee5'
         '3d1ee12344502bda3a41f496e97a4cf4'
         '19fde0fa8b9151f7d2aa56710a1296d6'
         'd45b9ffc8d51e949ab73abcb598acb28'
         '169f8b7bcb0174de0a9c25a0f340b661'
         '8d5b9e67a3e035882de9fce285ff50b2')


package() {
  cd "${srcdir}"
  install -d -m755  "${pkgdir}/opt/${pkgname}"

  cp -aT "$_package_src_dir" "$pkgdir/opt/${pkgname}"
 
  # make system wide writable log file
  touch "$pkgdir"/opt/${pkgname}/log.txt
  chmod 666 "$pkgdir"/opt/${pkgname}/log.txt

  # documentation
#  install -d -m755 "$pkgdir"/usr/share/doc/${pkgname}
#  mv "$pkgdir/opt/${pkgname}/Indigo\ Manual.pdf" -t "$pkgdir"/usr/share/doc/${pkgname}

  # install scripts
  install -D -m755 indigo.sh "$pkgdir"/usr/bin/indigo
  install -D -m755 indigo_console.sh "$pkgdir"/usr/bin/indigo_console

  # install desktop file and icon
  install -Dm644 ${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${pkgname}.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png

  # install the license
  install -d -m755 "$pkgdir"/usr/share/licenses/${pkgname}
  install -m644 "$pkgdir"/opt/${pkgname}/license.txt "$pkgdir"/usr/share/licenses/${pkgname}/license.txt

  # install blendigo
  install -d -m755 "$pkgdir/usr/share/blender/${_blender}/scripts/addons/"
  cp -a indigo "$pkgdir/usr/share/blender/${_blender}/scripts/addons/"
  
  # create system wide writable directory for materials cache
  install -d -m777 "${pkgdir}/opt/${pkgname}/materials"
}

# vim:set ts=2 sw=2 et:
