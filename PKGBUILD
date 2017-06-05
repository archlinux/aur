# Contributor: Lobtsov Alexander <alex at lobtsov dot com>
pkgname=sphinx-beta
_pkgname=sphinx
pkgver=2.3.2
pkgrel=1
pkgdesc="Free open-source SQL full-text search engine (SVN version, with libsphinxclient, with systemd support)"
arch=(i686 x86_64)
url="http://www.sphinxsearch.com"
license=('GPL')
depends=('libmariadbclient')
source=(
    "http://sphinxsearch.com/files/${_pkgname}-${pkgver}-beta.tar.gz"
    "sphinx.service"
)

provides=("sphinx")
conflicts=("sphinx" "sphinx-svn")

# https://bbs.archlinux.org/viewtopic.php?id=77214
options=('!makeflags')

sha256sums=('d2e71e094b7f979cdd554069006983e1c1289601d8572428b36d488c61621460'
            '847218ba5cd0b8f5a3b0d851352ffca1085229bfdf2779cbe2eff5e5eef99351')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-beta"

  msg "Starting sphinx make..."

  ./configure --prefix=/usr \
  --exec-prefix=/usr \
  --program-prefix=sphinx- \
  --localstatedir=/var/lib/sphinx \
  --sysconfdir=/etc/sphinx \
  --enable-id64
  make || return 1
  make DESTDIR=${pkgdir} -j4 install || return 1

  cd "$srcdir/${_pkgname}-${pkgver}-beta/api/libsphinxclient"
  msg "Starting libsphinxclient make..."

  sed -i 's/\/lib\/cpp/\/usr\/bin\/cpp/g' ./configure

  ./configure --prefix=/usr \
  --exec-prefix=/usr \
  --program-prefix=sphinx- \
  --localstatedir=/var/lib/sphinx \
  --sysconfdir=/etc/sphinx \
  --enable-id64
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  msg "Install service file..."

  install -Dm644 "${srcdir}/sphinx.service" "${pkgdir}/usr/lib/systemd/system/sphinx.service"
}
