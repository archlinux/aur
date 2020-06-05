# Maintainer: fuan_k <rrkay at posteo dot net>
# Maintainer: Bijaya Dangol <dangoldbj23@gmail.com>
# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=dupeguru
pkgver=4.0.4
pkgrel=2
pkgdesc="Find duplicate files on your system"
arch=(any)
url="https://dupeguru.voltaicideas.net/"
license=('BSD')
depends=('python' 'python-pyqt5' 'libxkbcommon-x11' 'python-send2trash')
makedepends=(
    python-sphinx
)
source=(
    https://github.com/arsenetar/${pkgname}/releases/download/${pkgver}/dupeguru-src-${pkgver}_RC.tar.gz
)
md5sums=(
 '85184ae7fa32a917541d359638123767'
)
provides=("dupeguru")
conflicts=("dupeguru-se" "dupeguru-pe" "dupeguru-me")

prepare() {
  cd "$srcdir"
  sed -i "s/hsaudiotag3k>=1.1.3/hsaudiotag3k>=1.1.*/g" requirements.txt
}

build() {
  cd "$srcdir"
  # Instead of doing the full ./bootstrap.sh
  python3 -m venv env --system-site-packages
  source env/bin/activate
  #python -m pip install --no-index --find-links=deps -r requirements.txt
  ./env/bin/pip install -r requirements.txt
  source env/bin/activate
  msg "Starting build..."
  python build.py --clean
}

package() {
  cd "$srcdir"
  
  cp -R "help" "build"
  cp -R "locale" "build"
  python package.py --arch-pkg
  cd "build/${pkgname}-arch"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv ${pkgname}.desktop "${pkgdir}/usr/share/applications"
  
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -a * "$pkgdir/usr/share/${pkgname}/"
  chmod a+x "$pkgdir/usr/share/${pkgname}/run.py"
  
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/${pkgname}/run.py "$pkgdir/usr/bin/${pkgname}"
}
