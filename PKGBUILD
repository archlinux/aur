# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Jonathan la Cour <jon@lacour.me>
# Contributor: Pieter Kokx <pieter@kokx.nl>

pkgname=armory-goatpig-git
_name=${pkgname%-*-*}
_py2ver=$(pacman -Qi python2 | sed -n 's/\(.*Version *: \)\(.*\..*\)\(\..*\)/\2/p')
pkgver=v0.96.5.r0.g1d02a664
pkgrel=2
pkgdesc="Armory Bitcoin wallet, built from new, official github repo w/auto selection of current python2 version"
arch=('i686' 'x86_64')
url="https://github.com/goatpig/BitcoinArmory"
license=('AGPL3')
depends=('crypto++' 'swig' 'python2' 'qt4' 'python2-pyqt4' 'python2-bsddb' 'python2-psutil' 'rsync' 'python2-sip-pyqt4')
makedepends=('git' 'gcc' 'make')
optdepends=('bitcoin-daemon: Communicate with the Bitcoin network')
install="${_name}.install"
provides=('armory')
conflicts=('armory' 'armory-git' 'armory-bin')
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --tags --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_name"
  git submodule update --init
  PYTHON_VERSION="$_py2ver" "$srcdir/$_name/autogen.sh"
  sed -i -- 's/lrelease/lrelease-qt4/g' "$srcdir/$_name/Makefile.am"
}

build() {
  cd "$srcdir/$_name"
  "$srcdir/$_name/configure" --prefix="/usr" PYTHON_VERSION="$_py2ver"
  PYTHON_VERSION="$_py2ver" make -j"$(nproc)"
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install

  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp "$pkgdir/usr/share/armory/img/armory_icon_fullres.png" \
     "$pkgdir/usr/share/pixmaps/armory.png"
  cp "$pkgdir/usr/share/armory/img/armory_icon_green_fullres.png" \
     "$pkgdir/usr/share/pixmaps/armory_green.png"

  desktop-file-install -m 644 \
  --set-key="Exec" --set-value="/usr/bin/armory" \
  --set-icon="/usr/share/pixmaps/armory.png" \
  --dir="$pkgdir/usr/share/applications/" \
  "$srcdir/$_name/dpkgfiles/armory.desktop"

  desktop-file-install -m 644 \
  --set-key="Exec" --set-value="/usr/bin/armory --offline" \
  --set-icon="/usr/share/pixmaps/armory.png" \
  --dir="$pkgdir/usr/share/applications/" \
  "$srcdir/$_name/dpkgfiles/armoryoffline.desktop"

  desktop-file-install -m 644 \
  --set-key="Exec" --set-value="/usr/bin/armory --testnet" \
  --set-icon="/usr/share/pixmaps/armory_green.png" \
  --dir="$pkgdir/usr/share/applications/" \
  "$srcdir/$_name/dpkgfiles/armorytestnet.desktop"
}
