pkgname=homepage
pkgver=1.8.0
pkgrel=1
pkgdesc="A highly customizable homepage (or startpage / application dashboard) with Docker and service API integrations."
arch=('any')
url="https://github.com/gethomepage/homepage"
license=('GPL-3.0-only')
makedepends=('nodejs-lts-iron' 'pnpm' 'git')
depends=('nodejs-lts-iron' 'pnpm')
source=("https://github.com/gethomepage/homepage/archive/v${pkgver}.tar.gz"
        'homepage.service'
        'homepage.sysusers'
        'homepage.tmpfiles')
sha256sums=('66e7b0282d1e1372821ee62dbe3d21640d58c10d285a35716a65911895a0092b'
            '98e54ffbf5fb251f66a50457d20d78b057d87f9dce645be15e87d84b181b094a'
            'b35b3df75248f5dd1298cb1a13921cb40b66998608eae3a8bf0c36562d43d278'
            'e10cf0af4417326d32acffddd7104ce5e033dfbbf06f7f8f71bc92a1d6c37165')

build() {
  # Fix Date Crash
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

  # Install Dir
  install -dm 755 "${pkgdir}/var/lib/homepage"

  # Copy Build Artifacts
  # ADDED: next-i18next.config.js (Required by next.config.js)
  cp -r .next public package.json pnpm-lock.yaml next.config.js next-i18next.config.js "${pkgdir}/var/lib/homepage/"

  # Create config dir
  install -dm 755 "${pkgdir}/var/lib/homepage/config"

  # Install Production Deps
  cd "${pkgdir}/var/lib/homepage"
  pnpm install --prod --frozen-lockfile

  # Install System Files
  cd "${srcdir}"
  install -Dm644 "homepage.service" "$pkgdir/usr/lib/systemd/system/homepage.service"
  install -Dm644 "homepage.sysusers" "$pkgdir/usr/lib/sysusers.d/homepage.conf"
  install -Dm644 "homepage.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/homepage.conf"
}
