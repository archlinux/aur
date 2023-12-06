# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms-git
pkgver=r539.3760e0e
pkgrel=1
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('any')
url='https://www.openwall.com/lkrg/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/openwall/lkrg/"
        'dkms.conf')
sha512sums=('SKIP'
            '0a1db587e774003d562b78beb290c5041746c3095696daa713bb1913190076f2578fc66b8efc54c7d698866876b9b62920da750d58665a632ba6ad6014eeb00c')
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
  install -Dm644 "${srcdir}/${pkgname}/scripts/bootup/lkrg.conf" "${pkgdir}/etc/sysctl.d/01-lkrg.conf"

  # Install the systemd service file
  install -Dm 644 "${srcdir}/${pkgname}/scripts/bootup/systemd/lkrg.service" "${pkgdir}/etc/systemd/system/lkrg.service"
}
