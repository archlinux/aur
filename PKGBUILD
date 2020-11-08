# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=btdu
pkgver=0.1.0
pkgrel=2
pkgdesc='sampling disk usage profiler for btrfs'
arch=('i686' 'x86_64')
url='https://github.com/CyberShadow/btdu'
license=('GPL2')
depends=('ncurses')
makedepends=('d-compiler' 'dub' 'dtools')

# these should match dub.selections.json
_d_ae_ver=0.0.2833
_d_btrfs_ver=0.0.10
_d_ncurses_ver=0.0.148

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/CyberShadow/${pkgname}/archive/v${pkgver}.tar.gz
		ae-${_d_ae_ver}.tar.gz::https://github.com/CyberShadow/ae/archive/v${_d_ae_ver}.tar.gz
		d-btrfs-${_d_btrfs_ver}.tar.gz::https://github.com/CyberShadow/d-btrfs/archive/v${_d_btrfs_ver}.tar.gz
		ncurses-${_d_ncurses_ver}.tar.gz::https://github.com/D-Programming-Deimos/ncurses/archive/v${_d_ncurses_ver}.tar.gz
	   )
sha256sums=('60f9de72ae3a471a86a5b06c1eecd32bb4b41e1f9c50ca9121f17ce98a51af5b'
            '97f129484f7ff431d0be3430ab62d32955c17cc43e6993de4a628ea4b8574c23'
            '414077a05a21b910efe76d0afb6e61cb824727be5e3237a6ee1d2e67e7664029'
            'f42b28b488a0a06e3a4e08e5603f637481686d454d1538b549d3be9c40b24e4f')

prepare() {
  ln -sf ae-${_d_ae_ver} "${srcdir}/ae" # directory name must be "ae" for --rdmd
  cd "${srcdir}/${pkgname}-${pkgver}"
  dub add-local ../ae ${_d_ae_ver}
  dub add-local ../d-btrfs-${_d_btrfs_ver} ${_d_btrfs_ver}
  dub add-local ../ncurses-${_d_ncurses_ver} ${_d_ncurses_ver}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dub --skip-registry=all build -b release --rdmd # --rdmd creates smaller binaries
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
