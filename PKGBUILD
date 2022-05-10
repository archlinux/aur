# Maintainer: dreieck
# Contributor: jason ryan <jasonwryan@gmail.com>
# Submaintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_pkgname=v86d
pkgname="${_pkgname}"
pkgver=0.1.10
pkgrel=11
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
  initcpio_uvesafb_install
  initcpio_uvesafb_hook
  modprobe_uvesafb.conf
)
sha256sums=(
  'SKIP'
  'b33de32a20303dbae9a4ef20636852170d740afb832249903ff37e7454311663'
  'e1c05aabfb25d40de51555865286b22a5511ff1dc85cb7af0ab1baa896e32dd5'
  '5d5949ec23a546d1468327e5496e8cc2b0b2015b84ff8bedb6d0b462df59bd19'
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

  install -D -v -m644 "${srcdir}/initcpio_uvesafb_install" "${pkgdir}/usr/share/doc/${_pkgname}/examples/etc/initcpio/install/uvesafb"
  install -D -v -m644 "${srcdir}/initcpio_uvesafb_hook" "${pkgdir}/usr/share/doc/${_pkgname}/examples/etc/initcpio/hooks/uvesafb"
  install -D -v -m644 "${srcdir}/modprobe_uvesafb.conf" "${pkgdir}/usr/share/doc/${_pkgname}/examples/etc/modprobe.d/uvesafb.conf"
  install -D -v -m644 "${srcdir}/${_pkgname}/README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -D -v -m644 "${srcdir}/${_pkgname}/TODO" "${pkgdir}/usr/share/doc/${_pkgname}/TODO"

  # usrmove
  cd "${pkgdir}"
  mv -v sbin usr/bin
}
