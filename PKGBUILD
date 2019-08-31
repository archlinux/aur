# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=cpu-g-git
_pkgname=${pkgname%-*}
pkgver=0.16.2.1ubuntu0.r44.25478f0
pkgrel=1
pkgdesc="An application that shows useful information about your CPU, Motherboard and some general information about your system."
url="https://github.com/atareao/cpu-g"
license=('GPL3')
arch=('any')
depends=('gtk3' 'gobject-introspection' 'mesa-demos' 'pciutils' 'procps-ng' 'wmctrl'
         'python-gobject' 'python-matplotlib' 'python-cairo' 'python-psutil' 'python-dbus'
         'gtk-update-icon-cache')
makedepends=('git')
provides=('cpu-g')
conflicts=('cpu-g' 'cpu-g-bzr')
source=("git+https://github.com/atareao/${_pkgname}.git"
        "${_pkgname}_changelog"::"https://raw.githubusercontent.com/atareao/${_pkgname}/master/debian/changelog"
        'ubuntu_to_arch.patch')
sha256sums=('SKIP'
            'fd191111fe62f57f5b502ed66475000981c641940ca761718bbead3601824c0f'
            '45d106456f21b28a7d206aa78f00876b27d544e584098691da2c01944fe2b01e')

pkgver() {
  cd "${_pkgname}"
  printf "%s.r%s.%s" "$(head -n 1 "${srcdir}/cpu-g_changelog" | cut -d'(' -f 2 | cut -d')' -f 1 | sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  patch -p1 -i "${srcdir}/ubuntu_to_arch.patch"
}

build() {
  cd "${_pkgname}"
  # Compile translations
  pushd "po"
  for _file in *.po
  do
    msgfmt "${_file//.po}" -o "${_file//.po}.mo"
  done
}

package() {
  cd "${_pkgname}"

  # Copying files
  install -m 755 -d "${pkgdir}/usr/share/${_pkgname}"
  install -m 755 -t "${pkgdir}/usr/share/${_pkgname}" "bin/${_pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/${_pkgname}" "debian/changelog"

  install -m 755 -d "${pkgdir}/usr/share/${_pkgname}/src"
  install -m 644 -t "${pkgdir}/usr/share/${_pkgname}/src" src/*.py

  install -m 755 -d "${pkgdir}/usr/share/${_pkgname}/data/distros"
  install -m 644 -t "${pkgdir}/usr/share/${_pkgname}/data/distros" data/distros/*.png

  install -m 755 -d "${pkgdir}/usr/share/${_pkgname}/data/graphic_card"
  install -m 644 -t "${pkgdir}/usr/share/${_pkgname}/data/graphic_card" data/graphic_card/*.png

  install -m 755 -d "${pkgdir}/usr/share/${_pkgname}/data/icons"
  install -m 644 -t "${pkgdir}/usr/share/${_pkgname}/data/icons" "data/icons/${_pkgname}.png"

  install -m 755 -d "${pkgdir}/usr/share/${_pkgname}/data/logos"
  install -m 644 -t "${pkgdir}/usr/share/${_pkgname}/data/logos" data/logos/*.png

  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "data/${_pkgname}.desktop"

  # Copying icons
  for _size in 14 64 192
  do
    install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
    install -m 644 "data/icons/${_pkgname}_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/cpu-g.png"
  done

  # Install executable
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
