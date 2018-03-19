# Maintainer: spider-mario <spidermario@free.fr>
# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: svoufff <svoufff at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

_pkgname=linuxsampler
pkgname=linuxsampler-vst
pkgver=2.1.0
pkgrel=1
pkgdesc="Professional-grade audio sampler alternative to Gigasampler (including VST plugin)"
arch=('x86_64')
url="https://www.linuxsampler.org/"
license=('GPL2' 'custom:exception')
depends=('libgig' 'jack' 'sqlite')
makedepends=('ladspa' 'dssi' 'lv2' 'steinberg-vst36')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://download.linuxsampler.org/packages/${_pkgname}-${pkgver}.tar.bz2"
        'license.txt')
sha512sums=('503db074437b07e3e8dc8d1cb0aa3a510a62d183148157c1a4757681a4319e531bd6a1486a83c0ab9721dde82e27306150f3be87476c9298b2335438670e19a7'
            '245005dbd182291d9b47c5f22bb14b1d4f42b63d5dd05498521491697fefa9ae8faa3bbc899f4ac4a3ed7dfda3222bb85fc1934705b4cae7108e427f377a78c9')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure --prefix=/usr --enable-vstsdk-dir=/usr/include/vst36/
  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # install GPL exception statement
  install -Dm644 "${srcdir}/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/GPL-EXCEPTION"

  # lscp files conflict with nilfs-utils
  # see https://bugs.archlinux.org/task/45827
  mv "${pkgdir}/usr/bin/lscp" "${pkgdir}/usr/bin/lscp-${_pkgname}"
  mv "$pkgdir/usr/share/man/man1/lscp.1" \
    "${pkgdir}/usr/share/man/man1/lscp-${_pkgname}.1"

  # fix linking of /usr/lib/linuxsampler/liblinuxsampler.so.5.0.0
  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_pkgname}" > "${pkgdir}/etc/ld.so.conf.d/${_pkgname}.conf"

}

# vim:set ts=2 sw=2 et:
