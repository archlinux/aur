# Maintainer: dryes <joswiseman@cock.li>
pkgname='nntp-proxy-git'
pkgver=29
pkgrel=1
pkgdesc='simple NNTP proxy with SSL support.'
arch=('i686' 'x86_64')
url='https://github.com/nieluj/nntp-proxy'
license=('GPL2')
provides=('nttp-proxy')
depends=('libconfig' 'libevent' 'openssl' 'expect')
makedepends=('git')
install='nntp-proxy.install'
backup=('etc/nntp-proxy.conf')
source=('git://github.com/nieluj/nntp-proxy' 'nntp-proxy.service')
md5sums=('SKIP' 'eb7b1e7f3f5180b9a0e3b32fe1fd55ef')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

build() {
  [ -d "${srcdir}/${pkgname%-git}-build" ] && rm -rf "${srcdir}/${pkgname%-git}-build"
  git clone "${srcdir}/${pkgname%-git}" "${srcdir}/${pkgname%-git}-build"
}

package() {
  cd "${srcdir}/${pkgname%-git}-build/"

  sed -i -r "s|(INSTALL_DIR = )/usr/local/bin|\1${pkgdir}/usr/bin|" 'Makefile'
  mkdir -p "${pkgdir}/usr/bin"
  make install

  install -Dm644 'nntp-proxy.conf.example' "${pkgdir}/etc/nntp-proxy.conf"
  install -Dm644 "${srcdir}/nntp-proxy.service" "${pkgdir}/usr/lib/systemd/system/nntp-proxy.service"
}
