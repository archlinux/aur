# Maintainer: fuan_k <rrkay at posteo dot net>
# Maintainer: Bijaya Dangol <dangoldbj23@gmail.com>
# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=dupeguru
pkgver=4.1.0
pkgrel=3
pkgdesc="Find duplicate files with various contents, using perceptual diff for pictures"
arch=('any')
url="https://dupeguru.voltaicideas.net/"
license=('GPL3')
depends=('python' 'python-pyqt5' 'libxkbcommon-x11')
makedepends=('python-sphinx')
source=( https://github.com/arsenetar/${pkgname}/archive/${pkgver}.tar.gz )
md5sums=('eee02386ea18f592502c05049eda9f99')
provides=("dupeguru")
conflicts=("dupeguru-git" "dupeguru-se" "dupeguru-pe" "dupeguru-me")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Instead of doing the full ./bootstrap.sh
  python3 -m venv env --system-site-packages
  source env/bin/activate
  # FIXME use available packages from the AUR instead of pypi
  msg "Installing dependencies in a virtual environment..."
  python3 -m pip install -r requirements.txt
  msg "Starting build..."
  python build.py --clean
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  cp -R "help" "build"
  cp -R "locale" "build"
  msg "Starting package..."
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
