# Maintainer: fuan_k <rrkay at posteo dot net>
# Contributor: Bijaya Dangol <dangoldbj23@gmail.com>
# Contributor: Virgil Dupras <hsoft@hardcoded.net>
pkgname=dupeguru
pkgver=4.1.1
pkgrel=1
pkgdesc="Find duplicate files with various contents, using perceptual diff for pictures"
arch=('any')
url="https://dupeguru.voltaicideas.net/"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-polib' 'python-send2trash' 'python-hsaudiotag3k'
         'libxkbcommon-x11')
makedepends=('python-distro' 'python-sphinx')
source=( https://github.com/arsenetar/${pkgname}/archive/refs/tags/${pkgver}.tar.gz )
md5sums=('a88af36a661c813874bb6a2b8d5becbc')
provides=("dupeguru")
conflicts=("dupeguru-git" "dupeguru-se" "dupeguru-pe" "dupeguru-me")

build() {
  cd "${pkgname}-${pkgver}"
  # Instead of doing the full ./bootstrap.sh
  python3 -m venv env --system-site-packages
  source env/bin/activate
  python3 -m pip install --no-index --find-links=deps -r requirements.txt
  msg "Starting build..."
  python build.py --clean
}

package() {
  cd "${pkgname}-${pkgver}"
  
  cp -R "help" "build"
  cp -R "locale" "build"
  python package.py --arch-pkg
  cd "build/${pkgname}-arch"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv ${pkgname}.desktop "${pkgdir}/usr/share/applications"
  
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -a -- * "${pkgdir}/usr/share/${pkgname}/"
  chmod a+x "${pkgdir}/usr/share/${pkgname}/run.py"
  
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  ln -s "/usr/share/${pkgname}/dgse_logo_128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s ../share/${pkgname}/run.py "${pkgdir}/usr/bin/${pkgname}"
}
