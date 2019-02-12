# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>
pkgname=sysexxer-ng-git
pkgver=r30.23dfc26
pkgrel=1
pkgdesc="A universal tool to exchange MIDI system-exclusive data"
arch=('i686' 'x86_64')
url="https://github.com/linuxmao-org/sysexxer-ng"
license=('Boost')
groups=()
depends=('fltk' 'jack' 'shared-mime-info')
makedepends=('git' 'cmake' 'gettext')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('sysexxer-ng::git+https://github.com/linuxmao-org/sysexxer-ng.git'
        'rtmidi::git+https://github.com/Wohlstand/rtmidi.git'
        'simpleini::git+https://github.com/jpcima/simpleini.git'
        'fmt::git+https://github.com/fmtlib/fmt.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=()

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule init
  for submodule in thirdparty/rtmidi thirdparty/simpleini; do
    git config "submodule.${submodule}.url" "${srcdir}/`basename "${submodule}"`"
  done
  git submodule update

  cd thirdparty/fmidi
  for submodule in thirdparty/fmt; do
    git config "submodule.${submodule}.url" "${srcdir}/`basename "${submodule}"`"
  done
  git submodule update
}

build() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make -C build DESTDIR="$pkgdir/" install
}
