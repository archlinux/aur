# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Jesse Young <jesse.young@gmail.com>

pkgname=namcap-git
pkgver=3.4.0.r28.g57d1463
pkgrel=1
pkgdesc="A Pacman package analyzer"
arch=('any')
url="https://gitlab.archlinux.org/pacman/${pkgname%-git}"
license=('GPL')
depends=(binutils
         elfutils
         licenses
         pkgconfig
         python
         pyalpm
         python-pyelftools)
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest
              python-six
              systemd)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python -m build -wn
}

check() {
  cd "${pkgname%-git}"
  env PARSE_PKGBUILD_PATH="$PWD" PATH="$PWD/scripts:$PATH" pytest
}

package() {
  cd "${pkgname%-git}"
  python -m installer -d "$pkgdir" dist/*.whl
  local site_packages
  site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  mv "$pkgdir/"{"$site_packages/usr/share",usr}""
  rm -r "${pkgdir:?}/${site_packages}/usr"
}
