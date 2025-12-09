# Maintainer: Kamil cukrowski <kmilcukrowski@gmail.com>
# Contributor: TechniKris <technikrisdev at gmail dot com>
pkgname=podpisgov
pkgver=1.5.5.4
pkgrel=1
pkgdesc="An application for digital signatures by Poland government."
arch=('any')
url="https://podpis.gov.pl/ui/wp/podpis-gov"
license=('CC-BY-NC-4.0' 'LGPL-3.0-only' 'GPL-3.0-only')
depends=('java8-openjfx' # or 'java-openjfx<21', since JavaFX 21 dropped GTK2
  'libappindicator-gtk2')
source=("${pkgname}.tar.gz::https://pz.gov.pl/PodpisGOV/linux/PodpisGOV.tar.gz")
sha256sums=('0a6f5aa745b12c64be33c62822bd0efed355444c08accf60d2d28ce1a1ee8d1e')

prepare() {
  # Remove bundled Java
  rm -rf "${srcdir}/PodpisGOV/jre"
  # Use system Java
  sed --in-place \
    -e 's/"$SCRIPTPATH\/jre\/bin\/java"/"\/usr\/lib\/jvm\/default-runtime\/bin\/java"/g' \
    "${srcdir}/PodpisGOV/PodpisGOV"
}

mkdir_link() {
  echo "$2 -> $1"
  install -d "$(dirname "$2")"
  ln -s "$opt/$1" "$2"
}

package() {
  # This path is hardocded in the desktop link.
  local opt=/opt/PodpisGOV
  local mydir="${pkgdir}$opt"
  # Create the installation directory
  install -d "${mydir}"
  # Move the extracted content to the target directory
  mv "${srcdir}/PodpisGOV/"* "${mydir}/"
  # Install executable.
  mkdir_link "PodpisGOV" "${pkgdir}/usr/bin/PodpisGOV"
  # Install the desktop file
  mkdir_link "PodpisGOV.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Install the license file
  mkdir_link "Licenses/License-pl.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
