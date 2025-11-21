#Maintainer: prayerie <prayerie@prayerie.pt>
pkgname=protrekkr
pkgver=v2.8.3_PRE_2.r49.g41a1ce8
pkgrel=1
pkgdesc="Tracker/Synth program"
arch=('x86_64')
url='https://github.com/hitchhikr/protrekkr'
license=('BSD-2-Clause')
 
depends=('glibc'
	 'gcc-libs'
	 'sdl12-compat'
	 'libglvnd'
	 'alsa-lib')
makedepends=('git')
source=("git+https://github.com/hitchhikr/$pkgname.git")
sha512sums=('SKIP')
install="$pkgname.install"
pkgver() {
  cd $pkgname

  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null |
      sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
    cd protrekkr
    make -f makefile.linux
}
 
package() {
    mkdir -m755 -p ${pkgdir}/usr/lib/${pkgname}
    mkdir -m755 -p ${pkgdir}/usr/share/licenses/${pkgname}
    mkdir -m755 -p ${pkgdir}/usr/bin
    cd ${pkgdir}/usr/lib/${pkgname}
    install -Dm644 ${srcdir}/protrekkr/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a ${srcdir}/protrekkr/release/ptk/ .
    ln -s ../lib/${pkgname}/ptk/ptk_linux ${pkgdir}/usr/bin/${pkgname}
}


