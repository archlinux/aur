# Maintainer: Isaac Aronson <i at linux dotcom>
# Contributor: Dan Serban
# Contributor: Jim Casteel
# Contributor: dryes <joswiseman@gmail>
# Contributor: Vishnevsky Roman <aka dot x0x01 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Aldo Culquicondor <alculquicondor@gmail.com>
# Contributor: Florijan Hamzic <florijanh@gmail.com>
pkgname='sphinx'
pkgver=2.2.9
pkgrel=1
pkgdesc='Free open-source SQL full-text search engine.'
arch=('i686' 'x86_64')
url='http://www.sphinxsearch.com/'
license=('GPL')
depends=('unixodbc' 'expat' 'libmysqlclient' 'postgresql-libs')
optdepends=('postgresql')
backup=('etc/conf.d/sphinx')
install='sphinx.install'
source=("http://sphinxsearch.com/files/${pkgname}-${pkgver}-release.tar.gz"
    'sphinx.conf.d'
    'sphinx.rc.d' 
    'sphinx.service'
    'sphinx.tmpfiles.conf')

build() {
  sed -i '15199,15199 s/x00/x21/' "${srcdir}/${pkgname}-${pkgver}-release/src/searchd.cpp"

  cd "${srcdir}/${pkgname}-${pkgver}-release"
  ./configure --prefix=/usr --exec-prefix=/usr --localstatedir=/var/lib/sphinx \
    --sysconfdir=/etc/sphinx --with-pgsql --enable-id64

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-release"

  make DESTDIR="${pkgdir}" install

  for _f in "${pkgdir}/usr/bin/"*; do
    ln -s "/usr/bin/${_f##*/}" "${pkgdir}/usr/bin/sphinx-${_f##*/}"
  done

  install -Dm755 "${srcdir}/sphinx.rc.d" "${pkgdir}/etc/rc.d/sphinx"
  install -Dm644 "${srcdir}/sphinx.conf.d" "${pkgdir}/etc/conf.d/sphinx"
  install -Dm644 "${srcdir}/sphinx.service" "${pkgdir}/usr/lib/systemd/system/sphinx.service"
  install -d "${pkgdir}/usr/share/sphinx/lib"
  install -Dm644 api/sphinxapi.php "${pkgdir}/usr/share/sphinx/lib/sphinxapi.php"
  install -Dm644 api/sphinxapi.py "${pkgdir}/usr/share/sphinx/lib/sphinxapi.py"
  install -Dm644 "${srcdir}/sphinx.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/sphinx.conf"
}
md5sums=('1fcc3d180c0559bdeb93602ef248caf4'
         '48e3e1857919d26d5104a48caffb531b'
         'faaa8310af97ff1dbdaf08612e442020'
         'fe06a8aff0520a6f75596ee43d2e5935'
         '22ec4cd0471a1d52702d57d78614b8d8')
