# Maintainer: Nichlas Severinsen <ns@nsz.no>

pkgname=shufflecake
_gitname=$pkgname-c
pkgver=v0.5.3
pkgrel=1
pkgdesc="Plausible deniability layer for Linux (Userland & DKMS)"
arch=("x86" "x86_64")
url="https://shufflecake.net/"
license=("GPL3")
depends=("device-mapper" "libgcrypt" "dkms" "glibc")
makedepends=("make")
provides=("$pkgname")
conflicts=("$pkgname")
source=(
  "https://codeberg.org/${pkgname}/${_gitname}/archive/${pkgver}.tar.gz"
  "dkms.conf"
  "dm-sflc-dkms.conf"
)

# Update with `updpkgsums`
sha256sums=('3d642ae5fba0299d1e41298fc6f506ba3820e4487b71aa5fdb7bb3b652375c69'
            'eb95503a32f8aea67a78e1503a97a29cdedfa9e7d7bafd743734faf4f4b69236'
            'ce91cea869435bdc7d34c9777ef3112960e9b260556501125bbb048a9d6f4416')

build() {
  cd "${srcdir}/$_gitname"
  make -C "${pkgname}-userland"
}

package() {

  # Their `make install` has no DESTDIR support
  # We'll install manually for now.

  # Userland
  
  install -Dm755 "${srcdir}/${_gitname}/${pkgname}-userland/bin/proj_build/shufflecake" \
                 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${_gitname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # DKMS 

  dkmsdir="${pkgdir}/usr/src/dm-sflc-dkms-${pkgver}"

  # Load dm-sflc-dkms automatically at boot
  install -Dm644 "${srcdir}/dm-sflc-dkms.conf" "${pkgdir}/etc/modules.load.d/dm-sflc-dkms.conf"

  # Install & patch dkms file with version 
  install -Dm644 "${srcdir}/dkms.conf" "${dkmsdir}/dkms.conf" 
  sed -e "s/@PKGVER@/${pkgver}/" -i "${dkmsdir}/dkms.conf"
  
  # Copy sources for dm-sflc
  cd "${srcdir}/${_gitname}/dm-sflc/" 
  cp -r . "${dkmsdir}"
  
}
