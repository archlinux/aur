# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-refpolicy-git
_policyname=refpolicy-git
pkgver=RELEASE_2_20210908.r29.ge49243a08f4d
pkgrel=1
pkgdesc="Modular SELinux reference policy including headers and docs"
arch=('any')
url="https://github.com/SELinuxProject/refpolicy/wiki"
license=('GPL2')
groups=('selinux')
makedepends=('git' 'python' 'checkpolicy>=3.0' 'semodule-utils')
depends=('policycoreutils>=3.0')
install="${pkgname}.install"
# refpolicy 2.20180701 moved the repository to SELinuxProject Github organization
# When updating, if makepkg reports "refpolicy is not a clone of https://github.com/SELinuxProject/refpolicy",
# you need to update the remote of the git repository, for example with the following command:
#   git -C refpolicy remote set-url origin https://github.com/SELinuxProject/refpolicy
source=("git+https://github.com/SELinuxProject/refpolicy"
        'config')
sha256sums=('SKIP'
            'a5faaa2a2c3f986770a9296882b1887c2bdd38b0a990a36f95fe22f22ffb5c13')

pkgver() {
  cd refpolicy
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd refpolicy

  # Ensure the environment is clean
  make bare

  # Configure, overriding build.conf values with the ones given on the command line
  make conf NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n

  make NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n
}

package() {
  cd refpolicy
  make install \
    DESTDIR="${pkgdir}" NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n
  make install-headers \
    DESTDIR="${pkgdir}" NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n
  make install-docs \
    DESTDIR="${pkgdir}" NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n \
    PKGNAME="${_policyname}"

  # Create /var/lib/selinux, which is necessary for loading policy,
  # which is done via install script.
  install -d -m0755 "${pkgdir}/var/lib/selinux"

  # Install main SELinux config file defaulting to refpolicy
  install -m644 -D "${srcdir}/config" "${pkgdir}/etc/selinux/config.${_policyname}"
}
