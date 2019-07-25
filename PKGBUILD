# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=pycharm-community
pkgver=2019.2
_pkgver=2019.2
pkgrel=1
pkgdesc="Powerful Python and Django IDE. Professional Edition."
arch=('x86_64')
url='https://www.jetbrains.com/pycharm/'
conflicts=('pycharm' 'pycharm-professional')
provides=('pycharm')
license=('custom')
backup=(
    opt/$pkgname/bin/pycharm.vmoptions 
    opt/$pkgname/bin/pycharm64.vmoptions
    opt/$pkgname/bin/idea.properties
)
depends=('giflib' 'glibc' 'sh' 'ttf-font' 'libxtst' 'libxslt' 'python')
source=("https://download.jetbrains.com/python/$pkgname-$_pkgver.tar.gz"
        "pycharm-community.desktop"
        "pycharm"
        "charm.desktop"
        "charm")
# https://download.jetbrains.com/python/pycharm-professional-${_pkgver}.tar.gz.sha256
sha256sums=('632015cc40d6e4a874ab5cbab0430ec1962cd3c4a7ff5f083ce88242180f784b'
            '1c12333a8be131a4d148f960d611585f8f783ee080db957110a99c8a780f55ab'
            '0afdd03fe56553e01001f783da9b627f952cd43eeaed4e31bba53d68e1c9f9b3'
            '6df85b749f78ebe13031643c96cbb05bca80b4c19d3780e4d1eb7e95d97464a8'
            '029490b735ec0f5785a083f65172f6eece3fa64dad94b8b56f0db73c5418cfa2')
makedepends=('python2-setuptools' 'python-setuptools')
optdepends=('ipython2: For enhanced interactive Python shell v2 inside Pycharm'
            'ipython: For enhanced interactive Python shell v3 inside Pycharm'
            'openssh: For deployment and remote connections'
            'python2-setuptools: Packages manager for Python 2, for project interpreter'
            'python-setuptools: Packages manager for Python 3, for project interpreter'
            'python2-coverage: For support code coverage measurement for Python 2'
            'python-coverage: For support code coverage measurement for Python 3'
            'cython2: For performance debugger in Python 2'
            'cython: For performance debugger in Python 3'
            'docker-machine: For support docker inside Pycharm'
            'docker-compose: For support docker inside Pycharm'
            'vagrant: For support virtualized development environments'
            'python2-pytest: For support testing inside Pycharm with Python 2'
            'python-pytest: For support testing inside Pycharm with Python 3'
            'python2-tox: Python environments for testing tool with Python 2'
            'python-tox: Python environments for testing tool with Python 3'
            'jupyter: For support Jupyter Notebook'
            'python-docutils-stubs: For build documentation with sphynx')
            
build() {
  cd pycharm-community-$_pkgver

  # compile PyDev debugger used by PyCharm to speedup debugging
  python2 helpers/pydev/setup_cython.py build_ext --build-temp build --build-lib .
  python3 helpers/pydev/setup_cython.py build_ext --build-temp build --build-lib .
  
  rm -rf bin/fsnotifier{,-arm} lib/libpty/linux/x86
}

package() {
  # workaround FS#40934
  sed -i 's/lcd/on/' pycharm-community-$_pkgver/bin/*.vmoptions

  # base
  install -dm 755 $pkgdir/opt/$pkgname
  cp -dr --no-preserve=ownership pycharm-community-$_pkgver/* $pkgdir/opt/$pkgname/
  install -dm 755 $pkgdir/usr/share/{applications,pixmaps}
  install -Dm 644 $pkgdir/opt/$pkgname/bin/pycharm.png $pkgdir/usr/share/pixmaps/pycharm.png
  install -Dm 644 pycharm-community.desktop $pkgdir/usr/share/applications/
  
  # exec
  install -dm 755 $pkgdir/usr/bin/
  install -Dm 755 pycharm $pkgdir/usr/bin/
  
  # licenses
  install -dm 755 $pkgdir/usr/share/licenses/$pkgname/
  cp -dr --no-preserve=ownership pycharm-community-$_pkgver/license/* $pkgdir/usr/share/licenses/$pkgname/
  
  # install charm application - for edit a single file in Pycharm
  install -Dm 755 charm $pkgdir/opt/pycharm-community/bin/
  install -Dm 644 charm.desktop $pkgdir/usr/share/applications/
}
