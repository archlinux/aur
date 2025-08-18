pkgname='flightgear'
pkgver=2024.1.1
_pkgver=2024.1.1
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator"
arch=('x86_64')
depends=('libxmu' 'libxi' 'zlib' 'openscenegraph' 'libxrandr' 'glu' 'openal' 'simgear' 'ffmpeg')
makedepends=('boost' 'cmake' 'mesa' 'sharutils' 'qt5-base' 'qt5-declarative' 'qt5-svg')
optdepends=('qt5-base: fgfs --launcher'
            'qt5-declarative: fgfs --launcher'
            'flightgear-data')
license=("GPL")
url="http://www.flightgear.org/"
source=("https://gitlab.com/flightgear/flightgear/-/archive/v2024.1.1/flightgear-v2024.1.1.tar.gz"
        "fix-openal-header.patch")
sha256sums=('8a5410d7894d942bd2feed60c09d601bc46a670707ded771c6daf6ee7114655a'
            '1869a10b8e6cd39128ec07115daeef01a6f586926bd4e1e8c4253426f885d1a7')

prepare() {
  cd "$srcdir"/flightgear-v$pkgver
  sed -i 's|Exec=.*|Exec=fgfs --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop.in
  cd $srcdir/flightgear-v${_pkgver}
  patch -p1 -i $srcdir/fix-openal-header.patch
}

build() {
  mkdir -p "$srcdir"/fgbuild
  cd "$srcdir"/fgbuild
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFG_DATA_DIR:STRING="/usr/share/flightgear/data" \
    -DCMAKE_BUILD_TYPE=Release \
    ../flightgear-v$pkgver
  make
}

package() {
  cd "$srcdir"/fgbuild
  make DESTDIR=${pkgdir} install

  cd "$srcdir"/flightgear-v$pkgver
  install -Dm0644 package/flightgear.ico "$pkgdir"/usr/share/icons/flightgear.ico
  install -Dm0644 scripts/completion/fg-completion.bash "$pkgdir"/usr/share/bash-completion/completions/fgfs
  install -Dm0644 scripts/completion/fg-completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_fgfs
  ln -sf flightgear "$pkgdir"/usr/share/FlightGear
}
