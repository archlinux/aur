# Maintainer: Jat <chat@jat.email>

_pkgname='xorgxrdp'
pkgname="$_pkgname-nvidia"
pkgver=0.2.18.r46.gbf49ee1
pkgrel=1
pkgdesc='Xorg drivers for xrdp, with NVIDIA GPU support.'
arch=('i686' 'x86_64')
url='https://github.com/neutrinolabs/xorgxrdp'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('NVIDIA-MODULE')
makedepends=('nasm' 'xorg-server-devel' 'xrdp-git')
options=('staticlibs')
source=("git+$url#branch=devel"
        "nvidia.patch::$url/pull/220.diff")
sha256sums=('SKIP'
            'a378cd24bcbf0d65394175b2c06096c701c367d69662ed893d0941443c3e7965')
install="$pkgname.install"

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  patch -p1 -i"$srcdir/nvidia.patch"

  busid=$(nvidia-xconfig --query-gpu-info | grep -im1 busid | awk '{print $NF}')
  perl -i -pe 's/(?<=BusID ").+(?=")/'"$busid"'/' xrdpdev/xorg_nvidia.conf
}

build() {
  cd "$srcdir/$_pkgname"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 'COPYING' -t "$pkgdir/usr/share/licenses/$_pkgname"
}
