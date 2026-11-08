# Maintainer: AUR contributor
# Bacularis is composed of four upstream repositories plus a release-matched
# archive of third-party dependencies. No network operations are run in prepare().
pkgname=bacularis
pkgver=7.0.0
pkgrel=1
pkgdesc='Web interface and REST API for Bacula backup management'
arch=('any')
url='https://bacularis.app/'
license=('AGPL-3.0-only')
depends=('php' 'php-pgsql' 'expect' 'sudo')
optdepends=(
  'nginx: Nginx web server (example config in /usr/share/doc/bacularis)'
  'php-fpm: PHP-FPM backend for Nginx and other web servers'
  'php-sqlite: SQLite catalog backend'
)
backup=('etc/sudoers.d/bacularis')
install='bacularis.install'
source=(
  "bacularis-app-${pkgver}.tar.gz::https://github.com/bacularis/bacularis-app/archive/refs/tags/${pkgver}.tar.gz"
  "bacularis-web-${pkgver}.tar.gz::https://github.com/bacularis/bacularis-web/archive/refs/tags/${pkgver}.tar.gz"
  "bacularis-api-${pkgver}.tar.gz::https://github.com/bacularis/bacularis-api/archive/refs/tags/${pkgver}.tar.gz"
  "bacularis-common-${pkgver}.tar.gz::https://github.com/bacularis/bacularis-common/archive/refs/tags/${pkgver}.tar.gz"
  "bacularis-external-${pkgver}.tar.gz::https://bacularis.app/downloads/bacularis-external-${pkgver}.tar.gz"
  'bacularis.tmpfiles'
  'bacularis-nginx.conf'
  'bacularis-php.ini.example'
  'bacularis.sudoers'
  'bacularis-actions.sudoers.example'
)
# CI computes the five upstream hashes before AUR publication.
# For manual publication, run makepkg -o && updpkgsums first.
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '7acd8779a9a0d6536636d29f5a12dc0e6e83e219f0da6bdcb991322cb1b584b3'
  'c1080329df315faad9910053f49ec0c113fbf13ef86e93f94232bc74be3f491c'
  '8c9ae1d5aee64ec68047843f1786bb947b03282ba8c0f7f15044545a3d416bd8'
  '02d7106df123c65fd879861f7871d32426fe7b00d90aee0b16c145a58edd3d9c'
  '4b93c8bb4db3b5f1ca17d47abdb9ad692d3bde286dfbd5b7ce1cffcefb8e36f2'
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

  # Match the documented five-archive manual installation layout.
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

  # Upstream's project initialization (equivalent to its init.sh, without
  # running a mutable installer or invoking Composer as root).
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

  # All mutable data stays outside pacman's application tree.
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

package() {
  install -d "${pkgdir}/usr/share/webapps/bacularis"
  cp -a "${srcdir}/bacularis-build/." "${pkgdir}/usr/share/webapps/bacularis/"

  install -Dm644 "${srcdir}/bacularis.tmpfiles" \
      "${pkgdir}/usr/lib/tmpfiles.d/bacularis.conf"
  install -Dm644 "${srcdir}/bacularis-php.ini.example" \
      "${pkgdir}/usr/share/doc/bacularis/bacularis-php.ini.example"
  install -Dm644 "${srcdir}/bacularis-nginx.conf" \
      "${pkgdir}/usr/share/doc/bacularis/nginx.conf.example"
  install -Dm644 "${srcdir}/bacularis-actions.sudoers.example" \
      "${pkgdir}/usr/share/doc/bacularis/bacularis-actions.sudoers.example"
  install -Dm440 "${srcdir}/bacularis.sudoers" \
      "${pkgdir}/etc/sudoers.d/bacularis"
  install -Dm644 "${srcdir}/bacularis-build/LICENSE" \
      "${pkgdir}/usr/share/licenses/bacularis/LICENSE"

  install -d "${pkgdir}/etc/bacularis"
  ln -s /var/lib/bacularis/api-config "${pkgdir}/etc/bacularis/API"
  ln -s /var/lib/bacularis/web-config "${pkgdir}/etc/bacularis/Web"
}

