# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=bus1-git
_pkgbase=${pkgbase/-git}
pkgname=(bus1-dkms-git bus1-headers-git bus1-doc-git)
pkgver=r977.20ee2f7
pkgrel=3
pkgdesc='Bus1 Out-of-Tree Kernel Module'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://www.bus1.org'
makedepends=('git' 'xmlto' 'docbook-xsl' 'dkms')
license=('LGPL2.1')
source=("git+https://github.com/bus1/${_pkgbase}.git"
    'dkms.conf')
sha512sums=('SKIP'
            'cc123567141880104ffe153d18de342b58c79ae2b8833ee3df6fcd1b6dad76c58385a5f103362ff036d636c7ff5b5b2529a72b7c932c7d8bfba73b96e198e02c')

pkgver() {
  cd ${_pkgbase}

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgbase}

  make -f Makefile.docs
}

package_bus1-dkms-git() {
  depends=('dkms')
  provides=('bus1' 'bus1-git')
  conflicts=('bus1' 'bus1-git')

  cd ${_pkgbase}

  install -Dm0644 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  install -m0644 Makefile "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}

  install -dm0755 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/ipc/bus1
  cp -a ipc/bus1 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/ipc/

  install -Dm0644 include/uapi/linux/bus1.h \
    "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/include/uapi/linux/bus1.h
  install -dm0755 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/usr/include/linux
  ln -s ../../../include/uapi/linux/bus1.h \
    "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/usr/include/linux
}

package_bus1-headers-git() {
  provides=('bus1-headers')
  conflicts=('bus1-headers')

  cd "${_pkgbase}"

  install -Dm 0644 include/uapi/linux/bus1.h "${pkgdir}"/usr/include/linux/bus1.h
}

package_bus1-doc-git() {
  provides=('bus1-doc')
  conflicts=('bus1-doc')

  cd "${_pkgbase}"

  install -dm 0755 "${pkgdir}"/usr/share/man/man7/
  install -m 0644 Documentation/bus1/bus1*.7 "${pkgdir}"/usr/share/man/man7/
}
