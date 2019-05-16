# Maintainer: Jose Fernando Zazo <josefernando.zazo@hotmail.com>
#
pkgname=('pipelinedb-git')
pkgver='1.0.0'
pkgrel=13
pkgdesc="The streaming SQL database"
arch=('any')
url="https://www.pipelinedb.com"
license=('Apache2')
depends=('postgresql>=10.1')
makedepends=('zeromq')
provides=('pipelinedb')
conflicts=('pipelinedb')
source=("https://github.com/pipelinedb/pipelinedb/archive/${pkgver}-${pkgrel}.tar.gz")

md5sums=('6902fd076cc6f0615a2d4042021d792f')


prepare() {
  patch -Np1 < ../pipelinedb-dir.patch
}

build() {
	cd "pipelinedb-${pkgver}-${pkgrel}"

  make LDFLAGS=-lzmq USE_PGXS=1
}

package() {
  cd "${srcdir}/pipelinedb-${pkgver}-${pkgrel}"
  
  # install
  make DESTDIR="${pkgdir}" install
  
  # install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/pipelinedb/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
}

post_install() {
  msg2 "Remember to update your configuration to preload the pipelinedb extension with:"
  msg2 "  \$cat \"shared_preload_libraries = 'pipelinedb'\" >> /var/lib/postgres/data/postgresql.conf"
  msg2 "  \$cat \"max_worker_processes = 128\"              >> /var/lib/postgres/data/postgresql.conf"
  msg2 "And to enable the pipelinedb extension in your database with:"
  msg2 "  \$psql -c \"CREATE EXTENSION pipelinedb\""
}