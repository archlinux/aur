# Maintainer: Calimero <calimerotekni@free.fr>

pkgname=aufs-util
pkgver=20160301
pkgrel=1
pkgdesc="Another Unionfs Implementation that supports NFS branches"
arch=('i686' 'x86_64')
url="http://aufs.sourceforge.net/"
license=('GPL2')
makedepends=('aufs' 'git')
replaces=('aufs2-util' 'aufs3-util')
conflicts=('aufs2-util' 'aufs3-util')
source=("${pkgname}::git://git.code.sf.net/p/aufs/aufs-util")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  date -d @$(git log -n1 --pretty=format:%ct) '+%Y%m%d'
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # Checkout the latest branch
  git checkout "$(git for-each-ref --format='%(refname:short)' --sort=-refname:short "*/*/*/aufs[0-9].[0-9]*" --count=1)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  #fixes for the archlinux /usr/bin move
  mv "${pkgdir}"/sbin/* "${pkgdir}"/usr/bin/
  rmdir "${pkgdir}"/sbin
}
