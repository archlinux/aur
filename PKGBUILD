# Maintainer : Achilleas Pipinellis <axilleas archlinux info>
# Contributor: William Giokas <1007380@gmail.com>
# Contributor: Fernando M f[at]beford.net
# Contributor: Ivo Benner <ivo.benner[at]web.de>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>
# Contributor: Rob Taylor <robtaylor[at]floopily.org>

pkgname=yum
pkgver=3.4.3
pkgrel=5
pkgdesc="a popular channel based package manager for RPM distros."
arch=('i686' 'x86_64')
license=('GPL')
url="http://yum.baseurl.org/"
groups=('system')
depends=('python2' 'intltool' 'urlgrabber' 'rpm-org' 'python2-pysqlite' 'yum-metadata-parser' 'python2-iniparse' 'python2-pyliblzma')
source=("http://yum.baseurl.org/download/3.4/yum-${pkgver}.tar.gz" "http://pkgs.fedoraproject.org/cgit/yum.git/plain/yum-HEAD.patch?h=f21" 'yum0.patch')
md5sums=('7c8ea8beba5b4e7fe0c215e4ebaa26ed'
         '057b511555104257c4422c54fb4ed089'
         '5c7dbcac530ec6efdf1979a256289c7d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Patch up to Fedora current
  patch -p1 < "${srcdir}/yum-HEAD.patch?h=f21"

  cd "etc"

  # Apply patch to remove the RedHat style init script from being installed
  patch < "${srcdir}/yum0.patch"
}

build() {
  msg 'Patching python2 shebangs'
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find ${srcdir} -name '*.py')

  msg 'Patching Makefile'

  sed -i -e "s/PYTHON=python/PYTHON=python2/" "${srcdir}/${pkgname}-${pkgver}/Makefile"

  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" INIT=systemd install

  mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin/"
}
