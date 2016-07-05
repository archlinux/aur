# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: naxuroqa <naxuroqa at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=toxcore-git
_pkgname=toxcore
pkgver=r3758.532629d
pkgrel=1
pkgdesc='Secure, configuration-free, P2P Skype replacement backend'
arch=('i686' 'x86_64')
url='https://tox.chat'
license=('GPL3')
depends=('systemd' 'libconfig' 'libsodium' 'libvpx' 'opus')
makedepends=('git' 'check')
conflicts=("tox" "toxcore")
provides=("tox" "toxcore")
backup=('etc/tox-bootstrapd.conf')
install=$_pkgname.install
source=("git+https://github.com/irungentoo/toxcore.git"
        'toxcore.conf')
sha512sums=('SKIP'
            '71885e69f7b84955f6bdbf27b9e8196349cdd254b02b510433851bd218374d9c47aa7d3946dcc6a5cff6c8e705bc98d8a09de27039f60b8b088784cf8fa9d719')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  sed -i "s|/usr/local|/usr|" other/bootstrap_daemon/tox-bootstrapd.service
}

build() {
  cd $_pkgname
  autoreconf -if
  ./configure \
    --prefix=/usr \
    --enable-daemon \
    --disable-ntox \
    --enable-tests
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/toxcore.conf" "$pkgdir/usr/lib/sysusers.d/toxcore.conf"
  install -Dm644 ./other/bootstrap_daemon/tox-bootstrapd.service "$pkgdir/usr/lib/systemd/system/tox-bootstrapd.service"
  install -Dm644 ./other/bootstrap_daemon/tox-bootstrapd.conf "$pkgdir/etc/tox-bootstrapd.conf"
}
