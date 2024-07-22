pkgname=homepage-git
pkgver=0.9.5.r1.g5d531b11e
pkgrel=1
pkgdesc="A highly customizable homepage (or startpage / application dashboard) with Docker and service API integrations."
arch=('any')
url="https://github.com/gethomepage/homepage"
license=('GPL-3.0-only')
makedepends=('git' 'pnpm')
depends=('pnpm')
options=('!strip')
source=('git+https://github.com/gethomepage/homepage.git'
        'homepage.service'
        'homepage.sysusers'
        'homepage.tmpfiles')
sha256sums=('SKIP'
            '0f4875eaae5eb2f0e7d9f4e70c3e18544e1d18824adc599939c014f2f9d0ebe3'
            '130448e4a99f3b2c5fa1420c602b1d4ae105fa527100dc5c8cccdde53acb3bd0'
            'e10cf0af4417326d32acffddd7104ce5e033dfbbf06f7f8f71bc92a1d6c37165')
pkgver() {
  cd homepage
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd homepage
  pnpm install
  pnpm build
  pnpm store prune
  find . -name "node_modules" -type d -prune | xargs du -chs
}
package() {
  install -dm 755 "${pkgdir}/var/lib/homepage"
  cp -r "$srcdir/homepage" "${pkgdir}/var/lib/"
  install -Dm644 "$srcdir/homepage.service" "$pkgdir/usr/lib/systemd/system/homepage.service"
  install -Dm644 "$srcdir/homepage.sysusers" "$pkgdir/usr/lib/sysusers.d/homepage.conf"
  install -Dm644 "$srcdir/homepage.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/homepage.conf"
}