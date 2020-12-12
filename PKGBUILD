#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Old maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: perpetrator
pkgname=indigo-renderer
pkgver=4.2.28
_package_src_dir=IndigoRenderer_x64_v${pkgver}
_pkgver_blendigo=4.3.0-d170191-master
#_blender=$(blender -v | head -n1 | cut -f2 -d ' ')
#_blender=$(expac -S "%v" blender|egrep -o [[:alnum:]]{1}.[[:alnum:]]{2})
_blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')
pkgrel=1
pkgdesc="Physically-based unbiased render engine"
arch=('x86_64')
url="http://www.indigorenderer.com/"
license=('custom')
depends=('qt5-base')
backup=('opt/indigo/inifile.xml')
options=(docs)
install=indigo.install
source=("http://downloads.indigorenderer.com/dist/beta/IndigoRenderer_x64_v${pkgver}.tar.gz" \
        "indigo-renderer.desktop" "indigo-renderer.png" "indigo.sh" "indigo_console.sh" \
        "http://downloads.indigorenderer.com/dist/exporters/blendigo/blendigo-${_pkgver_blendigo}.zip" )
sha256sums=('ea0af256980efab77b305eff9acdd1ae39abb9c7254e38d9ac1f2fb234235336'
            '9b80f93d7c67e2d5e46212946fe91cbd47bd0f4827db97dc827996a9d4ce7b3c'
            '16faf2d3bab734672d76f659c05d6f1b6d4da640fa85e48d531f580bc34202fa'
            '3102c1c066b3cd35201f9594379ac5d92d9bc97018dd0dd4a0b9adac6741d840'
            'd64a972e2919446ce1e616699124bd227392a934cf35284e1f71a9ce7588f5dc'
            'f8465233c3c1458af762c62716718a715f87d4d9630aae27ec3f92993d6771b5')
b2sums=('c2532a9a2586a6e8d353b99ddb2da8e77ef24367ff75577bf1194994b1268f1412caf8f12237794ada8ee07c7b8e240bd3efc9aa92279e46b44a69e472c2a247'
        '08c06dcf4a2444ce25600640594287fa3c529f571c133b6e59b30f5c951bb4bbac40f8ff65ab07fe76528152b2b2483f92a30dc162bd86a8128453ac2178ce5c'
        '421a5be6a7f76ecfa1679822cded4a0315ad896d869df721a1cc72950f4845db92343d03f6af823cd9542ac1e285a5f24fcffc27f9b3475ee83f57b85013c321'
        '6badf75877618c30f9a3fba1024bfb7fe40630f3bb28da5f7b0e419671cb5c90462cd79725aacea0d3b1c06a30b345a1b012c541b4b0c42296635be0914254a1'
        'bc410f3b287408cf3cf60743e4a2c5483addb938891378d1c240eaec1e63f2f3bad93f641c271b366de7eef9b84a94dda78376e8deed3f530d0dc2e3232fef7a'
        '46c0cd7c7c8a7ed47b3478befbb8598b032057cffb862aefd28ef7a1183342b51e1d34bbce1d03bb7bb7be854f48c824cfddfb362c23feae9ecb7e5927d97df5')


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
  cp -a indigo_exporter "$pkgdir/usr/share/blender/${_blender}/scripts/addons/"
  
  # create system wide writable directory for materials cache
  install -d -m777 "${pkgdir}/opt/${pkgname}/materials"

  # create system wide writable directory for opencl shaders cache
  install -d -m777 "${pkgdir}"/opt/${pkgname}/cache/program_cache

  # create system wide writable settings file
  install -m666 ${_package_src_dir}/default_settings.xml "${pkgdir}"/opt/${pkgname}/settings.xml

  # create system wide writable renders folder
  install -d -m777 "${pkgdir}"/opt/${pkgname}/renders
}

# vim:set ts=2 sw=2 et:
