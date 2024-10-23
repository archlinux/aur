# Maintainer: David Runge <dave@sleepmap.de>
pkgname=iannix
_name=IanniX
pkgver=0.9.20b
_ver=${pkgver/b/-b}
pkgrel=4
pkgdesc="A graphical open-source sequencer, based on Iannis Xenakis works, for digital art"
arch=(x86_64)
url="https://www.iannix.org/"
license=(GPL-3.0-or-later)
groups=(pro-audio)
depends=(
  alsa-lib
  gcc-libs
  glibc
  libglvnd
  qt5-base
  qt5-script
)
makedepends=(qt5-tools)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/buzzinglight/${pkgname}/archive/v${pkgver/b/-b}.tar.gz
  $pkgname-0.9.20b-qt5.patch::https://github.com/buzzinglight/IanniX/commit/40bf5fdd5f6a48737671edfada2c2b3168339d1f.patch
  desktop.patch
  fix_paths.patch
  fix_spelling_errors.patch
  privacy.patch
)
sha512sums=('9c46250bce9550abc4ece11720616f217513aefd62a7144f7aebdaf2e11b938dc2a551d066b748089bafffd8f7d9659e8b79f6318e250e522cf608f861951c90'
            'd4dd2f3ad80a9cb8fcd99bab0d2cf7dce05c45cc8f2ec2c235b7b440ced071657293d8f4034febdbb5a288844615eec91812f95e40a8b5938f4c66dc30f3f199'
            '4f869a73813fc37106203aed9b3938ae6f5f53cad7322f71fba44a047c32ab93f8b4fdef65804b1f63f7f26781e2505672b553ee7c9baddb82f01bdc36f870f3'
            'ec8bffcea7468e3a41a9f110f9a7a2e875b20015db35e884d47e6a21f6d90a87d560e6ed3e73aeacdf9ac98f7cff28d1e8d1ccba1130b2a569a47a416149353a'
            '88f40ff54f8c50f6b07e2620dd5029686e2d6868f908038903384e845c6a81edc346eae73cf1d1777d6709b78723bcc52cccb1f6707e1d17b2162001e8903c0c'
            'fb4a64ac67ddf79ba7e9caaefebb570fcdfcb8321a77de62a37759f241036ac45c6dbde26907880f19bfef784417eec13b8b8c5bebfdb25c30bd5a2d50d1b00e')
_dir=$_name-$_ver

prepare() {
  patch -Np1 -d $_dir -i ../$pkgname-0.9.20b-qt5.patch
  patch -Np1 -d $_dir -i ../privacy.patch
  patch -Np1 -d $_dir -i ../desktop.patch
  patch -Np1 -d $_dir -i ../fix_spelling_errors.patch
  patch -Np1 -d $_dir -i ../fix_paths.patch
}

build() {
  cd $_dir
  PREFIX="/usr" qmake-qt5
  make
}

package() {
  cd $_dir
  make INSTALL_ROOT="$pkgdir/" install
  # examples, patches and tools
  install -d 755 "$pkgdir/usr/share/$pkgname/"
  cp -av {Examples,Patches,Tools} "$pkgdir/usr/share/$pkgname/"
  # docs
  install -vDm 644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
