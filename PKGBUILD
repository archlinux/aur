# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cvassistant-git
pkgver=3.1.0.r156.7fd97f4
pkgrel=4
pkgdesc="Helps you create specialized resumes in Word .docx format fast and easy"
arch=('x86_64')
url="https://cvassistant.sourceforge.io"
license=('GPL-3.0-or-later')
depends=(
  'qt5-base'
  'quazip-qt5'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.code.sf.net/p/cvassistant/code.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "3.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  # Use quazip-qt5 instead of quazip-legacy
  sed -i 's|-lquazip5|-lquazip1-qt5|g' CVAssistant.pro
  sed -i 's|quazip5\/quazipfile.h|QuaZip-Qt5-1.5\/quazip\/quazipfile.h|g' \
    models/resumedocument.h
}

build() {
  cd "${pkgname%-git}"
  qmake-qt5
  make
}

package() {
  cd "${pkgname%-git}"
  make INSTALL_ROOT="$pkgdir" install
}
