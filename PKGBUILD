# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=beef-git
_pkgname=beef
pkgver=20190926.d6972adf
pkgrel=1
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
  '3c70f6d41cf6454ffedd58c9ab6c498578e72f0e46a35c032053cad88efe9b7c'
  'cf7585979b47269576aaf915d923ae2b7e2fcf0d64fff1ec702763fad13a3d51')

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
  # cp -r src/beef-git/* pkg/etc/beef
  install -d "${pkgdir}/etc/${_pkgname}"
  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/etc/${_pkgname}"

  # update vendor path
  install -d "${pkgdir}/etc/${_pkgname}/.bundle"
  install -Dm644 "${srcdir}/${pkgname}/.bundle/config" "${pkgdir}/etc/${_pkgname}/.bundle/config"

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
