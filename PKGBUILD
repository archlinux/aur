# Maintainer: Craig <fast dot code dot studio at gmail dot com>

pkgname='rsl-git'
provides=('rsl')
pkgver=1.50.r24
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

  # Set --prefix to 'hard-code' directory / file locations in the source code, including the wsr88d_locations.dat file.
  # We override this below in the 'make install' call to be in $pkgdir so that the object files, header files,
  # and data files are copied to the temp direcotry for packaging instead of the system /usr folder.
  ./configure --prefix=/usr
}

build() {
  cd rsl

  # Tell make where the tirpc library is located (with CFLAGS) so rsl can compile and link correctly.
  # We pass along the values of CFLAGS and LDFLAGS as set in /etc/makepkg.conf so that the debug package
  # generates successfully (if enabled there).
  make LDFLAGS="$LDFLAGS" CFLAGS="$CFLAGS -I/usr/include/tirpc/"
}

package() {
  cd rsl
  # Note that if we only change prefix, it will trigger a complete rebuild of rsl because the Makefile has logic to
  # update a handful of header files based on the pefix variable. To avoid this, we set add_paths_to_hardcoded_files_in_headers
  # to "false" to disable the header update logic so the make install call below will only copy files to our
  # Temp install directory. Ideally, we would just set DESTDIR and be done, but that doesn't seem to work for rsl.
  make prefix="${pkgdir}/usr" add_paths_to_hardcoded_files_in_headers="false" install
}
