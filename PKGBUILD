# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms-git
pkgver=r751.5dae254
pkgrel=1
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('any')
url='https://lkrg.org'
license=('GPL-2.0-only')
source=("${pkgname}::git+https://github.com/openwall/lkrg/"
        'dkms.conf')
sha512sums=('SKIP'
            '199a1656ed24d9de0a0a7b92deaf20d071fe122202d233f4b58b254d3bb5828267db3fc16ffe0fa5013da3bdb6fd9d1829eedaac1c67f4025cd1d24d3017cb3d')
makedepends=('git')
depends=('dkms')
provides=('lkrg-dkms')
conflicts=('lkrg-dkms')
backup=('etc/sysctl.d/01-lkrg.conf')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Set version
  cp dkms.conf "${pkgname}/"
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgname}/dkms.conf"
}

package() {
  # Copy sources (including Makefile)
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type d -exec chmod 755 {} \;

  # Copy OUR dkms.conf
  install -Dm644 "${pkgname}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Install the default configuration file
  install -Dpm 644 -o root -g root "${srcdir}/${pkgname}/scripts/bootup/lkrg.conf" "${pkgdir}/etc/sysctl.d/01-lkrg.conf"

  # Install the systemd service file
  install -Dpm 644 -o root -g root "${srcdir}/${pkgname}/scripts/bootup/systemd/lkrg.service" "${pkgdir}/usr/lib/systemd/system/lkrg.service"
}
