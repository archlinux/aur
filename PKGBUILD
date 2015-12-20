# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Simon Peter Nicholls (simon <at> mintsource <dot> org)

pkgname=selinux-refpolicy-arch
_origname=refpolicy
_policyname=refpolicy-arch
_origver=20151208
_patchver=0
pkgver=${_origver}.${_patchver}
pkgrel=1
pkgdesc="Modular SELinux reference policy including headers and docs with Arch Linux patch"
arch=('any')
url="http://oss.tresys.com/projects/refpolicy"
license=('GPL')
groups=('selinux')
depends=('linux-selinux')
makedepends=('checkpolicy>=2.1.8' 'policycoreutils>=2.1.10'
             'libsepol>=2.1.4' 'libsemanage>=2.0.29')
backup=(etc/selinux/config)
install=${pkgname}.install
source=(https://raw.githubusercontent.com/wiki/TresysTechnology/${_origname}/files/${_origname}-2.${_origver}.tar.bz2
        config)
sha256sums=('2dd2f45a7132137afe8302805c3b7839739759b9ab73dd1815c01afe34ac99de'
            'c9f7cce9a06fd0595b3dd47d4fdde9d9c7457120c42c5f08bfdc5e89eb9a61df')

prepare() {
  cd "${srcdir}/${_origname}"
  # Add Arch Linux patch
  #patch -Np1 -i "${srcdir}/${pkgname}.patch"

  # Policy build settings
  sed -i -e "s/^NAME = refpolicy/NAME = ${_policyname}/" build.conf
  sed -i -e "s/^#DISTRO = redhat/DISTRO = arch/" build.conf
  sed -i -e "s/^UNK_PERMS = deny/UNK_PERMS = allow/" build.conf
  sed -i -e "s/^SYSTEMD = n/SYSTEMD = y/" build.conf
  sed -i -e "s/^UBAC = y/UBAC = n/" build.conf

  make bare
  make conf
}

build() {
  cd "${srcdir}/${_origname}"
  make
}

package(){
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-headers
  make DESTDIR="${pkgdir}" PKGNAME="${_policyname}" install-docs

  # Create /var/lib/selinux, which is necessary for loading policy,
  # which is done via install script.
  install -d -m0755 "${pkgdir}/var/lib/selinux"

  # Install main SELinux config file defaulting to refpolicy
  install -m644 -D "${srcdir}/config" "${pkgdir}/etc/selinux/config"
}
