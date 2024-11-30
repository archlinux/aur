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

  # Tell the configure script where the tirpc library is located (with LDFLAGS and CFLAGS) so rsl can compile and link correctly.
  # Set --exec_prefix and --prefix to 'hard-code' directory / file locations in the source code, including the wsr88d_locations.dat file.
  # We override these below in the 'make install' call to be in $pkgdir so that the object files, header files,
  # and data files are copied to the temp direcotry for packaging instead of the system /usr folder.
  ./configure LDFLAGS="-ltirpc" CFLAGS="-I/usr/include/tirpc/" --exec_prefix=/usr --prefix=/usr
}

build() {
  cd rsl
  make
}

package() {
  cd rsl
  make prefix="${pkgdir}/usr" exec_prefix="${pkgdir}/usr" install
}
