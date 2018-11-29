# Maintainer: Nick Bulischeck <nbulisc@g.clemson.edu>
# Contributor: Weston Belk <westonb@g.clemson.edu>

pkgname=tyton-dkms-git
_pkgbase=tyton
pkgver=1
pkgrel=2
pkgdesc="Linux Kernel-Mode Rootkit Hunter for 4.4.0-31+."
arch=('i686' 'x86_64')
url="https://github.com/nbulischeck/tyton/"
license=('GPL3')
depends=('dkms' 'linux-headers' 'gcc' 'make')
source=("git+https://github.com/nbulischeck/tyton.git")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgbase}"

  make DESTDIR="${pkgdir}"
}

package() {
  cd "${srcdir}/${_pkgbase}"
  
  # Install
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" clean

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "packaging/aur/dkms.conf"

  # Copy source files
  INSTALLDIR="${pkgdir}/usr/src/${_pkgbase}-${pkgver}.${pkgrel}"
  find . -type f \
    \( -path ./notify \) -prune -o \
    \( -path ./images \) -prune -o \
    \( -path ./.git \) -prune -o \
    -exec install -Dm644 "{}" "${INSTALLDIR}/{}" \;

  # Move dkms up
  mv "${INSTALLDIR}/packaging/aur/dkms.conf" "${INSTALLDIR}/dkms.conf"
}
