# Mantainer: 3ED <krzysztof1987 at gmail>
# Contributor: adlerweb <get on aur>

pkgname=pluma-plugins
_reponame=cygwinports
pkgver=1.8.0
epoch=1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/${_reponame}/${pkgname}"
license=('GPL')
depends=('pluma' 'mate-common')
#makedepends=('autoconf-2.5' 'automake-1.12')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/${_reponame}/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('d27bd9e7aa05d0bd23812d6087646880019f15d26cb94fc3e857c3806f228fe9')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  PYTHON=/usr/bin/python2 ./autogen.sh \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${pkgname} \
    --with-plugins=all \
    --with-gtk=2.0 \
    --enable-gtk-doc \
    --enable-python 

  # Who know? Does "make" do it automaticly?
  local cpucounts="$(cat /sys/devices/system/cpu/online)"
  cpucounts="${cpucounts#0-}"
  if [[ $cpucounts =~ ^[0-9]+$ ]]; then
    # This should make compilation much much faster on amds or
    # expensive intels (with many cores).
    make -j $[cpucounts + 1]
  else
    # Fallback
    make
  fi
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
