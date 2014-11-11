# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Joker-jar <joker-jar@yandex.ru>

pkgname="psi-plus-git"
pkgver=0.16.424
pkgrel=1
pkgdesc="Psi+ is a powerful Jabber client (Qt, C++) designed for the Jabber power users"
url="http://psi-plus.com"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt4' 'qca-ossl' 'libidn' 'aspell' 'libxss' 'openssl' 'dbus' 'zlib')
makedepends=('git' 'patch' 'qconf')
optdepends=('qca-gnupg: encrypted client-to-client connection')
provides=("psi-plus=$pkgver")
replaces=('psi-plus' 'psi-plus-webkit-git')
conflicts=('psi-plus' 'psi-plus-webkit-git')
source=('git://github.com/psi-im/psi.git'
	'psi-plus::git://github.com/psi-plus/main.git'
	'git://github.com/psi-im/iris.git'
	'git://github.com/psi-im/libpsi.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd psi-plus

  git describe --tags | cut -d - -f 1-2 --output-delimiter=.
}

prepare() {
  cd psi

  # makepkg doesn't support --recursive
  # so setup git modules manually
  git submodule init
  git config submodule.iris.url "$srcdir/iris"
  git config submodule.src/libpsi.url "$srcdir/libpsi"
  git submodule update

  # patches from Psi+ project
  for patch in "$srcdir"/psi-plus/patches/*.diff; do
    patch -p1 -i "$patch"
  done

  # additional icon themes
  cp -a "$srcdir/psi-plus/iconsets" .

  # make build date in --version output a bit more readable
  #sed "s/yyyyMMdd/yyyy-MM-dd/" -i qcm/conf.qcm
  echo "$pkgver ($(date +"%Y-%m-%d"))" >version
}

build() {
  cd psi

  qconf
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --enable-plugins \
              --disable-enchant # enchant spell engine doesn't support multi-language spelling, use aspell instead
  make
}

package() {
  cd psi

  make INSTALL_ROOT="$pkgdir" install

  install -dm755 "$pkgdir/usr/include/psi-plus/plugins"
  install -m644 src/plugins/include/*.h "$pkgdir/usr/include/psi-plus/plugins"
}

