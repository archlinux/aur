# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=beef-git
_pkgname=beef
pkgver=20190926.d6972adf
pkgrel=2
pkgdesc="The Browser Exploitation Framework"
arch=('x86_64')
url="http://beefproject.com/"
_url="https://github.com/beefproject/beef"
license=('GPLv2')
depends=('ruby' 'ruby-bundler' 'sqlite' 'nodejs')
makedepends=('git')
source=("${pkgname}::git+${_url}.git"
  https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz
  "${pkgname}.install"
  "${pkgname}.sh"
)
install=${pkgname}.install
sha256sums=('SKIP'
  '417e0c0c5f0b7004373e9bd6a232e6befc5be50fc6f4f5c7b9bf19b15fe3ee68'
  'ba866d77f4dfd95685a34ca7a00482dc35f20b7101e1c9de5975e776341c6653'
  '98d72df13e4f61271afd623070a5e81c9edf2e5b4f39d71b45f3279e255649a0')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/${pkgname}"

  # Print beef logo
  if [ -f core/main/console/beef.ascii ]; then
    cat core/main/console/beef.ascii
    echo
  fi

  # Remove Gemfile.lock
  if [ -f Gemfile.lock ]; then
    rm Gemfile.lock
  fi

  bundle${RUBYSUFFIX} install --without test development --path vendor/bundle
}

package() {
  # cp -r src/beef-git/* pkg/usr/share/beef
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/share/${_pkgname}"

  # update vendor path
  install -d "${pkgdir}/usr/share/${_pkgname}/.bundle"
  install -Dm644 "${srcdir}/${pkgname}/.bundle/config" "${pkgdir}/usr/share/${_pkgname}/.bundle/config"

  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/beef"

  # install GeoIP database to /opt/GeoIP
  install -d "${pkgdir}/opt/GeoIP"
  install -Dm644 "${srcdir}"/GeoLite2-City*/* "${pkgdir}/opt/GeoIP/"

  # update LICENSE
  install -d "${pkgdir}/usr/share/licenses/GeoIP"
  install -Dm644 "${pkgdir}/opt/GeoIP"/LICENSE.txt "${pkgdir}/usr/share/licenses/GeoIP/LICENSE"
  install -Dm644 "${pkgdir}/opt/GeoIP"/COPYRIGHT.txt "${pkgdir}/usr/share/licenses/GeoIP/COPYRIGHT"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 "${srcdir}/${pkgname}/doc"/* "${pkgdir}/usr/share/licenses/${_pkgname}/"
}

# vim: ts=2 sw=2 et:
