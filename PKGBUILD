# Maintainer: Henry Graham <henry)dot(arch)at(hgrahamcs)dot(com(>

_pkgbase=msi-psu
pkgname=msi-psu-dkms
pkgver=1
pkgrel=2
pkgdesc="MSIPSU Kernel Module (DKMS)"
arch=('x86_64')
url="https://github.com/JackDoan/msi-psu"
license=('GPL2')
depends=('dkms'
	 'gcc'
	 'linux-headers'
)
conflicts=("${_pkgbase}")
source=("https://raw.githubusercontent.com/JackDoan/msi-psu/refs/heads/main/msi-psu.c"
	"https://raw.githubusercontent.com/JackDoan/msi-psu/refs/heads/main/Makefile"
        'dkms.conf'
	'MakefileTarget.patch'
)
sha256sums=('fa0fd45a9c1ce3f09bfdac378929afd6a069eb57ff5448f451e1135dfabd36b4'
            '93198fbdc1325965005c7df0df83425e71409b229b6802561e2916a5eede540f'
            '6d4725a169129c78b0c2f6860d9b9b6f7f6b8026b20bcb460c67cdc187a1d037'
            '3a127181cae27801f8293e55f4f6298d8c156ddb6213dfcbcbcaf57d2c0f738e')
prepare() {
  cd "${srcdir}"
  
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i dkms.conf

  # Copy the Makefile to avoid symlink issues
  cp -L Makefile Makefile.tmp
  mv Makefile.tmp Makefile
  
  patch -Np0 -i MakefileTarget.patch
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
