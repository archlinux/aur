# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=firefox-extension-netvyne-git
pkgver=1.0.9.r37.3d66124
pkgrel=1
pkgdesc='Firefox extension to leave and read comments on any URL'
arch=('any')
url='https://github.com/netvyne/firefoxext'
license=('MIT')
groups=('firefox-addons')
depends=('firefox')
makedepends=('git' 'jq' 'moreutils' 'nodejs' 'npm' 'python' 'yarn' 'zip')
options=('!strip')

source=(
  "${pkgname}::git+https://github.com/netvyne/firefoxext.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  _pkgver_base="$(jq -r '.version' \
    "${srcdir}/${pkgname}/extension/manifest.json")"
  printf "%s.r%s.%s" \
    "${_pkgver_base}" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

prepare() {
  # Prevent pointless warning
  rm "${srcdir}/${pkgname}/package-lock.json"
}

build() {
  cd "${srcdir}/${pkgname}"

  /usr/bin/node /usr/bin/yarn install

  # Modify manifest, replacing the version with pkgver
  jq --arg version "${pkgver}" '.version = $version' \
    'extension/manifest.json' | sponge 'extension/manifest.json'

  # Do the same thing in the React app configuration
  sed -E -i \
    -e "s/(REACT_APP_VERSION = ')[^']+(';)/\\1${pkgver}\\2/" \
    'config/env.js'

  # Upstream chose to inject the entire process environment into the
  # build runtime. See also: config/env.js
  # As a consequence, every time the app requests a variable that
  # the environment doesn’t happen to provide, webpack would leak
  # into the package an object literal that contains all build-time
  # environment variables and their values.
  #
  # Use env -i to make sure this won’t leak sensitive information.
  env -i \
    PATH=/usr/bin \
    NODE_ENV='production' \
    REACT_APP_MOD_URL='https://www.netvyne.com/mod' \
    VERSION="${pkgver}-${pkgrel}" \
    npm run build
  cd 'extension'
  zip -X --filesync --recurse-paths \
    "${srcdir}/${pkgname}-${pkgver}.xpi" -- *
}

package() {
  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}/LICENSE"

  echo >&2 'Packaging the extension'
  _gecko_id="$(jq -r '.browser_specific_settings.gecko.id' \
    "${srcdir}/${pkgname}/extension/manifest.json")"
  install -D -m 644 -T \
    "${srcdir}/${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
