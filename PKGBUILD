# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=btdu
pkgver=0.2.0
pkgrel=1
pkgdesc='sampling disk usage profiler for btrfs'
arch=('i686' 'x86_64')
url='https://github.com/CyberShadow/btdu'
license=('GPL2')
depends=('ncurses')
makedepends=('d-compiler' 'dub' 'dtools')

# these should match dub.selections.json
_d_ae_ver=0.0.2833
_d_btrfs_ver=0.0.11
_d_ncurses_ver=0.0.149

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/CyberShadow/${pkgname}/archive/v${pkgver}.tar.gz
		ae-${_d_ae_ver}.tar.gz::https://github.com/CyberShadow/ae/archive/v${_d_ae_ver}.tar.gz
		d-btrfs-${_d_btrfs_ver}.tar.gz::https://github.com/CyberShadow/d-btrfs/archive/v${_d_btrfs_ver}.tar.gz
		ncurses-${_d_ncurses_ver}.tar.gz::https://github.com/D-Programming-Deimos/ncurses/archive/v${_d_ncurses_ver}.tar.gz
	   )
sha256sums=('5e60ee7fcda13b4ba7191947979579f657ca6e69101ae87a1244afca435ade2c'
            '97f129484f7ff431d0be3430ab62d32955c17cc43e6993de4a628ea4b8574c23'
            '061df12548e09535e897031ce7de3854d287be0afcced9f59df972d9a08afe61'
            '2c8497f5dd93f9d3a05ca7ed57c4fcaee1e988fd25a24de106917ddf72f34646')

prepare() {
  ln -sf ae-${_d_ae_ver} "${srcdir}/ae" # directory name must be "ae" for --rdmd
  cd "${srcdir}/${pkgname}-${pkgver}"
  HOME="${srcdir}" dub add-local ../ae ${_d_ae_ver}
  HOME="${srcdir}" dub add-local ../d-btrfs-${_d_btrfs_ver} ${_d_btrfs_ver}
  HOME="${srcdir}" dub add-local ../ncurses-${_d_ncurses_ver} ${_d_ncurses_ver}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  HOME="${srcdir}" dub --skip-registry=all build -b release --rdmd || # --rdmd creates smaller binaries
  HOME="${srcdir}" dub --skip-registry=all build -b release # retry without --rdmd - https://github.com/dlang/dub/pull/2033
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
