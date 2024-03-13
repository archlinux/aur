# Maintainer: bkuri <aur+nzbget-git@bkuri.com>
# Contributor: selfdenial <selfdenial@pm.me>
# Contributor: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=nzbget-git
pkgver=23.0.r2417.c93b551b
pkgrel=1
pkgdesc="Download from Usenet using .nzb files"
arch=('x86_64')
url="https://github.com/nzbgetcom/nzbget"
license=('GPL')
depends=('libxml2' 'openssl' 'boost-libs')
makedepends=('autoconf' 'git')
optdepends=('python: run scripts'
            'unrar: unpacking archives' 
            'p7zip: unpacking archives' 
            'par2cmdline: verificate and repair PAR 2.0 files')
provides=('nzbget' 'nzbget-systemd')
conflicts=('nzbget' 'nzbget-systemd')
install=nzbget.install
source=("$pkgname::git+https://github.com/nzbgetcom/nzbget.git#branch=develop"
        "nzbget.service")
sha256sums=('SKIP'
            'e92d2d09e56930475c9f28641a3326a17aa187834e1bd6328a65b6ed7cc25e99')

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed 's/^v//;s/-.*//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  autoreconf --install
  ./configure --prefix=/usr --sbindir='/usr/bin' --enable-parcheck --with-tlslib=OpenSSL
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install

  install -d "${pkgdir}/usr/share/nzbget"
  install -m 644 -t "${pkgdir}/usr/share/nzbget" README.md

  cd "$srcdir"

  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" nzbget.service
  install -dm 750 "${pkgdir}/var/lib/nzbget"
}
