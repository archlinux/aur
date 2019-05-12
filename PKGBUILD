# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>
# Contributor: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=nzbget-git
pkgver=21.0.r2309.5dda6b2e
pkgrel=1
epoch=1
pkgdesc="Download from Usenet using .nzb files"
arch=('x86_64')
url="https://github.com/nzbget/nzbget"
license=('GPL')
depends=('libxml2')
makedepends=('git')
optdepends=('python: run scripts'
            'unrar: unpacking archives' 
            'p7zip: unpacking archives' 
            'par2cmdline: verificate and repair PAR 2.0 files')
provides=('nzbget'
          'nzbget-systemd')
conflicts=('nzbget')
install=nzbget.install
source=("$pkgname::git+https://github.com/nzbget/nzbget.git#branch=develop"
        "nzbget.service")
sha256sums=('SKIP'
            '66b2c2fbe949f6406a49674d28a2bdd258b20780ba47a586b640d6cc4d99f7c2')

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed 's/^v//;s/-.*//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

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
