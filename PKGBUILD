# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Simon Peter Nicholls (simon <at> mintsource <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-refpolicy-arch
_reponame=selinux-policy-arch
_policyname=refpolicy-arch
pkgver=20221101
pkgrel=1
pkgdesc="Modular SELinux reference policy including headers and docs with Arch Linux patches"
arch=('any')
url="https://github.com/SELinuxProject/refpolicy/wiki"
license=('GPL2')
groups=('selinux')
makedepends=('git' 'python' 'checkpolicy>=3.0' 'semodule-utils')
depends=('policycoreutils>=3.0')
install="${pkgname}.install"
_commit=a1a2e9125d444217672207e0d34be5daae32f9ce
source=("git+https://github.com/archlinuxhardened/${_reponame}#commit=${_commit}"
        'config')
sha256sums=('SKIP'
            'c9f7cce9a06fd0595b3dd47d4fdde9d9c7457120c42c5f08bfdc5e89eb9a61df')

build() {
  cd "${srcdir}/${_reponame}"
  make bare
  make conf
  make
}

package() {
  cd "${srcdir}/${_reponame}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-headers
  make DESTDIR="${pkgdir}" PKGNAME="${_policyname}" install-docs

  # Create /var/lib/selinux, which is necessary for loading policy,
  # which is done via install script.
  install -d -m0755 "${pkgdir}/var/lib/selinux"

  # Install main SELinux config file besides /etc/selinux/config.
  # The install script will create a symlink.
  install -m644 -D "${srcdir}/config" "${pkgdir}/etc/selinux/config.${_policyname}"
}
