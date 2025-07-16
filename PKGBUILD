pkgname=homepage
pkgver=1.4.0
pkgrel=5
pkgdesc="A highly customizable homepage (or startpage / application dashboard) with Docker and service API integrations."
arch=('any')
url="https://github.com/gethomepage/homepage"
license=('GPL-3.0-only')
makedepends=('pnpm')
depends=('pnpm')
source=("https://github.com/gethomepage/homepage/archive/v${pkgver}.tar.gz"
        'homepage.service'
        'homepage.sysusers'
        'homepage.tmpfiles')
sha256sums=('8a90dcca10a001818d0f6f28a15d4eaef1ae5f614a4bc019d3a95ecb02ab60de'
            '74650f1be92d42d6969dc4b9d34fd3a11cdf5ce2d98029752e400ac0fef67f62'
            'b35b3df75248f5dd1298cb1a13921cb40b66998608eae3a8bf0c36562d43d278'
            'e10cf0af4417326d32acffddd7104ce5e033dfbbf06f7f8f71bc92a1d6c37165')
build() {
  export NEXT_TELEMETRY_DISABLED=1
  export NEXT_PUBLIC_BUILDTIME="$(date +%s)"
  export NEXT_PUBLIC_VERSION="${pkgver}"
  export NEXT_PUBLIC_REVISION="aur"
  cd "homepage-${pkgver}"
  pnpm install
  pnpm build
}
package() {
  # Create directories
  install -dm 755 "${pkgdir}/var/lib/homepage"
  # Copy build output (assumes no config/ exists here)
  cp -r "$srcdir/homepage-${pkgver}/.next/standalone/." "${pkgdir}/var/lib/homepage/"
  mkdir -p "${pkgdir}/var/lib/homepage/.next"
  cp -r "$srcdir/homepage-${pkgver}/.next/standalone/.next/." "${pkgdir}/var/lib/homepage/.next/"
  # Copy public assets
  cp -r "${srcdir}/homepage-${pkgver}/public/." "${pkgdir}/var/lib/homepage/public/"
  mkdir -p "${pkgdir}/var/lib/homepage/.next/static"
  cp -r "${srcdir}/homepage-${pkgver}/.next/static/." "${pkgdir}/var/lib/homepage/.next/static/"
  # Copy service files
  install -Dm644 "$srcdir/homepage.service" "$pkgdir/usr/lib/systemd/system/homepage.service"
  install -Dm644 "$srcdir/homepage.sysusers" "$pkgdir/usr/lib/sysusers.d/homepage.conf"
  install -Dm644 "$srcdir/homepage.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/homepage.conf"
}
