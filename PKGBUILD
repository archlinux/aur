# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
# Contributor: None

_pkgbase=hid-asus-mouse
pkgname=${_pkgbase}-dkms-git
pkgdesc='HID driver for ASUS ROG & TUF mice providing generation of keyboard events.'
pkgver=r13.9a23175
pkgrel=1
epoch=0
url="https://github.com/kyokenn/${_pkgbase}"
arch=('x86_64')
license=('GPL3')
makedepends=('git')
depends=('glibc' 'dkms')
optdepends=()
source=("${pkgname}::git+https://github.com/kyokenn/${_pkgbase}.git"
        'dkms.conf')
sha256sums=('SKIP'
            '9afd2a0d689508db3b41b646766ce7901541653d18c932a32717c5eb2358d26e')

pkgver() {
  cd "${pkgname}" || return
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 'dkms.conf' "${pkgdir}/usr/src/${_pkgbase}/${pkgver}/dkms.conf"

  sed -e "s/@PKGNAME@/${_pkgbase}/g" \
    -e "s/@PKGVER@/${pkgver}/g" \
    -i "${pkgdir}/usr/src/${_pkgbase}/${pkgver}/dkms.conf"

  cd "${pkgname}" || return
  cp -dr --no-preserve='ownership' ./ \
    "${pkgdir}/usr/src/${_pkgbase}/${pkgver}/"
}
