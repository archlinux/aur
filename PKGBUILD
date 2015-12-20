# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Simon Peter Nicholls (simon <at> mintsource <dot> org)

pkgname=selinux-refpolicy-arch
_origname=refpolicy
_policyname=refpolicy-arch
_origver=20110726
_patchver=1
pkgver=${_origver}.${_patchver}
pkgrel=3
pkgdesc="Modular SELinux reference policy including headers and docs with Arch Linux patch"
arch=('any')
url="http://oss.tresys.com/projects/refpolicy"
license=('GPL')
groups=('selinux' 'selinux-policies')
depends=('linux-selinux')
makedepends=('selinux-usr-checkpolicy>=2.0.16' 'selinux-usr-policycoreutils>=2.0.0' 
	     'selinux-usr-libsepol>=2.0.29' 'selinux-usr-libsemanage>=2.0.29' 
	     'pyxml')
conflicts=('selinux-refpolicy')
backup=(etc/selinux/config)
options=(!makeflags)
install=${pkgname}.install
source=(http://oss.tresys.com/files/${_origname}/${_origname}-2.${_origver}.tar.bz2
        config
        ${pkgname}.patch)
sha256sums=('8159b7535aa0f805510e4e3504b1317d7083b227f0ef3df51c6f002ed70ecedb'
            '4803739c58a47b0226899e41239df714ee72e86267c9929d4776b819de370cb4'
            'b03d8afcc71f0d67ba3c8688003f353c27d00bf8a87ef925e23c54fafe2d4880')

build() {
  cd "${srcdir}/${_origname}"
  # Add Arch Linux patch
  patch -Np1 -i "${srcdir}/${pkgname}.patch"
  # Policy build settings
  sed -i -e "s/MONOLITHIC = y/MONOLITHIC = n/" build.conf
  sed -i -e "s/#UNK_PERMS = deny/UNK_PERMS = allow/" build.conf
  sed -i -e "s/DIRECT_INITRC = n/DIRECT_INITRC = y/" build.conf
  sed -i -e "s/UBAC = y/UBAC = n/" build.conf
  sed -i -e "s/NAME = refpolicy/NAME = refpolicy-arch/" build.conf
  sed -i -e "s/#DISTRO = redhat/DISTRO = arch/" build.conf
  # Fix for python2
  sed -i -e "s/python/python2/" Makefile
  make bare
  make conf
  make
}

package(){
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-headers
  make DESTDIR="${pkgdir}" install-docs

  # Create some files and directories necesary for loading policy,
  # which is done via install script.
  install -d -m0755 "${pkgdir}/etc/selinux/${_policyname}/modules"
  install -d -m0700 "${pkgdir}/etc/selinux/${_policyname}/modules/active"
  install -d -m0700 "${pkgdir}/etc/selinux/${_policyname}/modules/active/modules"
  install -d -m0755 "${pkgdir}/etc/selinux/${_policyname}/policy"
  touch "${pkgdir}/etc/selinux/${_policyname}/modules/"{semanage.read.LOCK,semanage.trans.LOCK}
  touch "${pkgdir}/etc/selinux/${_policyname}/policy/policy.26" 
  # Link the policy file for selinux-sysvinit to find it
  cd "${pkgdir}/etc"
  ln -s "selinux/${_policyname}/policy/policy.26" "policy.bin"

  # Install main SELinux config file defaulting to refpolicy
  install -m644 -D "${srcdir}/config" "${pkgdir}/etc/selinux/config"

  # Some changes due to python2
  sed -i -e "s/python/python2/" \
	"${pkgdir}/usr/share/selinux/${_policyname}/include/support/segenxml.py"
  sed -i -e "s/python/python2/" \
	"${pkgdir}/usr/share/selinux/${_policyname}/include/Makefile"
}
