# Maintainer: fuan_k <rrkay at posteo dot net>
# Maintainer: Bijaya Dangol <dangoldbj23@gmail.com>
# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=dupeguru
pkgver=4.1.0
_pkgver="${pkgver}-alpha"
pkgrel=2
pkgdesc="Find duplicate files on your system"
arch=('x86_64')
url="https://dupeguru.voltaicideas.net/"
license=('GPL3')
depends=('python' 'python-pyqt5' 'libxkbcommon-x11')
makedepends=('python-sphinx')
source=(
    https://github.com/glubsy/${pkgname}/releases/download/${_pkgver}/dupeguru-src-${_pkgver}.tar.xz
)
md5sums=(
 '6faf275a1e1be0c42e5faa32d2ddf7ab'
)
provides=("dupeguru")
conflicts=("dupeguru-git" "dupeguru-se" "dupeguru-pe" "dupeguru-me")

prepare() {
  cd "${srcdir}"
  sed -i "s/hsaudiotag3k>=1.1.3/hsaudiotag3k>=1.1.*/g" requirements.txt
  # replace hardcoded icon path in .desktop file
  sed -i "s/\(.*iconpath.*\"\).*\"/\1dupeguru\"/g" pkg/arch/dupeguru.json
}

build() {
  cd "${srcdir}"
  # Instead of doing the full ./bootstrap.sh
  python3 -m venv env --system-site-packages
  source env/bin/activate
  python3 -m pip install -r requirements.txt
  msg "Starting build..."
  python build.py --clean
}

package() {
  cd "${srcdir}"
  
  cp -R "help" "build"
  cp -R "locale" "build"
  python package.py --arch-pkg
  cd "build/${pkgname}-arch"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv ${pkgname}.desktop "${pkgdir}/usr/share/applications"
  
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -a * "${pkgdir}/usr/share/${pkgname}/"
  chmod a+x "${pkgdir}/usr/share/${pkgname}/run.py"
  
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  ln -s "/usr/share/${pkgname}/dgse_logo_128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s ../share/${pkgname}/run.py "${pkgdir}/usr/bin/${pkgname}"
}
