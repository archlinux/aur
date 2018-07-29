# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Cedric Leporcq <cedric at gmail dot com>

_pkgname=xfce4-windowck-plugin
pkgname=${_pkgname}-git
pkgver=0.4.4+18+ge0f96f5
pkgrel=1
pkgdesc="Xfce panel plugin which allows to put the maximized window title and buttons on the panel."
arch=('i686' 'x86_64')
url="https://github.com/cedl38/xfce4-windowck-plugin"
license=('GPL3')
groups=('xfce4')
depends=('xfce4-panel')
makedepends=('intltool' 'xfce4-dev-tools' 'python3' 'imagemagick')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
options=('!libtool')
source=("${_pkgname}::git+https://github.com/cedl38/${_pkgname}"
        'window_dragging.patch::https://github.com/t184256/xfce4-windowck-plugin/commit/27a6dbd42e4ecd1d87290cd5fbcedb51f50531b3.patch')
sha256sums=('SKIP'
            '9d3bc7320f1ba4c68a17a76d47ac76b4b56cba375274539bd3c9ea19ace59ac2')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}-::;s:^v::;s/-/+/g"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # Hasn't actually been ported to GTK3 yet
  sed -i 's:libxfce4panel-2.0:libxfce4panel-1.0:' configure.ac.in
  # Add window dragging patch from t184256
  patch -Np1 -i ../window_dragging.patch
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
