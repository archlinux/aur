# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=beef-git
_pkgname=beef
pkgver=20191218.516b787c
pkgrel=1
pkgdesc="The Browser Exploitation Framework"
arch=('x86_64')
url="http://beefproject.com/"
_url="https://github.com/beefproject/beef"
license=('GPL2')
depends=('ruby' 'ruby-bundler' 'sqlite' 'nodejs')
makedepends=('git')
source=("${pkgname}::git+${_url}.git"
  https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz
  "${pkgname}.install"
  "${pkgname}.sh"
)
install=${pkgname}.install
sha256sums=('SKIP'
            'cca0d3045c6608a0b32a485a479d32def16228e4b384d8ecfff34372ae1d5be4'
            'c68c4369c27992d1d3dae817c9933a555e7975956dae46e3fcfb3fc665dcf785'
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

  bundle install --without test development --path vendor/bundle
}

package() {
  # cp -r src/beef-git/* pkg/usr/share/beef
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/usr/share/${_pkgname}"

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
