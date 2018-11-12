# Maintainer: fuan_k <rrkay at posteo dot net>
# Maintainer: Bijaya Dangol <dangoldbj23@gmail.com>
# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=dupeguru
pkgver=4.0.3
pkgrel=5
pkgdesc="Find duplicate files on your system"
arch=(any)
url="https://dupeguru.voltaicideas.net/"
license=('BSD')
depends=('python' 'python-pyqt5' 'libxkbcommon-x11' 'python-polib' 'python-send2trash' 'python-hsaudiotag3k')
makedepends=(
    python-sphinx
)
source=(
    https://download.hardcoded.net/$pkgname-src-$pkgver.tar.gz
)
md5sums=(
'ed3b4a049c436cacb0a068438a8d6131'
)
provides=("dupeguru")
conflicts=("dupeguru-se" "dupeguru-pe" "dupeguru-me")

prepare(){
  # Temporary fix for python3.7 handling of old syntax
  cd "$srcdir"
  sed -i -e '277 a\\            try:'\
 -e '278s/^/    /'\
 -e '279s/^/    /'\
 -e '280s/^/    /'\
 -e '280a\\            except StopIteration:'\
 -e '280a\\                return' hscommon/build.py
}

build() {
  cd "$srcdir"
  python3 -m venv env --system-site-packages
  source env/bin/activate
  python -m pip install --no-index --find-links=deps -r requirements.txt
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
