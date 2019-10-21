_pkgbase=gm965temp
pkgname="${_pkgbase}-dkms-git"
pkgver=a
pkgrel=1
pkgdesc='gm965temp with fixes to build on newest kernels (WIP)'
arch=('any')
url="https://gitlab.com/swiftgeek/gm965temp"
license=('GPL')
depends=('dkms')
source=("${_pkgbase}::git+${url}" 'dkms.conf')
sha256sums=('SKIP'
            '24092ff68a5841d903c45edebff9a96a2b657d2fe379c2653bdd06665c3fe6dc')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  [ -f "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/sensors-detect.gm965temp" ] && rm "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/sensors-detect.gm965temp"
}
