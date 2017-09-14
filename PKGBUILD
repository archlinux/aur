# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: bohoomil <@zoho.com>

_basename=fontconfig
pkgname=lib32-$_basename-infinality-ultimate
pkgver=2.12.5
pkgrel=1
_master_name=fontconfig-ultimate-master
pkgdesc="A library for configuring and customizing font access (32-bit, infinality-bundle)"
arch=(x86_64)
url="http://www.fontconfig.org/release/"
license=('custom' 'MIT')
groups=('infinality-bundle-multilib')
depends=('lib32-expat' 'lib32-freetype2-infinality-ultimate' $_basename-infinality-ultimate)
makedepends=('gcc-multilib' 'lib32-expat' 'gperf' 'python2-lxml')
options=('!libtool')
provides=('lib32-fontconfig')
conflicts=('lib32-fontconfig')
install="lib32-fontconfig.install"

source=(http://www.fontconfig.org/release/${_basename}-${pkgver}.tar.bz2
        lib32-fontconfig.hook)
sha1sums=('edacb706ac3ef51034cc3f335faeb76e0c15f532'
          '765f355f84c200b9ca4e0ea3c69c41474167fc84')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_basename}-${pkgver}"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-templatedir=/etc/fonts/conf.avail \
    --with-xmldir=/etc/fonts \
    --localstatedir=/var \
    --disable-static \
    --disable-docs \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/share/fonts \
    --libdir=/usr/lib32

  make
}

#check() {
#  cd "${srcdir}/${_basename}-${pkgver}"
#  make -k check
#}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/{etc,usr/{include,share}}
  find "${pkgdir}/usr/bin" -not -type d -not -name fc-cache -delete
  mv "${pkgdir}"/usr/bin/fc-cache{,-32}
  mkdir -p "${pkgdir}/usr/share/licenses"
  install -Dm644 ../lib32-fontconfig.hook "$pkgdir/usr/share/libalpm/hooks/lib32-fontconfig.hook"
  ln -s ${_basename} "${pkgdir}/usr/share/licenses/${pkgname}"
}
