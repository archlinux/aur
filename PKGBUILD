# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=flightgear-git
pkgver=2020.4.0r15830.5d6ac7a1c
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator"
arch=('x86_64')
url="https://home.flightgear.org"
license=('GPL')
depends=('libxmu' 'libxi' 'zlib' 'openscenegraph' 'libxrandr' 'glu' 'openal' 'osgxr')
makedepends=('boost' 'cmake' 'git' 'mesa' 'sharutils' 'simgear' 'qt5-base' 'qt5-declarative' 'qt5-svg')
optdepends=('qt5-base: fgfs --launcher'
            'qt5-declarative: fgfs --launcher'
            'flightgear-data')
provides=("flightgear=${pkgver}")
conflicts=('flightgear')
source=("flightgear::git+https://git.code.sf.net/p/flightgear/flightgear#branch=next")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/flightgear
  printf "%sr%s.%s" \
    "$(tr -d '\n' < flightgear-version)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/flightgear
  sed -i 's|Exec=.*|Exec=fgfs --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop
}

build() {
  mkdir -p "$srcdir"/flightgear-build
  cd "$srcdir"/flightgear-build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DFG_DATA_DIR:STRING="/usr/share/flightgear/data" \
    -DCMAKE_BUILD_TYPE=Release \
    -DFG_BUILD_TYPE=Release \
    ../flightgear
  make
}

package() {
  cd "$srcdir"/flightgear-build
  make DESTDIR="$pkgdir" install

  cd "$srcdir"/flightgear
  install -Dm0644 package/flightgear.ico "$pkgdir"/usr/share/icons/flightgear.ico
  install -Dm0644 scripts/completion/fg-completion.bash "$pkgdir"/usr/share/bash-completion/completions/fgfs
  install -Dm0644 scripts/completion/fg-completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_fgfs
  ln -sf flightgear "$pkgdir"/usr/share/FlightGear
}

