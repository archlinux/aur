# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=pycharm-professional
pkgver=2017.3.1
_pkgver=2017.3.1
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
sha256sums=('259f22a8b291246b8550cadf4a4b6f235917c7b46262be7eb637058d8f5e6ac0'
            '016db1860a8b36d408c827f90aeb04b9d55cf21ea36788a9d8510cc54fae1c49'
            'c1a74303d9e870918bd8068f761c8251b996694b1b96b3537fbca317679c4958'
            '54603a788b4ecad5d0a92e5b7fe37a98979250d2b5fd7d037759b4254b0b1607'
            'e1cf2a280d90a55710131bdf33f4026a427d10131ddd5c776a936ee1ecf5a6fb'
            '675a2a9f94baa4dd27d30cd3d1948a6ca1e8a3628722303ecd615fc4fe9b4798')
else
sha256sums=('d1bac035fb8b662727f84343ba4097f0acbfc99a0a5a8c0c94905300a021b2c1'
            '016db1860a8b36d408c827f90aeb04b9d55cf21ea36788a9d8510cc54fae1c49'
            'c1a74303d9e870918bd8068f761c8251b996694b1b96b3537fbca317679c4958'
            '54603a788b4ecad5d0a92e5b7fe37a98979250d2b5fd7d037759b4254b0b1607'
            'e1cf2a280d90a55710131bdf33f4026a427d10131ddd5c776a936ee1ecf5a6fb'
            '675a2a9f94baa4dd27d30cd3d1948a6ca1e8a3628722303ecd615fc4fe9b4798')
fi

package() {
  # compile PyDev debugger used by PyCharm to speedup debugging
  python2 pycharm-$_pkgver/helpers/pydev/setup_cython.py build_ext --inplace
  python3 pycharm-$_pkgver/helpers/pydev/setup_cython.py build_ext --inplace
  
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
  
  # delete some conflicts files for i686 
  if [[ $CARCH = 'i686' ]]; then
    rm -f $pkgdir/opt/$pkgname/bin/libyjpagent-linux64.so
    rm -f $pkgdir/opt/$pkgname/bin/fsnotifier64
  fi
  
}
