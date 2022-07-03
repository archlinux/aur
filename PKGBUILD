# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=btdu
pkgver=0.4.1
pkgrel=1
pkgdesc='sampling disk usage profiler for btrfs'
arch=('i686' 'x86_64')
url='https://github.com/CyberShadow/btdu'
license=('GPL2')
depends=('ncurses' 'd-runtime')
makedepends=('d-compiler' 'dub' 'dtools')

# these should match dub.selections.json
_d_ae_ver=0.0.3184
_d_btrfs_ver=0.0.12
_d_ncurses_ver=0.0.149
_d_emsi_containers_ver=0.9.0

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/CyberShadow/${pkgname}/archive/v${pkgver}.tar.gz
		ae-${_d_ae_ver}.tar.gz::https://github.com/CyberShadow/ae/archive/v${_d_ae_ver}.tar.gz
		d-btrfs-${_d_btrfs_ver}.tar.gz::https://github.com/CyberShadow/d-btrfs/archive/v${_d_btrfs_ver}.tar.gz
		ncurses-${_d_ncurses_ver}.tar.gz::https://github.com/D-Programming-Deimos/ncurses/archive/v${_d_ncurses_ver}.tar.gz
		emsi_containers-${_d_emsi_containers_ver}.tar.gz::https://github.com/dlang-community/containers/archive/v${_d_emsi_containers_ver}.tar.gz
	   )
sha256sums=('265c63ee82067f6b5dc44b47c9ec58be5e13c654f31035c60a7e375ffa4082c9'
            '74c17146ecde7ec4ba159eae4f88c74a5ef40cc200eabf97a0648f5abb5fde5e'
            'cf2b1fa3e94a0aa239d465adbac239514838835283521d632f571948aa517f92'
            '2c8497f5dd93f9d3a05ca7ed57c4fcaee1e988fd25a24de106917ddf72f34646'
            '5e256b84bbdbd2bd625cba0472ea27a1fde6d673d37a85fe971a20d52874acaa')

prepare() {
  ln -sf ae-${_d_ae_ver} "${srcdir}/ae" # directory name must be "ae" for --rdmd
  cd "${srcdir}/${pkgname}-${pkgver}"
  HOME="${srcdir}/_dub" dub add-local ../ae ${_d_ae_ver}
  HOME="${srcdir}/_dub" dub add-local ../d-btrfs-${_d_btrfs_ver} ${_d_btrfs_ver}
  HOME="${srcdir}/_dub" dub add-local ../ncurses-${_d_ncurses_ver} ${_d_ncurses_ver}
  HOME="${srcdir}/_dub" dub add-local ../containers-${_d_emsi_containers_ver} ${_d_emsi_containers_ver}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  HOME="${srcdir}/_dub" dub --skip-registry=all build -b release --rdmd || # --rdmd creates smaller binaries
  HOME="${srcdir}/_dub" dub --skip-registry=all build -b release # retry without --rdmd - https://github.com/dlang/dub/pull/2033
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D "${srcdir}/${pkgname}-${pkgver}/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
