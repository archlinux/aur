# Maintainer: Joel Ong <joel.hp+arch at gmail dot com>
# Originally written by Nathan Whitehead <nwhitehe at gmail dot com>

_GTK3=1
options=('!buildflags')
_opts=(
	-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
)

pkgname='pineapple'

makedepends=('cmake' 'lessc' 'git')
depends=('python')

if (("${_GTK3}" == 0));then
	depends+=('wxgtk2' 'webkitgtk2')
	_opts+=(-DwxWidgets_CONFIG_OPTIONS="--toolkit=gtk2")
else
	_opts+=(-DwxWidgets_CONFIG_OPTIONS="--toolkit=gtk3")
	depends+=('wxgtk3' 'webkit2gtk')
fi

pkgver=0.8.0
pkgrel=2
pkgdesc="wxWidgets frontend for Jupyter Notebook, fork of project abandoned by original author (https://nwhitehead.github.io/pineapple/)"
url="https://github.com/darthoctopus/pineapple/tree/thin-client"
arch=('i686' 'x86_64')
license=('GPL3')

source=("git://github.com/darthoctopus/pineapple.git")

sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"
	git checkout thin-client
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git checkout thin-client > /dev/null
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake .. "${_opts[@]}"
  make
  make custom-install
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make install
}
