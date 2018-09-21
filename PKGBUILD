# Maintainer: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=flightgear-git
pkgver=2018.4.0r13763.2140d23b0
_pkgver=2018.4.0
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator"
arch=('x86_64')
url="https://home.flightgear.org"
license=('GPL')
depends=('libxmu' 'libxi' 'zlib' 'libxrandr' 'glu' 'glew' 'openal' 'openscenegraph' 'subversion')
makedepends=('boost' 'cmake' 'mesa' 'sharutils' 'simgear-git' 'qt5-base' 'qt5-declarative' 'qt5-tools')
optdepends=('qt5-base: fgfs --launcher'
            'qt5-declarative: fgfs --launcher'
            'qt5-tools: fgfs --launcher'
            'flightgear-data-git')
provides=('flightgear=2018.4.0')
conflicts=('flightgear')
source=("flightgear::git+https://git.code.sf.net/p/flightgear/flightgear#branch=next")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%sr%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DFG_DATA_DIR:STRING="/usr/share/flightgear/data" \
    -DCMAKE_BUILD_TYPE=Release \
    -DFG_BUILD_TYPE=Release \
    .
  make
  sed -i 's|Exec=.*|Exec=fgfs --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install

  install -Dm0644 package/flightgear.ico "$pkgdir"/usr/share/icons/flightgear.ico
  install -Dm0644 scripts/completion/fg-completion.bash "$pkgdir"/usr/share/bash-completion/completions/fgfs
  install -Dm0644 scripts/completion/fg-completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_fgfs
  ln -sf flightgear "$pkgdir"/usr/share/FlightGear
}

