# Maintainer: ferion  <ferion@bit0.ro>

_pkgname='agensgraph'
pkgname="${_pkgname}-git"
pkgver=2.1.1.r494.6122dd6c
pkgrel=1
pkgdesc="A multi-model graph database based on PostgreSQL."
arch=('i686' 'x86_64')
url="http://bitnine.net/agensgraph/"
depends=('libxml2' 'readline' 'zlib' 'openssl' 'krb5' 'python2' 'perl')
backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
options=(!strip) # to facilitate debugging of testing builds
license=('Apache')
conflicts=('postgresql' 'postgresql-libs' 'postgresql-testing' 'postgresql-client' 'postgresql-git')
makedepends=('tcl' 'jdk8-openjdk' )
provides=("postgresql-libs=10.3" "postgresql=10.3" 'postgresql-client')
optdepends=('python2: for PL/Python support'
             'perl: for PL/Perl support'
             'tcl: for PL/Tcl support')
source=("git+https://github.com/bitnine-oss/agensgraph#commit=6122dd6c66abd1af9cba67b72321213f7b53c3e7"
         postgresql-run-socket.patch
         agensgraph.patch
         postgresql.pam
         postgresql.logrotate
         agensgraph.service
         postgresql.tmpfiles.conf
         postgresql-check-db-dir)
install=postgresql.install
sha256sums=('SKIP'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            '7d267a6d40ef3d34db476eabb53363d47e17f0b3797ef2b763a6f50f587b0e22'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            'daab6220ef01c729574384a3095f0659bf25617d6c195248a0cd28ede9b6c054'
            '7e086d70e0dcaa6ce45693b4e826ce92d770192b3aff5642319b1ef279d88dc4'
            '5e551630ee443a6985551da2ab72789f669deba8bf4443465d5c76a064dc675d')
pkgver() {
  set -u
  cd "${srcdir}/${_pkgname}"
   printf "%s.r%s.%s\n" "$(git for-each-ref refs/tags --sort=-taggerdate --format='%(refname:short)' --count=1 | sed -e 's/^v//g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  set +u
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 < ../postgresql-run-socket.patch
  patch -Np1 < ../agensgraph.patch
}
build() {
  cd "${srcdir}/${_pkgname}"
  export JAVA_LIBRARY_PATH="/usr/lib/jvm/default-runtime/lib/amd64/server"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --datadir=/usr/share/postgresql \
    --sysconfdir=/etc \
    --with-gssapi \
    --with-libxml \
    --with-perl \
    --with-openssl \
    --with-python PYTHON=/usr/bin/python2 \
    --with-tcl \
    --with-pam \
    --with-uuid=e2fs \
    --with-system-tzdata=/usr/share/zoneinfo \
    --enable-nls \
    --enable-thread-safety

  make
  make -C contrib
}

package() {
  
  cd "${srcdir}/${_pkgname}"

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  install -D -m755 "${srcdir}/HadoopJDBCLoader.class" \
    "${pkgdir}/usr/lib/postgresql/HadoopJDBCLoader.class"
  install -D -m755 "${srcdir}/HadoopJDBCUtils.class" \
    "${pkgdir}/usr/lib/postgresql/HadoopJDBCUtils.class"
  install -D -m644 "${srcdir}/postgresql.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"
  install -D -m644 "${srcdir}/agensgraph.service" \
    "${pkgdir}/usr/lib/systemd/system/agensgraph.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"
  install -D -m644 "${srcdir}/postgresql.pam" \
    "${pkgdir}/etc/pam.d/postgresql"
  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql"
}
