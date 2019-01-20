# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-ssh
pkgver=0.11.3
pkgrel=3
pkgdesc='SSH module for Guile based on libssh'
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/artyom-poptsov/guile-ssh"
license=('GPL3')
depends=(
  'guile>=2.0.9'
  'libssh>=0.7.3')
source=(
  "https://github.com/artyom-poptsov/guile-ssh/archive/v${pkgver}.tar.gz"
  'guile-ssh-tests-server-fix-libssh-0.8.patch')
sha256sums=(
  '1373bf6f30ba9b4404c044fb00c0509cbd851606264803faccbf881b1efb52bc'
  '96c6f1a6c460fbc6f5c3b78168c9ce9cc297bd2c6f74aecdfdbc7695609e1153')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/${source[1]}"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's|-lssh_threads||' libguile-ssh/Makefile.am
	autoreconf -fi
	./configure --prefix=/usr --disable-rpath
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
