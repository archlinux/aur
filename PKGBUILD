pkgname=homepage-git
pkgver=0.9.6.r0.g805f119a2
pkgrel=1
pkgdesc="A highly customizable homepage (or startpage / application dashboard) with Docker and service API integrations."
arch=('any')
url="https://github.com/gethomepage/homepage"
license=('GPL-3.0-only')
makedepends=('git' 'pnpm')
depends=('pnpm')
source=('git+https://github.com/gethomepage/homepage.git'
        'homepage.service'
        'homepage.sysusers'
        'homepage.tmpfiles')
sha256sums=('SKIP'
            'a839ac5c8b065b4005b517cf07656e30a3fe91270ca5a1dd8aaf71d980441ba6'
            'b35b3df75248f5dd1298cb1a13921cb40b66998608eae3a8bf0c36562d43d278'
            'e10cf0af4417326d32acffddd7104ce5e033dfbbf06f7f8f71bc92a1d6c37165')
pkgver() {
  cd homepage
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd homepage
  pnpm install
  pnpm build
}
package() {
  install -dm 755 "${pkgdir}/var/lib/homepage"
  cp -r "$srcdir/homepage" "${pkgdir}/var/lib/"
  install -Dm644 "$srcdir/homepage.service" "$pkgdir/usr/lib/systemd/system/homepage.service"
  install -Dm644 "$srcdir/homepage.sysusers" "$pkgdir/usr/lib/sysusers.d/homepage.conf"
  install -Dm644 "$srcdir/homepage.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/homepage.conf"
}
