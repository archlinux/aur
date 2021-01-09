# $Id$
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: EndlessEden
#
# Cloned from the Archlinux PKGBUILD for clamav

pkgname=clamav-git
_gitname=clamav-devel
pkgver=0.99.gdce04e58f
pkgrel=1
pkgdesc='Anti-virus toolkit for Unix'
url='http://www.clamav.net/'
license=('GPL')
arch=('i686' 'x86_64')
provides=('clamav' 'clamav-git' 'clamav-devel')
conflicts=('clamav' 'clamav-git' 'clamav-devel')
makedepends=('libmilter')
depends=('bzip2' 'libltdl' 'gcc-libs')
validpgpkeys=('B964E6D7BC7D7C82CCB8D45840B8EA2364221D53'
              'F79FB2D08751574C5D3FDFFBB3D5342C260429A0')
source=('git+https://github.com/vrtadmin/clamav-devel.git'
        'logrotate'
        'tmpfiles.d'
        'clamd.conf'
        'freshclam.conf'
        'clamd.service'
        'freshclamd.service')
sha1sums=('SKIP' 
          'bb488a56b0f6a0760446cde89c1e3321e2717b78'
          'a224ea9b4d0f4f196827347d54bed51e11c197ea'
          '887f624eb305f2446f55d8339e2972ad0cfe2b79'
          'b767837d0279ad30b92c314cb762b73e5ad0415e'
          '77899cce83f04cbe134b30da376f879d2841f769'
          'cda9a087e5593992150cb456e34c5f6f589aca82')

backup=('etc/clamav/clamd.conf'
        'etc/clamav/freshclam.conf'
        'etc/logrotate.d/clamav')

install=install

pkgver() {
  cd "$srcdir/$_gitname"
  #_curtag="$(git rev-list --tags --max-count=1)"
  #_tagver="$(git describe --tags $_curtag | sed -e 's:^v::' -e 's:-:_:g')"
  #_commits="$(git rev-list --count HEAD --since=$_tagver)"
  #_sha="$(git rev-parse --short HEAD)"
  #printf "%s_%s_g%s" $_tagver $_commits $_sha
  echo "0.99.g$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/clamav \
		--with-dbdir=/var/lib/clamav \
		--enable-milter \

	make
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 ../clamd.conf "${pkgdir}"/etc/clamav/clamd.conf
	install -Dm644 ../freshclam.conf "${pkgdir}"/etc/clamav/freshclam.conf
	install -Dm644 ../freshclamd.service "${pkgdir}"/usr/lib/systemd/system/freshclamd.service
	install -Dm644 ../clamd.service "${pkgdir}"/usr/lib/systemd/system/clamd.service
	install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/clamav.conf
	install -Dm644 ../logrotate "${pkgdir}"/etc/logrotate.d/clamav

	install -d -o 64 -g 64 "${pkgdir}"/var/log/clamav
	install -d -o 64 -g 64 "${pkgdir}"/var/lib/clamav
}
