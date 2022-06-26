# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname=vym-git
_pkgname=vym
pkgver=2.8.8.r152.gc9cd339
pkgrel=1
pkgdesc='A tool to generate and manipulate maps which show your thoughts'
arch=('x86_64')
url='https://sourceforge.net/projects/vym/'
depends=('qt5-svg' 'qt5-script' 'desktop-file-utils' 'hicolor-icon-theme' 'bash' 'ruby')
makedepends=('git' 'qt5-tools')
license=('GPL')
source=(
  "${_pkgname}::git+https://github.com/insilmaril/vym.git#branch=develop"
  'vym.desktop'
)
noextract=()
sha256sums=(
  'SKIP'
  'e299c69c213e7aac3f5b5d0ab088132b4ec7cb63a391f272e75ed64f049d541b'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}/lang"

  lrelease *.ts
}

build() {
  cd "${srcdir}/${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install

# install documentation
  install -Dm644 "${srcdir}"/$_pkgname/doc/$_pkgname.1.gz \
    "${pkgdir}"/usr/share/man/man1/$pkgname.1.gz
  install -Dm644 "${srcdir}"/$_pkgname/doc/$_pkgname.pdf \
    "${pkgdir}"/usr/share/doc/$_pkgname/$_pkgname.pdf
  rm -rf "${pkgdir}"/usr/share/doc/packages

# .desktop and icon file
  install -Dm644 "${srcdir}"/$_pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$_pkgname.desktop
  install -Dm644 "${srcdir}"/$_pkgname/icons/${_pkgname}.png \
    "${pkgdir}"/usr/share/pixmaps/$_pkgname.png
}
