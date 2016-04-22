# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Note: 
#  This package is almost same as ArchLinux's official
#  PKGBUILD of Postgresql.
#  https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/postgresql
#  Just changed the name and other minor things. 
pkgbase=pipelinedb
pkgname=('pipelinedb' 'pipelinedb-libs')
pkgver=0.9.1
pkgrel=1
pkgdesc="The streaming SQL database"
arch=('i686' 'x86_64')
url="https://www.pipelinedb.com"
license=('custom')
depends=('openssl')
makedepends=('check' 'readline' 'tcl' 'jade')
checkdepends=()
provides=('postgresql')
optdepends=()
backup=()
options=()
conflicts=('postgresql' 'postgresql-libs')
install=
source=("https://github.com/pipelinedb/pipelinedb/archive/$pkgver.tar.gz"
	pipelinedb-check-db-dir
        pipelinedb-run-socket.patch
	pipelinedb.pam 
	pipelinedb.logrotate
	pipelinedb.service 
	pipelinedb.install)
	
md5sums=('c29315317744cb0e6eaaea7707673264'
         '937eec7aabce171bc9d1eab65c560bcb'
         '75c579eed03ffb2312631f0b649175b4'
         '96f82c38f3f540b53f3e5144900acf17'
         'd28e443f9f65a5712c52018b84e27137'
         '5e4cee5f654fab2cebb8764a7735c5b1'
         'e28a4671fa61e5c321683679a0aecc31')

build() {
	cd "pipelinedb-$pkgver"
	
	patch -Np1 < ../pipelinedb-run-socket.patch
	
	./configure CFLAGS='-O2' \
	--prefix=/usr \
	--mandir=/usr/share/man \
	--datadir=/usr/share/pipelinedb \
	--sysconfdir=/etc \
	--with-gssapi \
	--with-libxml \
	--with-openssl \
	--with-perl \
	--with-python PYTHON=/usr/bin/python2 \
	--with-tcl \
        --with-pam \
	--with-system-tzdata=/usr/share/zoneinfo \
	--with-uuid=e2fs \
	--enable-nls \
	--enable-thread-safety
	
        make
#	make world
}

package_pipelinedb-libs() {
  pkgdesc="Libraries for use with pipelinedb"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0')
  provides=('pipelinedb-client')
  conflicts=('pipelinedb-client')

  cd "${srcdir}/pipelinedb-${pkgver}"

  # install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/pipelinedb-libs/LICENSE"

  # install libs and non-server binaries
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  #for util in pg_config pg_dump pg_dumpall pg_restore psql clusterdb createdb createlang createuser dropdb droplang dropuser pg_isready reindexdb vacuumdb; do
  #  install -D -m644 doc/src/sgml/man1/${util}.1 "${pkgdir}"/usr/share/man/man1/${util}.1
  #done

  cd src/include

  mkdir -p "${pkgdir}"/usr/include/{libpq,pipelinedb/internal/libpq}

  # these headers are needed by the public headers of the interfaces
  install -m644 pg_config.h "${pkgdir}/usr/include/"
  install -m644 pg_config_os.h "${pkgdir}/usr/include/"
  install -m644 pg_config_ext.h "${pkgdir}/usr/include/"
  install -m644 postgres_ext.h "${pkgdir}/usr/include/"
  install -m644 libpq/libpq-fs.h "${pkgdir}/usr/include/libpq/"
  install -m644 pg_config_manual.h "${pkgdir}/usr/include/"

  # these headers are needed by the not-so-public headers of the interfaces
  install -m644 c.h "${pkgdir}/usr/include/pipelinedb/internal/"
  install -m644 port.h "${pkgdir}/usr/include/pipelinedb/internal/"
  install -m644 postgres_fe.h "${pkgdir}/usr/include/pipelinedb/internal/"
  install -m644 libpq/pqcomm.h "${pkgdir}/usr/include/pipelinedb/internal/libpq/"
}

package_pipelinedb() {
  pkgdesc="A sophisticated object-relational DBMS"
  backup=('etc/pam.d/pipelinedb' 'etc/logrotate.d/pipelinedb')
  depends=("pipelinedb-libs>=${pkgver}" 'krb5' 'libxml2'
	   'readline>=6.0' 'openssl>=1.0.0' 'pam')
  optdepends=('python2: for PL/Python support'
              'perl: for PL/Perl support'
	      'tcl: for PL/Tcl support')
  options=('staticlibs')
  install=pipelinedb.install
  
  cd "${srcdir}/pipelinedb-${pkgver}"
  
  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install
  #make -C doc/src/sgml DESTDIR="${pkgdir}" install-man
  
  # we don't want these, they are in the -libs package
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" uninstall
  done
  #for util in pg_config pg_dump pg_dumpall pg_restore psql clusterdb createdb createlang createuser dropdb droplang dropuser pg_isready reindexdb vacuumdb; do
  #  rm "${pkgdir}"/usr/share/man/man1/${util}.1
  #done
  
  # install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/pipelinedb/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
#  rmdir "${pkgdir}/usr/share/doc/pipelinedb/html"
  
  install -D -m644 "${srcdir}/pipelinedb.service" \
          "${pkgdir}/usr/lib/systemd/system/pipelinedb.service"
  install -D -m755 "${srcdir}/pipelinedb-check-db-dir" \
	  "${pkgdir}/usr/bin/pipelinedb-check-db-dir"
  
  install -D -m644 "${srcdir}/pipelinedb.pam" \
	  "${pkgdir}/etc/pam.d/pipelinedb"
  
  install -D -m644 "${srcdir}/pipelinedb.logrotate" \
	  "${pkgdir}/etc/logrotate.d/pipelinedb"
}
