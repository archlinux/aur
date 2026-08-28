# Maintainer: Bink
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tobias T. <OldShatterhand at gmx-topmail dot de>
# Contributor: SanskritFritz (gmail)

pkgname=bibletime-git
_gitname="bibletime"
pkgver=3.2.0.r25
pkgrel=1
epoch=2
pkgdesc="A Bible study application based on the Sword library and Qt toolkit."
arch=('x86_64' 'i686')
url="https://bibletime.info/"
license=('GPL-2.0-only')
depends=(
  'sword>=1.8.1'
  'clucene>=2.3.3.4'
  'qt6-speech'
  'qt6-webengine>=6.7'
  'qt6-svg>=6.7'
)
makedepends=(
  'cmake>=3.25'
  'docbook-xsl'
  'expac'
  'fop'
  'git'
  'po4a'
  'qt6-tools>=6.7'
)
provides=('bibletime')
conflicts=('bibletime')
source=("git+https://github.com/bibletime/bibletime.git")
md5sums=('SKIP')

pkgver() {
	git -C $_gitname describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.g.*//'
}

build() {
  local xsl_shared
  xsl_shared=/usr/share/xml/docbook/xsl-stylesheets-$(expac %v docbook-xsl | cut -d - -f 1)
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BT_DOCBOOK_XSL_HTML_CHUNK_XSL="$xsl_shared/html/chunk.xsl"
    -D BUILD_HANDBOOK_PDF=Off
    -D BUILD_HOWTO_PDF=Off
  )
  cmake -B build -S $_gitname -W no-dev "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

