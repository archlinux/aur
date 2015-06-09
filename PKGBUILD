# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Allan McRae <allan at archlinux dot org>
# Contributor: Tom Newsom <Jeepster at gmx dot co dot uk>

pkgname=fam
pkgver=2.7.0
pkgrel=19
pkgdesc="File Alteration Monitor"
arch=('i686' 'x86_64')
license=('LGPL' 'GPL')
depends=('rpcbind' 'gcc-libs' 'bash')
url="http://oss.sgi.com/projects/fam/"
backup=('etc/fam/fam.conf')
options=('!makeflags' 'libtool')
source=(ftp://oss.sgi.com/projects/fam/download/stable/${pkgname}-${pkgver}.tar.gz
	fam-2.7.0-dnotify.patch
	fam-2.7.0-largefiles.patch
	fam-2.7.0-limits.patch
	fam-2.7.0-buildfixes.patch
	fam.service)
sha256sums=('1e0aa136693a3e9f4b43ebd71e7bd934cea31817a4a6cba2edc7aac353b8a93f'
            '7daa033c28ed1cffb8fa23fd1224796dee061e13f272417c8f86f98c37aa8d6b'
            'cbe4260704d2cdff34ad0ed52b51b49af36200bc7e801e2e19f1857e2177f7af'
            '79ac603dbabb6c033cd1da98b6e71f31eaaf6cf23597ec7d9647d7e49c8acd8a'
            '16302de30cb31c621742652fa65af3a532f542ce146907cd6e9e3651a9336c6e'
            'e217d7052024ba74dcad956331d31d4e181fb5195e64db2a1ca94ab0c740c2ea')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # Grant necessary permissions to source files
  find . -type f -exec chmod 644 {} \;
  chmod 755 configure

  # Apply patches
  patch -p1 -i "${srcdir}"/fam-2.7.0-dnotify.patch
  patch -p1 -i "${srcdir}"/fam-2.7.0-largefiles.patch
  patch -p0 -i "${srcdir}"/fam-2.7.0-limits.patch
  patch -p1 -i "${srcdir}"/fam-2.7.0-buildfixes.patch

  autoreconf -vfi
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc/fam --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}"/fam.service "${pkgdir}"/usr/lib/systemd/system/fam.service
}
