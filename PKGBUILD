# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=selinux-refpolicy-git
_policyname=refpolicy-git
pkgver=RELEASE_2_20180114.r30.g6b0abaf88089
pkgrel=1
pkgdesc="Modular SELinux reference policy including headers and docs"
arch=('any')
url="https://github.com/TresysTechnology/refpolicy/wiki"
license=('GPL2')
groups=('selinux')
makedepends=('git' 'python' 'checkpolicy>=2.8' 'semodule-utils')
depends=('policycoreutils>=2.8')
optdepends=('linux-hardened: Linux kernel with SELinux support'
            'linux-selinux: Linux kernel with SELinux support')
install="${pkgname}.install"
source=("git+https://github.com/TresysTechnology/refpolicy"
        "git+https://github.com/TresysTechnology/refpolicy-contrib"
        'config')
sha256sums=('SKIP'
            'SKIP'
            'a5faaa2a2c3f986770a9296882b1887c2bdd38b0a990a36f95fe22f22ffb5c13')

pkgver() {
  cd refpolicy
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd refpolicy

  # Check out contrib module
  git submodule init
  git config submodule.policy/modules/contrib.url "${srcdir}/refpolicy-contrib"
  git submodule update

  # Ensure the environment is clean
  make bare

  # Configure, overriding build.conf values with the ones given on the command line
  make conf NAME="${_policyname}" DISTRO=arch SYSTEMD=y UBAC=n
}

build() {
  cd refpolicy
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
