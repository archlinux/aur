# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=openvpn-polarssl-git
pkgver=2.3.beta1.r266.g7da9d40
pkgrel=2
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('polarssl' 'lzo' 'iproute2')
conflicts=('openvpn' 'openvpn-polarssl' 'openvpn-git' 'openvpn-dev')
provides=('openvpn' 'openvpn-dev' 'openvpn-git' 'openvpn-polarssl')
makedepends=('systemd' 'git')
license=('custom')
install=openvpn-polarssl.install
source=(git://github.com/openvpn/openvpn)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-polarssl*}"

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

prepare() {
  sed -i 's/\/var\/run\/openvpn\/\%i\.pid/\/run\/openvpn\@\%i\.pid/g' "${srcdir}"/openvpn/distro/systemd/openvpn@.service
}

build() {
  cd "${pkgname%-polarssl*}"

  autoreconf -i -v -f
  CFLAGS="$CFLAGS -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-password-save \
    --mandir=/usr/share/man \
    --with-crypto-library=polarssl \
    --enable-iproute2 \
    --enable-systemd
  make
}

package() {
  cd "${pkgname%-polarssl*}"

  # Install openvpn
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}"/etc/openvpn

  # Install examples
  install -d -m755 "${pkgdir}"/usr/share/openvpn
  cp -r sample/sample-config-files "${pkgdir}"/usr/share/openvpn/examples

  # Install license
  install -d -m755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  ln -sf /usr/share/doc/${pkgname}/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/${pkgname}/

  # Install contrib
  install -d -m755 "${pkgdir}"/usr/share/openvpn/contrib
  cp -r contrib "${pkgdir}"/usr/share/openvpn

  # Install systemd service
  install -D -m644 "${srcdir}"/openvpn/distro/systemd/openvpn@.service "${pkgdir}"/usr/lib/systemd/system/openvpn@.service
}
