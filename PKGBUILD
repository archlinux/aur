# Maintainer: Lari Tikkanen <lartza at wippies.com>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
# Contributor: Nelson VuDu <vudu DOT curse AT gmail DOT com>

pkgname=lottanzb-bzr
pkgver=1732
pkgrel=1
pkgdesc="A SABnzbd+ (Usenet binary downloader) GUI front-end written in PyGTK (bzr version)"
arch=('any')
url="http://www.lottanzb.org/"
license=('GPL')
depends=('python2-dbus' 'python2-configobj' 'pygtk' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'bzr')
optdepends=('sabnzbd: for local downloading'
	    'par2cmdline: for checking and repairing downloads'
            'pyopenssl: for SSL encryption and HTTPS remote access'
            'python-feedparser: for RSS support'
            'python2-yenc: for a significantly faster decoding of downloads'
	    'unrar: for automatic extraction of downloads'
            'unzip: for automatic extraction of ZIP archives'
            'yelp: for displaying the help content'
	    'intltool: for translation support')
provides=('lottanzb')
conflicts=('lottanzb')
install=${pkgname}.install

_bzrmod=trunk
_bzrbranch=lp:lottanzb/${_bzrmod} 

build() {
  cd ${srcdir}

  if [ -d ${_bzrmod}/.bzr ]; then
    (cd ${_bzrmod} && bzr pull -r ${pkgver})
  else
    bzr branch ${_bzrbranch} ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_bzrmod}-build"
  cp -r "${srcdir}/${_bzrmod}" "${srcdir}/${_bzrmod}-build"
  cd "${srcdir}/${_bzrmod}-build"

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_bzrmod}-build
  python2 setup.py install --packaging-mode --root=${pkgdir} --prefix=/usr 
}
