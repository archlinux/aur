# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=rtw89
_srcname=rtw89
_branch=main
pkgname=${_pkgbase}-dkms-git
pkgver=r148.4dc5371
pkgrel=2
epoch=1
pkgdesc="Driver for Realtek 8852AE, an 802.11ax device"
arch=('x86_64')
url="https://github.com/lwfinger/rtw89"
license=('GPL2')
makedepends=('git' 'xz')
depends=('dkms')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("$_srcname::git+https://github.com/lwfinger/rtw89.git#branch=${_branch}"
        'dkms.conf')
sha256sums=('SKIP'
            'd4015a9c63b86baa120b558f4acc19c60fe5cbea7ded338173e08cec47327b40')
install='rtw89-dkms-git.install'

build() {
  cd "$srcdir/${_srcname}"
  rm -fv dkms.conf
}
pkgver() {
  cd "$srcdir/${_srcname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Copy dkms.conf
  install -Dt "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" -m644 dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -rT "$_srcname" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  # This isn't the best solution but it works
  # and does not require additional dependencies
  rm -rfv "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"/{.git,debian,.gitignore,README.md}
}
