# Maintainer: Nicholas Wang <me at nicho1as dot wang>

_pkgbase=snd-hda-scodec-cs35l41-sandwalker
pkgname=${_pkgbase}-dkms-git
pkgver=r4.cf3a619
pkgrel=1
pkgdesc="Patched cs35l41 HDA driver for HP Sandwalker (HP Dragonfly 13.5 inch G4)"
url="https://github.com/nicholascw/aur-snd-hda-scodec-cs35l41-sandwalker"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("${pkgname}::git+https://github.com/nicholascw/aur-snd-hda-scodec-cs35l41-sandwalker.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
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

  install -Dm644 blacklist.conf "${pkgdir}/etc/modprobe.d/blacklist_snd_hda_scodec_cs35l41.conf"

}

