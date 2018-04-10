# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=pycharm-professional
pkgver=2018.1.1
_pkgver=2018.1.1
pkgrel=1
pkgdesc="Powerful Python and Django IDE. Professional edition."
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/pycharm/"
conflicts=('pycharm' 'pycharm-community')
provides=('pycharm')
license=('custom')
install=${pkgname}.install
backup=(opt/$pkgname/bin/pycharm.vmoptions opt/$pkgname/bin/pycharm64.vmoptions)
if [[ $pycharm_professional_nojdk = "yes" ]]; then
    depends=('java-runtime-common' 'java-runtime>=8' 'ttf-font' 'libxtst' 'libxslt')
else
    depends=('giflib' 'ttf-font' 'libxtst' 'libxslt')
fi
makedepends=('python2-setuptools' 'python-setuptools')
if [[ $pycharm_professional_nojdk = "yes" ]]; then
    source=(https://download.jetbrains.com/python/$pkgname-$_pkgver-no-jdk.tar.gz
            'pycharm-professional.desktop'
            'pycharm-professional.install'
            'pycharm'
            'charm.desktop'
            'charm')
else
    source=(https://download.jetbrains.com/python/$pkgname-$_pkgver.tar.gz
            'pycharm-professional.desktop'
            'pycharm-professional.install'
            'pycharm'
            'charm.desktop'
            'charm')
fi
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
            'python-tox: Python environments for testing tool with Python 3', 
            'jupyter: For support Jupyter Notebook')
# https://download.jetbrains.com/python/pycharm-professional-${_pkgver}-no-jdk.tar.gz.sha256
if [[ $pycharm_professional_nojdk = "yes" ]]; then
sha256sums=('3b6dd565e4256ccba8a989ba42ddab621243652bae7343a1224343d68293860f'
            '016db1860a8b36d408c827f90aeb04b9d55cf21ea36788a9d8510cc54fae1c49'
            'c1a74303d9e870918bd8068f761c8251b996694b1b96b3537fbca317679c4958'
            '54603a788b4ecad5d0a92e5b7fe37a98979250d2b5fd7d037759b4254b0b1607'
            'e1cf2a280d90a55710131bdf33f4026a427d10131ddd5c776a936ee1ecf5a6fb'
            '1767e0fb284da83a2ca9858275b2e6099d02a737924e9a0f7931e50f535a49a0')
else
sha256sums=('0531f2be80ff31ac82e79a762c767865644618264b15cdfcf9725b087b12e54c'
            '016db1860a8b36d408c827f90aeb04b9d55cf21ea36788a9d8510cc54fae1c49'
            'c1a74303d9e870918bd8068f761c8251b996694b1b96b3537fbca317679c4958'
            '54603a788b4ecad5d0a92e5b7fe37a98979250d2b5fd7d037759b4254b0b1607'
            'e1cf2a280d90a55710131bdf33f4026a427d10131ddd5c776a936ee1ecf5a6fb'
            '1767e0fb284da83a2ca9858275b2e6099d02a737924e9a0f7931e50f535a49a0')
fi

build() {
  cd pycharm-$_pkgver

  # compile PyDev debugger used by PyCharm to speedup debugging
  python2 helpers/pydev/setup_cython.py build_ext --build-temp build --build-lib .
  python3 helpers/pydev/setup_cython.py build_ext --build-temp build --build-lib .
  
  rm -rf bin/fsnotifier{,-arm} lib/libpty/linux/x86
}

package() {
  # base
  install -dm 755 $pkgdir/opt/$pkgname
  cp -dr --no-preserve=ownership $srcdir/pycharm-$_pkgver/* $pkgdir/opt/$pkgname
  install -dm 755 $pkgdir/usr/share/{applications,pixmaps}
  install -dm 755 $pkgdir/usr/bin/
  install -Dm 644 $pkgdir/opt/$pkgname/bin/pycharm.png $pkgdir/usr/share/pixmaps/pycharm.png
  
  # licenses
  install -dm 755 $pkgdir/usr/share/licenses/$pkgname/
  cp -dr --no-preserve=ownership $srcdir/pycharm-$_pkgver/license/* $pkgdir/usr/share/licenses/$pkgname
  
  # exec
  install -Dm 755 pycharm $pkgdir/usr/bin/
  
  # app file desktop
  install -Dm 644 pycharm-professional.desktop $pkgdir/usr/share/applications/
  
  # install charm application - for edit a single file in Pycharm
  install -Dm 755 charm $pkgdir/opt/pycharm-professional/bin/
  install -Dm 644 charm.desktop $pkgdir/usr/share/applications/
}
