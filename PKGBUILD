# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-icu-git
pkgver=68.2
pkgrel=1
pkgdesc="International Components for Unicode library (32 bit)"
arch=('x86_64')
url="http://site.icu-project.org/home"
license=('custom:icu')
depends=('lib32-gcc-libs' 'icu')
makedepends=('gcc-multilib')
checkdepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so lib32-icu)
conflicts=(lib32-icu)
source=(git+https://github.com/unicode-org/icu.git)
sha512sums=('SKIP')
#validpgpkeys=('0E51E7F06EF719FBD072782A5F56E5AFA63CCD33') #"Craig Cornelius (For use with ICU releases) <ccornelius@google.com>"

pkgver() {
  cd icu
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "icu/icu4c/source"

  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --libdir=/usr/lib32

  make
}

#check() {
#  cd "icu/icu4c/source"
#  make -k check
#}

package() {
  cd "icu/icu4c/source"

  make -j1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr"/{include,sbin,share}

  # keep icu-config-32
  find "${pkgdir}/usr/bin" -type f -not -name icu-config -delete
  mv "${pkgdir}/usr/bin"/icu-config{,-32}

  install -d m644 "${pkgdir}/usr/share/licenses"
  ln -s icu "${pkgdir}/usr/share/licenses/${pkgname}"
}

