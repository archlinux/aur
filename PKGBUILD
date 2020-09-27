# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Maintainer: Alex Dahl <adahl1@umbc.edu>
pkgname=partio-git
pkgver=1.13.0.r5.gc31097c
pkgrel=1
pkgdesc="Particle IO and manipulation library (git version)"
arch=(i686 x86_64)
url="https://www.disneyanimation.com/technology/partio.html"
license=('custom')
depends=('glut' 'glu' 'seexpr')
optdepends=('python2: Python interface support'
            'zlib: file compression support')
makedepends=('cmake>=2.4.6' 'swig' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wdas/partio.git'
	)
md5sums=('SKIP'
	)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#  cd "$srcdir/${pkgname%-git}"
#  git apply ../
#}

build() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd ./build
  cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir/" install
  # Copy custom BSD license
  install -D -m644 "../src/doc/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
