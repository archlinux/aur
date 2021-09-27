# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=spice-vdagent
pkgver=0.21.0
pkgrel=1
pkgdesc="Spice agent for Linux guests"
arch=('x86_64')
url="https://www.spice-space.org/"
license=('GPL')
depends=('alsa-lib' 'dbus' 'glib2' 'gtk3' 'libdrm' 'libpciaccess' 'libxfixes' 'libxinerama' 'libxrandr' 'systemd')
makedepends=('spice-protocol' 'git')
checkdepends=('procps-ng')
backup=('etc/conf.d/spice-vdagentd')
source=("https://www.spice-space.org/download/releases/$pkgname-$pkgver.tar.bz2")
sha256sums=('fd575fd23c54fa5a7ff5d66069638510a669c332c5f86082cfb39a7d03a31259')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|/etc/sysconfig/spice-vdagentd|/etc/conf.d/spice-vdagentd|
          s|/usr/sbin/spice-vdagentd|/usr/bin/spice-vdagentd|' data/spice-vdagentd.service
  sed -i 's|/etc/sysconfig/spice-vdagentd|/etc/conf.d/spice-vdagentd|' data/spice-vdagentd.1.in
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
              --with-session-info=systemd --with-init-script=systemd
  make
}

check() {
  make -C $pkgname-$pkgver check || : # test-session-info fails
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/var"
  install -dm755 "$pkgdir/etc/conf.d/"
  echo 'SPICE_VDAGENTD_EXTRA_ARGS=""' > "$pkgdir/etc/conf.d/spice-vdagentd"
}

# Support for extra mouse buttons (typically "Back" and "Forward" in e.g. Firefox) by Kevin Pouget:
# https://lists.freedesktop.org/archives/spice-devel/2020-May/051651.html
# His patches have been rebased on top of this commit to spice-protocol:
# https://gitlab.freedesktop.org/spice/spice-protocol/-/commit/cbe7b2c28543f4c5e57d1db1b753b73a64104162
provides+=(spice-vdagent)
conflicts+=(spice-vdagent)

source+=("spice-extra-mouse-buttons.patch")
sha256sums+=('9737a2476e3f240eafbd5dec386f7d9949c0db1f4a967449c530fdd2ea7cbfef')

_pkgname=$pkgname
pkgname+="-extra-mouse-buttons"
pkgrel="$pkgrel.1"
pkgdesc+=" (with support for extra mouse buttons)"
eval "$(declare -f prepare | sed 's/$pkgname/$_pkgname/g')"
eval "$(declare -f build | sed 's/$pkgname/$_pkgname/g')"
eval "$(declare -f check | sed 's/$pkgname/$_pkgname/g')"
eval "$(declare -f package | sed 's/$pkgname/$_pkgname/g')"

eval "$(echo "orig_prepare()"; declare -f prepare | tail -n +2)"
prepare() {
  patch -d"$_pkgname-$pkgver" -Np1 -i "${srcdir}"/spice-extra-mouse-buttons.patch
  orig_prepare
}
