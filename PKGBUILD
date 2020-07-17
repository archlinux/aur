# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=FatFrog
pkgname=fatfrog.lv2
pkgver=1.0
pkgrel=1
pkgdesc="A high gain valve amplifier simulation LV2 plugin"
arch=('x86_64')
url="https://github.com/brummer10/${_name}.lv2"
license=('BSD')
groups=('lv2-plugins' 'pro-audio')
depends=('cairo' 'gcc-libs' 'glibc' 'libx11')
makedepends=('lv2')
checkdepends=('lv2lint' 'sord')
source=("https://github.com/brummer10/${_name}.lv2/releases/download/v${pkgver}/${_name}_${pkgver}.tar.gz"
        'fatfrog-fix-ttl.diff')
sha512sums=('2623b367d0c388c72710fead54b3585c165d26c07df4aef1e5306bbede3f5745fc943522bd8b5d8257f9434b8d5a46bbdbc2ee489cb6a40f3f317b5e0f83c8a1'
            'b651baf31a9f8f6276e41f64308ffd27584aed68f448ba7db373e6683738d74edcb982c0da35873ae04fc30375c82da4d277511fd0c5fdda376f5a675eef11b7')

build() {
  cd "${srcdir}/${_name}_${pkgver}"
  make
}

prepare() {
  cd "${srcdir}/${_name}_${pkgver}"
  patch -p1 -N -i "${srcdir}/fatfrog-fix-ttl.diff"
}

check() {
  cd "${srcdir}/${_name}_${pkgver}"
  mkdir -p lv2
  ln -sf ../${_name}/${_name}.lv2 lv2/${_name}.lv2
  # expected to produce errors
  #sord_validate -l "${PWD}/lv2/${_name}.lv2/"*.ttl
  LV2_PATH="${PWD}/lv2:/usr/lib/lv2" lv2lint -M pack "https://github.com/brummer10/${_name}#_${_name}_"
}

package() {
  cd "${srcdir}/${_name}_${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.md "${_name}.png" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
