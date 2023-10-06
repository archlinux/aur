# Maintainer: selfdenial <selfdenial@pm.me>
# Contributor: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=nzbget-git
pkgver=21.4.r2400.c6db0ecb
pkgrel=1
epoch=1
pkgdesc="Download from Usenet using .nzb files"
arch=('x86_64')
url="https://github.com/nzbget-ng/nzbget"
license=('GPL')
depends=('libxml2')
makedepends=('git'
             'autoconf')
optdepends=('python: run scripts'
            'unrar: unpacking archives' 
            'p7zip: unpacking archives' 
            'par2cmdline: verificate and repair PAR 2.0 files')
provides=('nzbget'
          'nzbget-systemd')
conflicts=('nzbget'
           'nzbget-systemd')
install=nzbget.install
source=("$pkgname::git+https://github.com/nzbget-ng/nzbget.git#branch=develop"
        "nzbget.service")
sha256sums=('SKIP'
            '4f8b03b7a52bfb7595c73cb551d2f75bde4a68c4916e4a28dbd359cd4184f097')

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
  install -m 644 -t "${pkgdir}/usr/share/nzbget" README

  cd "$srcdir"

  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" nzbget.service
  
  install -dm 750 "${pkgdir}/var/lib/nzbget"
}
