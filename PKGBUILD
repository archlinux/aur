# Maintainer: dreieck
# Contributor: jason ryan <jasonwryan@gmail.com>
# Submaintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_pkgname=v86d
pkgname="${_pkgname}"
pkgver=0.1.10
pkgrel=12
pkgdesc="userspace helper for uvesafb that runs x86 code in an emulated environment."
arch=('i686' 'x86_64')
url="https://github.com/mjanusz/v86d"
license=('GPL2')
depends=('glibc')
makedepends=('git')
optdepends=(
  "uvesafb-dkms: For uvesafb kernel module, the ownly known thing that makes use of '${_pkgname}'."
  "UVESAFB-MODULE: For uvesafb kernel module, the ownly known thing that makes use of '${_pkgname}'."
)
options=('!makeflags')
source=(
  "${_pkgname}::git+https://github.com/mjanusz/v86d.git#tag=${pkgname}-${pkgver}"
)
sha256sums=(
  'SKIP'
)

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --with-x86emu
  # we only need /usr/include/video/uvesafb.h
  make KDIR=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  install -D -v -m644 "${srcdir}/${_pkgname}/README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -D -v -m644 "${srcdir}/${_pkgname}/TODO" "${pkgdir}/usr/share/doc/${_pkgname}/TODO"

  # usrmove
  cd "${pkgdir}"
  mv -v sbin usr/bin
}
