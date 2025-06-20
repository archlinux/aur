_pkgbase=gigabyte-laptop-wmi
pkgname=${_pkgbase}-dkms-git
pkgver=0.1.0.r0.ge4279c2
pkgrel=2
pkgdesc="Linux kernel module for Gigabyte laptops to interact with the embedded controller."
url="https://github.com/tangalbert919/gigabyte-laptop-wmi"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("${pkgname}::git+https://github.com/tangalbert919/gigabyte-laptop-wmi.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {
  cd "$srcdir/${pkgname}"
  local install_dir="${pkgdir}"/usr/src/${_pkgbase}-${pkgver}

  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}"/dkms.conf

  install -Dm644 Makefile "${install_dir}/"

  for i in $(ls -1 *.c *.h | xargs); do
    install -Dm644 $i "${install_dir}/"
  done
  install -Dm644 aorus-laptop.conf "${pkgdir}/etc/modules-load.d/aorus-laptop.conf"

}
