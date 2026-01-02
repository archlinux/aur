pkgname=homepage
pkgver=1.8.0
pkgrel=15
pkgdesc="A highly customizable homepage (or startpage / application dashboard) with Docker and service API integrations."
arch=('any')
url="https://github.com/gethomepage/homepage"
license=('GPL-3.0-only')
makedepends=('nodejs-lts-iron' 'pnpm' 'git')
depends=('nodejs-lts-iron')
# FIX 1: Disable the -debug package
options=('!debug')
source=("https://github.com/gethomepage/homepage/archive/v${pkgver}.tar.gz"
        'homepage.service'
        'homepage.sysusers'
        'homepage.tmpfiles')
sha256sums=('66e7b0282d1e1372821ee62dbe3d21640d58c10d285a35716a65911895a0092b'
            'SKIP'
            'b35b3df75248f5dd1298cb1a13921cb40b66998608eae3a8bf0c36562d43d278'
            'e10cf0af4417326d32acffddd7104ce5e033dfbbf06f7f8f71bc92a1d6c37165')

build() {
  export NEXT_PUBLIC_BUILDTIME="$(date --iso-8601=seconds)"
  export NEXT_TELEMETRY_DISABLED=1
  export NEXT_PUBLIC_VERSION="${pkgver}"
  export NEXT_PUBLIC_REVISION="aur"
  
  cd "homepage-${pkgver}"
  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  cd "homepage-${pkgver}"
  install -dm 755 "${pkgdir}/var/lib/homepage"

  # FIX 2: Use cp -a with '.' to force copying hidden folders like .next/
  # This ensures the server finds the production build.
  cp -a .next/standalone/. "${pkgdir}/var/lib/homepage/"

  # Copy Static Assets
  install -dm 755 "${pkgdir}/var/lib/homepage/.next/static"
  cp -r .next/static/. "${pkgdir}/var/lib/homepage/.next/static/"

  # Copy Public Assets
  install -dm 755 "${pkgdir}/var/lib/homepage/public"
  cp -r public/. "${pkgdir}/var/lib/homepage/public/"

  # Copy Configs
  cp next-i18next.config.js "${pkgdir}/var/lib/homepage/"
  cp next.config.js "${pkgdir}/var/lib/homepage/"
  
  # Create Config Dir
  install -dm 755 "${pkgdir}/var/lib/homepage/config"

  # System Files
  cd "${srcdir}"
  install -Dm644 "homepage.service" "$pkgdir/usr/lib/systemd/system/homepage.service"
  install -Dm644 "homepage.sysusers" "$pkgdir/usr/lib/sysusers.d/homepage.conf"
  install -Dm644 "homepage.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/homepage.conf"
}
