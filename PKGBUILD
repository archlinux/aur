# Maintainer: Cynthetika <opensource AT cynthetika DOT com>

## CKA: Developer seems to have renamed it to "GhostCloud", but I am not certain.
##      For now, I shall name this package as per the XDG desktop file ("GhostCloud").
#pkgname=harbour-git
pkgname=ghostcloud-git
_pkgname=${pkgname%-git}
_gitname=harbour-owncloud
pkgver=0.9.9.r1.g5fbf320
pkgrel=1
pkgdesc="A modern cross-platform Qt client for Nextcloud, ownCloud & WebDav. Clean and simple interface, originally for SailfishOS and perfect for convergent/mobile devices."
arch=('any')
url="https://github.com/fredldotme/harbour-owncloud"
license=('GPL2')
depends=(
  'qt5-multimedia'
  'qt5-script'
)
makedepends=(
  'qt5-base'
  'qt5-declarative'
  'qt5-imageformats'
  'qt5-quickcontrols'
  'qt5-quickcontrols2'
  'qt5-svg'
  'qt5-tools'
  'qt5-x11extras'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("$_pkgname::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"

  # use latest tag with current commit ID appended (with fallback to commit count + latest commit)
  (
    set -o pipefail
    git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"

  # checkout Git sub-modules
  git submodule update --init --recursive

  # create build directory
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  # update translations into binary form
  ## CKA: disabled due to issues with Chinese translation file - not required anyhow
  #lupdate-qt5 ../${_pkgname}/${_gitname}.pro
  #lrelease-qt5 ../${_pkgname}/${_gitname}.pro

  # generate Makefile with qmake using build flags for GNU/Linux desktop configuration
  # and allow makepkg to handle stripping
  qmake-qt5 \
    PREFIX='/usr' \
    CONFIG+='nostrip' \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}" \
    CONFIG+=noadditionals \
    CONFIG+=quickcontrols \
    ../${_pkgname}/${_gitname}.pro

  # run build
  make -j $(nproc) prefix=/usr
}

package() {
  cd "$srcdir/build"

  # install built files into packaging directory (installs built binary, libraries and XDG desktop file)
  make INSTALL_ROOT="$pkgdir" install

  cd "$srcdir/$_pkgname"

  # install icons for XDG desktop file and general usage
  install -D -m644 "src/app/icons/${_gitname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_gitname}.svg"
  install -D -m644 "src/app/icons/icon_gray.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${_gitname}-symbolic.svg"
  ## CKA: odd selection of sizes appear to be due to original usage intended for SailfishOS (mobile) platform
  for i in 86 108 128 172; do
    install -D -m644 "src/app/icons/${i}x${i}/${_gitname}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_gitname}.png"
  done
  install -D -m644 "src/app/icons/${_gitname}_512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_gitname}.png"

  # install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install readme and changelog
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
}
