# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: bohoomil <@zoho.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
_pkgbasename=fontconfig
pkgname=lib32-$_pkgbasename-infinality
pkgver=2.13.1+12+g5f5ec56
pkgrel=1
pkgdesc="A library for configuring and customizing font access (32-bit)"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=(custom MIT)
groups=(infinality-bundle-multilib)
depends=(lib32-expat lib32-freetype2-infinality $_pkgbasename-infinality)
makedepends=(git autoconf-archive gperf python-lxml python-six lib32-json-c gcc-multilib lib32-expat)
install=lib32-fontconfig.install
options=('!libtool')
provides=(lib32-fontconfig)
conflicts=(lib32-fontconfig)
_commit=5f5ec5676c61b9773026a9335c9b0dfa73a73353  # master
source=("git+https://anongit.freedesktop.org/git/fontconfig#commit=$_commit"
        fontconfig-32.hook)
sha256sums=('SKIP'
            'd97c0c5b88023da5a2acf64cf560265390a9365305c43b8e86b4f89348e727b3')

# a nice page to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
# http://getemoji.com/

pkgver() {
  cd $_pkgbasename
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgbasename
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgbasename

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --with-templatedir=/etc/fonts/conf.avail \
    --with-xmldir=/etc/fonts \
    --localstatedir=/var \
    --disable-static \
    --disable-docs \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/local/share/fonts
  make
}

check() {
  cd $_pkgbasename
  make -k check
}

package() {
  cd $_pkgbasename
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/{etc,usr/{include,share}}
  find "$pkgdir/usr/bin" -not -type d -not -name fc-cache -delete
  mv "$pkgdir"/usr/bin/fc-cache{,-32}

  install -Dm644 ../fontconfig-32.hook "$pkgdir/usr/share/libalpm/hooks/fontconfig-32.hook"

  # Install license
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
