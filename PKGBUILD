# Maintainer : Simone Economo <my.ekoes@gmail.com>
# Contributor: Boudhayan Gupta <me at BaloneyGeek dot com>

pkgname=system-config-samba
pkgver=1.2.100
pkgrel=1
_docsname=system-config-samba-docs
_docsver=1.0.9
pkgdesc="The Samba configuration tool by Red Hat"
url="http://fedoraproject.org/wiki/SystemConfig/samba"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('samba' 'libuser' 'gksu' 'python2')
optdepends=()
makedepends=('intltool' 'gnome-common' 'gnome-doc-utils')
conflicts=()
replaces=()
backup=()
install=system-config-samba.install
source=("https://fedorahosted.org/released/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "https://fedorahosted.org/released/${_docsname}/${_docsname}-${_docsver}.tar.bz2"
        "${pkgname}.patch"
        "${_docsname}.patch"
        "${pkgname}.8")
md5sums=('31f28460724553d4741e514462befaa3'
         '4285494ecac5f4ed34bd515e40aa057c'
         'fa728f13b98dcd2e981aa2a4e61ca0d9'
         'ef9ed98bdf27661263477ef2d5ba92d6'
         '5abeeeea50f3d57bf14f0125748dea4f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  rm {git_rules.mk,polkit_rules.mk,rpmspec_rules.mk,scm_rules.mk,upload_rules.mk}
  rm config/org.fedoraproject.config.samba.policy.{0,1}.in
  rm -r src/scsamba/dbus
  rm src/system-config-samba-mechanism.py

  # Python 2 fix
  find . -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|"

  sed -i 's|python|python2|g' py_rules.mk
  # --

  patch -p1 -i ../${pkgname}.patch
  make

  cd "${srcdir}/${_docsname}-${_docsver}"

  patch -p1 -i ../${_docsname}.patch
  make  
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_docsname}-${_docsver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${pkgname}.8" "${pkgdir}/usr/share/man/man8/${pkgname}.8"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
