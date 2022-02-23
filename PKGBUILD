# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elastic-git
pkgver=20210506.r145
pkgrel=5
pkgdesc="Simple yet efficient finite element solver for linear elasticity problems in two and three dimensions."
arch=('x86_64')
url="https://github.com/ISCDtoolbox/LinearElasticity"
license=('LGPL')
depends=('iscdcommons-git' 'glibc')
makedepends=('git')
conflicts=('elastic')
provides=('elastic')
source=("${pkgname%-git}::git+$url.git" \
	  git+https://github.com/ICStoolbox/Commons.git \
	  git+https://github.com/ICStoolbox/LinearElasticity.git \
          git+https://github.com/ICStoolbox/NavierStokes.git \
	  git+https://github.com/ICStoolbox/Advection.git \
          git+https://github.com/ICStoolbox/VelocityExtension.git)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.r%s" $(git log -1 --format="%cd" --date=short | tr -d '-') \
	 "$(git rev-list --count HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  sed -i 's+$ENV(HOME)+/usr+' CMakeLists.txt
}

build() {
  cd ${pkgname%-git}
  [[ -d build ]] || mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DCMAKE_SKIP_BUILD_RPATH:BOOL=TRUE
  make
}

package() {
  cd ${pkgname%-git}/build
  install -d "$pkgdir"/usr/share/include/${pkgname%-git}
  install -d "$pkgdir"/usr/{bin,lib}
  install -Dm755 elastic "$pkgdir"/usr/bin/elastic
  install -Dm644 libElas.so "$pkgdir"/usr/lib/libElas.so
  cd ..
  cp sources/*.c sources/*.h "$pkgdir"/usr/share/include/${pkgname%-git}
}
