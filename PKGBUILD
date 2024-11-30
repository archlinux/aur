# Maintainer: Craig <fast dot code dot studio at gmail dot com>

pkgname='rsl-git'
provides=('rsl')
pkgver=1.50.r10
pkgrel=1
pkgdesc="Radar Software Library"
arch=('aarch64' 'x86_64')
url="http://pileus.org/aweather/rsl"
license=('GPL2')
source=("git+https://github.com/i3Craig/rsl.git")
sha512sums=('SKIP')

# Generate a version number based on the number of commits to the default branch.
pkgver() {
  cd rsl
  printf "1.50.r%s" "$(git rev-list --count HEAD)"
}

prepare() {
  cd rsl

  # Regenerate auto-generated files with the latest version of automake tools available on this system.
  # This prevents version mismatch errors when running 'make' below if automake versions change.
  autoreconf -ifv

  # Tell the configure script where the tirpc library is located at so rsl can compile and link correctly.
  ./configure LDFLAGS="-ltirpc" CFLAGS="-I/usr/include/tirpc/" --prefix=/usr
}

build() {
  cd rsl
  make
}

package() {
  cd rsl
  # We set prefix to /usr above so the .h files and .c files reference /usr/xxxx to find necessary files.
  # We override prefix here to force all installed .h files to be copied to the PKGDIR. Setting DESTDIR="$pkgdir}" results in the makefile copying rsl.h to /usr/include, which won't work.
  make prefix="${pkgdir}/usr" install
}
