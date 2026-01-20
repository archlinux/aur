# Maintainer: Hikari <xec[at]domain:tuta.io>

pkgname=ejabberd-git
pkgver=25.10.r129.g3c950fe65
pkgrel=1
pkgdesc="Robust, ubiquitous and massively scalable messaging platform (XMPP, MQTT, SIP) - git version"
arch=('x86_64' 'aarch64')
url="https://www.ejabberd.im/"
license=('GPL2')
depends=('erlang' 'openssl' 'expat' 'libyaml' 'zlib' 'pam' 'sqlite')
makedepends=('git' 'rebar3' 'gcc' 'make')
provides=('ejabberd')
conflicts=('ejabberd')
backup=('etc/ejabberd/ejabberd.yml'
        'etc/ejabberd/ejabberdctl.cfg'
        'etc/ejabberd/inetrc')
source=("git+https://github.com/processone/ejabberd.git")
sha256sums=('SKIP')

pkgver() {
  cd ejabberd
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ejabberd
  ./autogen.sh
}

build() {
  cd ejabberd
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-mysql \
    --enable-pgsql \
    --enable-sqlite \
    --enable-pam \
    --enable-zlib \
    --enable-http \
    --enable-iconv \
    --enable-debug
    
  make
}

package() {
  cd ejabberd
  make DESTDIR="$pkgdir" install
  install -d -m750 "$pkgdir/var/lib/ejabberd"
  install -d -m750 "$pkgdir/var/log/ejabberd"
    install -D -m644 ejabberd.service "$pkgdir/usr/lib/systemd/system/ejabberd.service"
}
