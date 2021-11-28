# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elastic-git
pkgver=20210506.r145
pkgrel=3
pkgdesc="Simple yet efficient finite element solver for linear elasticity problems in two and three dimensions."
arch=('x86_64')
url="https://github.com/ISCDtoolbox/LinearElasticity"
license=('LGPL')
depends=('iscdcommons-git' 'glibc')
makedepends=('git')
conflicts=('elastic')
provides=('elastic')
source=("${pkgname%-git}::git+$url.git" \
	  https://github.com/ICStoolbox/Commons.git \
	  https://github.com/ICStoolbox/LinearElasticity.git \
          https://github.com/ICStoolbox/NavierStokes.git \
	  https://github.com/ICStoolbox/Advection.git \
          https://github.com/ICStoolbox/VelocityExtension.git)
sha256sums=('SKIP'
            '5458da9a039c7a77a50cb2b54f0a9c4862fffbab54820cbf7c29d7540f24eb19'
            'd4d333f14e412a1c8958eca493292fe8382b0465ddc830999653dd6b344a3fc1'
            'f2d6716c1c8cf2a373c9f9c7600755e29bdd738869bb6ed058f401a42780026e'
            'd6788ec99a0e4f5c3db1159cc43ba109ded211b377b83cccef5f94dcd7c62ea0'
            'd94c468d603758604133099461b098030a111b3cb1b9d39579e07521d418f96b')

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
