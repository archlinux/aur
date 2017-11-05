# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=lighttable-git
_pkgname="${pkgname%-git}"
_name=LightTable
pkgver=0.8.1.r49.g5db6b70
_pkgver=${pkgver/%.r*/}
pkgrel=1
pkgdesc='Next generation code editor and IDE with instant feedback.'
arch=('x86_64' 'i686')
url='http://lighttable.com/'
license=('MIT')
conflicts=('lighttable-bin')
depends=('alsa-lib' 'gconf' 'gtk2' 'java-environment' 'libnotify' 'nodejs' 'nss' 'libxtst')
makedepends=('npm' 'leiningen')
provides=('lighttable')
source=("git://github.com/LightTable/LightTable.git"
        "lighttable.desktop")
sha256sums=('SKIP'
            '3ed905cba2906c138016e53d9b9327bf933c8e96f649b50b3a479ec32045d1e1')

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_name}"
  script/build.sh
}

package() {
  # Place files
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${srcdir}/${_name}/builds/${_pkgname}-${_pkgver}-linux/"* "${pkgdir}/usr/lib/${_pkgname}"
  
  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_name}" "${pkgdir}/usr/bin/${_pkgname}"
  
  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_name}/deploy/core/img/lticon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  # Place license files
  for license in "LICENSE" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/${license}" "${pkgdir}/usr/share/licenses/${_pkgname}/${license}"
    rm "${pkgdir}/usr/lib/${_pkgname}/${license}"
  done
}

