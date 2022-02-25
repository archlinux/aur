# Maintainer : Achilleas Pipinellis <axilleas archlinux info>
# Contributor: prg <prg-archlinux@xannode.com>
# Contributor: William Giokas <1007380@gmail.com>
# Contributor: Fernando M f[at]beford.net
# Contributor: Ivo Benner <ivo.benner[at]web.de>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>
# Contributor: Rob Taylor <robtaylor[at]floopily.org>

pkgname=yum
pkgver=3.4.3
pkgrel=8
pkgdesc="a popular channel based package manager for RPM distros."
arch=('i686' 'x86_64')
license=('GPL')
url="http://yum.baseurl.org/"
groups=('system')
depends=('python2' 'intltool' 'python2-urlgrabber' 'rpm-org' 'python2-pysqlite' 'yum-metadata-parser' 'python2-iniparse' 'python2-pyliblzma')
source=("http://yum.baseurl.org/download/3.4/yum-${pkgver}.tar.gz"
        "yum.patch::https://src.fedoraproject.org/rpms/yum/raw/f21/f/yum-HEAD.patch"
        'remove-init-dir-makefile.patch')
md5sums=('7c8ea8beba5b4e7fe0c215e4ebaa26ed'
         '3ed35721daf75fd56590bd2d2b993ddc'
         '14d68bd689ea76a44567bc2dd0e64cb1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Patch up to Fedora current
  patch -p1 < "${srcdir}/yum.patch"

  cd "etc"

  # Apply patch to remove the RedHat style init script from being installed
  patch < "${srcdir}/remove-init-dir-makefile.patch"
}

build() {
  # Patching python2 shebangs
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|"          \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|"  \
         $(find ${srcdir} -name '*.py')
  sed -i -e "s/PYTHON=python/PYTHON=python2/" "${srcdir}/${pkgname}-${pkgver}/Makefile"

  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" INIT=systemd install

  mv "${pkgdir}/usr/sbin/"* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/usr/sbin/"
}
