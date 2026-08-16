# Maintainer: Mike O'Brien <mike at obrien dot page>
pkgname=yesterdays-desktop-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Yesterdays Desktop application"
arch=('x86_64')
url="https://github.com/MapRVA/yesterdays-desktop"
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Yesterdays.Desktop_${pkgver}_amd64.deb")
sha256sums=('4c2520c8c4865b2d296daa5bb43fa2c889feef80943aa57e85894513f7cdcdc4')

prepare() {
  # Extract the data archive inside the .deb package (handles .xz, .gz, .zst, etc.)
  local data_archive
  data_archive=$(find "${srcdir}" -maxdepth 1 -name 'data.tar.*' -print -quit)

  if [ -n "${data_archive}" ]; then
    bsdtar -xf "${data_archive}" -C "${srcdir}"
  else
    echo "Error: Could not find data archive inside .deb"
    return 1
  fi
}

package() {
  # Copy extracted directory trees independently if they exist
  if [ -d "${srcdir}/usr" ]; then
    cp -dr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
  fi

  if [ -d "${srcdir}/opt" ]; then
    cp -dr --no-preserve=ownership "${srcdir}/opt" "${pkgdir}/"

    # Ensure binary is symlinked into PATH if placed under /opt
    if [ -f "${pkgdir}/opt/Yesterdays.Desktop/yesterdays-desktop" ]; then
      install -d "${pkgdir}/usr/bin"
      ln -s "/opt/Yesterdays.Desktop/yesterdays-desktop" "${pkgdir}/usr/bin/yesterdays-desktop"
    fi
  fi
}
