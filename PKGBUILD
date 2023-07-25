# Maintainer: Tomaz Canabrava <tomaz.canabrava@gmail.com>

pkgname=bde
pkgver=3.117.0.0
pkgrel=1
pkgdesc="Bloomberg Basic Development Environment - Common C++ Libraries used instead of the STL"
arch=('any')
url="https://github.com/bloomberg/bde"
license=('Apache')

makedeps=(
 	'make'
	'gcc'
	'bde-tools'
)

source=("bde::git+https://github.com/bloomberg/bde#tag=${pkgver}")

md5sums=('SKIP')

# The BDE buildsystem tries to be smart finding
# things that are installed on your system and configuring
# the libraries in a way that it thinks it's the best one.
# Behind that magic, it generates cmake scripts but it's
# not trivial to call them without using their bbs_build magic.
build() {
  cd "${srcdir}/bde"
  eval $(/usr/bin/bde-tools/bin/bbs_build_env -u opt_64_cpp17)
  /usr/bin/bde-tools/bin/bbs_build configure
  /usr/bin/bde-tools/bin/bbs_build build
}

package() {
  cd "${srcdir}/bde"
  /usr/bin/bde-tools/bin/bbs_build install "--prefix=/usr" "--install_dir=$pkgdir"

  if [ -e "${pkgdir}/usr/lib64" ]; then
    mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
  fi
}
