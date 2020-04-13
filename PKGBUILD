# Contributor: mortzprk <mortz.prk@gmail.com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=gtk-theme-equinox
pkgver=1.50
pkgrel=4
pkgdesc="Gtk theme for equinox engine"
url="http://gnome-look.org/content/show.php?content=140449"
license=('GPL2')
arch=('any')
depends=('gtk-engine-equinox')
optdepends=('faenza-icon-theme: icons designed for this theme'
            'lib32-gtk-engine-equinox: for 32 bits applications')
#sha256sums=('32b3cedfbc27e466289aa8a0b6d1f3f964a553956d94bf267bd42c749691823c')
#noextract=("140449-equinox-themes-${pkgver}.tar.gz")

package() {
  local _filename=140449-equinox-themes-${pkgver}.tar.gz

  cd ${srcdir}

  curl -L -o ${_filename} $(curl -s -X POST https://www.gnome-look.org/dl \
    -d 'file_id=1460966672&file_type=application/x-gzip&file_name=140449-equinox-themes-1.50.tar.gz&file_size=507470&project_id=1078580' | \
    grep -o 'https://.*tar.gz')

  echo "32b3cedfbc27e466289aa8a0b6d1f3f964a553956d94bf267bd42c749691823c ${_filename}" | sha256sum --check --status
  if [ $? -ne 0 ]; then
    echo "${_filename}: bad checksum, exiting"
    exit 1
  fi

  mkdir -p "${pkgdir}/usr/share/themes"
  tar xzf ${_filename} -C "${pkgdir}"/usr/share/themes

  mv "${pkgdir}/usr/share/themes/Equinox Evolution.crx" \
    "${pkgdir}/usr/share/themes/Equinox Evolution"

  for theme in Dawn Dusk Midnight; do
    mv "${pkgdir}/usr/share/themes/Equinox Evolution ${theme}.crx" \
      "${pkgdir}/usr/share/themes/Equinox Evolution ${theme}"
  done;

  cd "${pkgdir}/usr/share/themes/"
  find -type f -name "gtkrc" -exec sed -i 's/#include/include/g' {} \;

  chown -R root:root "${pkgdir}/usr/share/themes"
}
