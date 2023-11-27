# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=string-machine
pkgname=$_pkgname-git
pkgver=0.1.0.r125.g7050cb1
pkgrel=2
pkgdesc="A virtual-analog string ensemble synthesizer LV2 and VST2 plugin (git version)"
arch=(i686 x86_64)
url="https://github.com/jpcima/string-machine"
license=(Boost)
depends=(glibc gcc-libs libx11 libxcursor libxext libxrandr)
makedepends=(boost cairo dbus git libglvnd)
groups=(lv2-plugins pro-audio vst-plugins)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/jpcima/$_pkgname.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git'
        'pugl::git+https://github.com/DISTRHO/pugl.git'
        'fix-missing-stdint-include.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '9c2d6ba762b64c395cb4eb35393eaaaca560692bf48513d34bf6c81fbe350cf5')

pkgver() {
  cd $_pkgname
  # See https://github.com/jpcima/string-machine/issues/3#issuecomment-512590428
  git describe --long --exclude latest | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url dpf "$srcdir"/dpf
  git -c protocol.file.allow=always submodule update
  cd dpf
  git submodule init
  git submodule set-url dgl/src/pugl-upstream "$srcdir"/pugl
  git -c protocol.file.allow=always submodule update
  cd ..
  patch -p1 -N -r - -i "$srcdir"/fix-missing-stdint-include.patch
}

build() {
  cd $_pkgname
  make
}

package() {
  depends+=(libcairo.so libdbus-1.so)
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
