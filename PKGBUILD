# Maintainer: AUR contributor
# Single AUR pkgbase; four installable packages (common/web/api/metapackage).
# Five upstream release archives, no Composer network traffic during build.
pkgbase=bacularis
pkgname=('bacularis-common' 'bacularis-web' 'bacularis-api' 'bacularis')
pkgver=7.0.0
pkgrel=2
pkgdesc='Web interface and REST API for Bacula backup management'
arch=('any')
url='https://bacularis.app/'
license=('AGPL-3.0-only')
source=(
  "bacularis-app-${pkgver}.tar.gz::https://github.com/bacularis/bacularis-app/archive/refs/tags/${pkgver}.tar.gz"
  "bacularis-web-${pkgver}.tar.gz::https://github.com/bacularis/bacularis-web/archive/refs/tags/${pkgver}.tar.gz"
  "bacularis-api-${pkgver}.tar.gz::https://github.com/bacularis/bacularis-api/archive/refs/tags/${pkgver}.tar.gz"
  "bacularis-common-${pkgver}.tar.gz::https://github.com/bacularis/bacularis-common/archive/refs/tags/${pkgver}.tar.gz"
  "bacularis-external-${pkgver}.tar.gz::https://bacularis.app/downloads/bacularis-external-${pkgver}.tar.gz"
  'bacularis-common.tmpfiles'
  'bacularis-web.tmpfiles'
  'bacularis-api.tmpfiles'
  'bacularis-nginx.conf'
  'bacularis-php.ini.example'
  'bacularis-sudoers-update'
  'bacularis-sudoers.hook'
)
# Initial template: CI replaces all five SKIP values with verified SHA-256 sums.
# Before manual AUR publication: makepkg -o && updpkgsums && makepkg -s.
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '7786e7fd29240aa58f81cc9e68d3ce4013a45138e3237cb403d898368b524113'
  '38ba0ddfc9d152ba0acb01ae1bee69e93b64d34da1bf500082f8be9722b5898c'
  'b98385e7d167d2136ea6da405873f9ff48bbb697b9cfbff8349f28b233a12537'
  'c1080329df315faad9910053f49ec0c113fbf13ef86e93f94232bc74be3f491c'
  '8c9ae1d5aee64ec68047843f1786bb947b03282ba8c0f7f15044545a3d416bd8'
  'bbf0810f654ed6490ef8a7faf975a2d90d4ad2db91942c6a444b777d2497dc19'
  '86149c3f5e85648a6a3594c8fe189598311cf4a28f0ac2a043fcf464b49f8c29'
)
noextract=(
  "bacularis-app-${pkgver}.tar.gz"
  "bacularis-web-${pkgver}.tar.gz"
  "bacularis-api-${pkgver}.tar.gz"
  "bacularis-common-${pkgver}.tar.gz"
  "bacularis-external-${pkgver}.tar.gz"
)

prepare() {
  local _build="${srcdir}/bacularis-build"
  mkdir -p "${_build}/protected/vendor/bacularis"

  tar -xzf "${srcdir}/bacularis-app-${pkgver}.tar.gz" \
      --strip-components=1 -C "${_build}"
  tar -xzf "${srcdir}/bacularis-external-${pkgver}.tar.gz" \
      --strip-components=1 -C "${_build}/protected"

  local _component
  for _component in api web common; do
    mkdir -p "${_build}/protected/vendor/bacularis/bacularis-${_component}"
    tar -xzf "${srcdir}/bacularis-${_component}-${pkgver}.tar.gz" \
        --strip-components=1 \
        -C "${_build}/protected/vendor/bacularis/bacularis-${_component}"
  done

  cp -a "${_build}/protected/vendor/bacularis/bacularis-common/project/." "${_build}/"

  ln -s vendor/bacularis/bacularis-common/Common "${_build}/protected/Common"
  ln -s vendor/bacularis/bacularis-api/API "${_build}/protected/API"
  ln -s vendor/bacularis/bacularis-web/Web "${_build}/protected/Web"

  install -d "${_build}/htdocs/themes/Baculum-v2/fonts/css" \
             "${_build}/htdocs/themes/Baculum-v2/fonts/webfonts"
  cp -a "${_build}/protected/vendor/npm-asset/fortawesome--fontawesome-free/css/all.min.css" \
      "${_build}/htdocs/themes/Baculum-v2/fonts/css/fontawesome-all.min.css"
  cp -a "${_build}/protected/vendor/npm-asset/fortawesome--fontawesome-free/webfonts/." \
      "${_build}/htdocs/themes/Baculum-v2/fonts/webfonts/"
  cp -a "${_build}/protected/vendor/npm-asset/fontsource--inter/files/." \
      "${_build}/htdocs/themes/Baculum-v2/fonts/webfonts/"

  # Mutable data is never owned by pacman and persists across upgrades.
  rm -rf "${_build}/protected/vendor/bacularis/bacularis-api/API/Config" \
         "${_build}/protected/vendor/bacularis/bacularis-api/API/Logs" \
         "${_build}/protected/vendor/bacularis/bacularis-web/Web/Config" \
         "${_build}/protected/vendor/bacularis/bacularis-web/Web/Logs" \
         "${_build}/protected/vendor/bacularis/bacularis-common/Common/Working" \
         "${_build}/protected/runtime" \
         "${_build}/htdocs/assets"

  ln -s /var/lib/bacularis/api-config \
      "${_build}/protected/vendor/bacularis/bacularis-api/API/Config"
  ln -s /var/log/bacularis/api \
      "${_build}/protected/vendor/bacularis/bacularis-api/API/Logs"
  ln -s /var/lib/bacularis/web-config \
      "${_build}/protected/vendor/bacularis/bacularis-web/Web/Config"
  ln -s /var/log/bacularis/web \
      "${_build}/protected/vendor/bacularis/bacularis-web/Web/Logs"
  ln -s /var/lib/bacularis/working \
      "${_build}/protected/vendor/bacularis/bacularis-common/Common/Working"
  ln -s /var/cache/bacularis/runtime "${_build}/protected/runtime"
  ln -s /var/cache/bacularis/assets "${_build}/htdocs/assets"
}

package_bacularis-common() {
  pkgdesc='Shared Bacularis application shell, libraries, assets and state paths'
  depends=('php')
  optdepends=(
    'php-fpm: FastCGI backend for web servers'
    'nginx: use the provided example virtual host'
  )

  install -d "${pkgdir}/usr/share/webapps/bacularis"
  cp -a "${srcdir}/bacularis-build/." "${pkgdir}/usr/share/webapps/bacularis/"
  # API and Web modules are installed exclusively by their corresponding packages.
  rm -rf "${pkgdir}/usr/share/webapps/bacularis/protected/vendor/bacularis/bacularis-api" \
         "${pkgdir}/usr/share/webapps/bacularis/protected/vendor/bacularis/bacularis-web" \
         "${pkgdir}/usr/share/webapps/bacularis/protected/API" \
         "${pkgdir}/usr/share/webapps/bacularis/protected/Web"

  install -Dm644 "${srcdir}/bacularis-common.tmpfiles" \
      "${pkgdir}/usr/lib/tmpfiles.d/bacularis-common.conf"
  install -Dm644 "${srcdir}/bacularis-php.ini.example" \
      "${pkgdir}/usr/share/doc/bacularis/bacularis-php.ini.example"
  install -Dm644 "${srcdir}/bacularis-nginx.conf" \
      "${pkgdir}/usr/share/doc/bacularis/nginx.conf.example"
  install -Dm644 "${srcdir}/bacularis-build/LICENSE" \
      "${pkgdir}/usr/share/licenses/bacularis-common/LICENSE"
}

package_bacularis-web() {
  pkgdesc='Bacularis Web frontend (can run without local Bacula)'
  depends=("bacularis-common=${pkgver}-${pkgrel}")
  optdepends=('php-fpm: PHP FastCGI backend')

  local base="${pkgdir}/usr/share/webapps/bacularis/protected"
  install -d "${base}/vendor/bacularis"
  cp -a "${srcdir}/bacularis-build/protected/vendor/bacularis/bacularis-web" \
      "${base}/vendor/bacularis/"
  ln -s vendor/bacularis/bacularis-web/Web "${base}/Web"
  install -d "${pkgdir}/etc/bacularis"
  ln -s /var/lib/bacularis/web-config "${pkgdir}/etc/bacularis/Web"
  install -Dm644 "${srcdir}/bacularis-web.tmpfiles" \
      "${pkgdir}/usr/lib/tmpfiles.d/bacularis-web.conf"
  install -Dm644 "${srcdir}/bacularis-build/LICENSE" \
      "${pkgdir}/usr/share/licenses/bacularis-web/LICENSE"
}

package_bacularis-api() {
  pkgdesc='Bacularis REST API and local Bacula integration with scoped sudoers'
  depends=("bacularis-common=${pkgver}-${pkgrel}" 'sudo')
  optdepends=(
    'bacula-console: bconsole access to Bacula Director'
    'php-pgsql: connect to PostgreSQL Bacula catalog'
    'php-fpm: PHP FastCGI backend'
  )
  install='bacularis-api.install'

  local base="${pkgdir}/usr/share/webapps/bacularis/protected"
  install -d "${base}/vendor/bacularis"
  cp -a "${srcdir}/bacularis-build/protected/vendor/bacularis/bacularis-api" \
      "${base}/vendor/bacularis/"
  ln -s vendor/bacularis/bacularis-api/API "${base}/API"
  install -d "${pkgdir}/etc/bacularis"
  ln -s /var/lib/bacularis/api-config "${pkgdir}/etc/bacularis/API"
  install -Dm644 "${srcdir}/bacularis-api.tmpfiles" \
      "${pkgdir}/usr/lib/tmpfiles.d/bacularis-api.conf"
  install -Dm755 "${srcdir}/bacularis-sudoers-update" \
      "${pkgdir}/usr/bin/bacularis-sudoers-update"
  install -Dm644 "${srcdir}/bacularis-sudoers.hook" \
      "${pkgdir}/usr/share/libalpm/hooks/bacularis-sudoers.hook"
  install -Dm644 "${srcdir}/bacularis-build/LICENSE" \
      "${pkgdir}/usr/share/licenses/bacularis-api/LICENSE"
}

package_bacularis() {
  pkgdesc='Bacularis Web and API together (metapackage)'
  depends=(
    "bacularis-common=${pkgver}-${pkgrel}"
    "bacularis-web=${pkgver}-${pkgrel}"
    "bacularis-api=${pkgver}-${pkgrel}"
  )
}
