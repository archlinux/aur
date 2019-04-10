# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blis-git
pkgver=0.5.2.r20.g32812ff5
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('x86_64')
license=('custom:BSD')
makedepends=('python2')
conflicts=('blis')
provides=('blis')
url='https://github.com/flame/blis'
options=('!buildflags' '!emptydirs')
source=("git+https://github.com/flame/blis.git" fpic.patch blis_profile.sh)
sha512sums=('SKIP'
            'e9b7558a8c703570089ba1923d03444ec0a63c9d10cc8931dc9a19a0faa5553eecbae5af9ca4923f425259173fc7958e852c6ef9c9375f83b5d21c4634e088b5'
            'cb53fa1f8c540062d4d55b4b91c787a821c563ea0bdb4e37f1db08869c320132a493e6b55f5d876418d56ad5b4f1dc5553f871862418393614e160dd1329ec9e')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s" $(git describe --tags|sed 's+-+.r+'|tr - .) 
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 < "$srcdir"/fpic.patch
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -fPIC" ./configure -p "${pkgdir}"/usr x86_64
  make BLIS_ENABLE_DYNAMIC_BUILD:=yes
}

package() {
  install -d "${pkgdir}"/etc/profile.d
  cd "${pkgname%-git}"
  # make install installs nothing, do it manually
  install -Dm644 ./include/x86_64/blis.h "$pkgdir"/usr/include/blis/blis.h
  install -Dm644 ./lib/x86_64/libblis.a "$pkgdir"/usr/lib/libblis.a
  install -Dm755 "$srcdir"/blis_profile.sh "$pkgdir"/etc/profile.d/blis.sh
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
