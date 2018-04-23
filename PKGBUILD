# Packager: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: archaurwiki <archaurwiki at i2pmail dot org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>

pkgname=monotone
pkgver=1.1
pkgrel=6
pkgdesc='A free distributed version control system'
arch=('i686' 'x86_64')
url='http://www.monotone.ca/'
license=('GPL')
depends=('pcre' 'lua' 'botan1.10' 'sqlite3' 'libidn' 'zlib')
makedepends=('boost')
source=("http://www.monotone.ca/downloads/1.1/monotone-${pkgver}.tar.bz2"
        "http://http.debian.net/debian/pool/main/m/monotone/monotone_1.1-9.debian.tar.xz")
sha256sums=('f95cf60a22d4e461bec9d0e72f5d3609c9a4576fb1cc45f553d0202ce2e38c88'
            '70a4e8fed56f4734de2192990db5e20fe8a8b819af51780df3d78310ee9eeeda')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  for _f in $(< ../debian/patches/series); do
    msg2 "Applying $_f"
    patch -Np1 < ../debian/patches/$_f
  done
  msg2 "Bootstrapping autoconf"
  aclocal
  autoreconf --install
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export DISABLE_NETWORK_TESTS=1
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-nls
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 contrib/monotone.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_mtn"
}

# vim: ts=2:sw=2:et
