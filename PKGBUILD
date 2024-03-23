# Maintainer: robertfoster
# Contributor: jon wiersma < arch aur at jonw dot org>
# Contributor: abozanich

_name=linux-sgx-driver
pkgname="${_name}-dkms-git"
pkgver=2.14.r2.b6f5b4a
pkgrel=1
pkgdesc="Intel® SGX Linux module - dkms"
arch=('i686' 'x86_64')
url="https://01.org/intel-softwareguard-extensions"
license=('GPL2')
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel'
  'linux-lts-headers: Build the module for LTS Arch kernel'
  'linux-zen-headers: Build the module for Zen Arch kernel')
source=("${_name}::git+https://github.com/intel/${_name}.git"
  "dkms.conf"
  "sgx_main.patch"
)
sha256sums=('SKIP'
            '317e476c57e891eecd6c6b57eceb3ed7ab7ffbf3ba0a40362e08b5d35f23fe6f'
            'b84b8ef9e12baff3618845ff9f14d1bf325b298f8e22e2048eac75cb84f46844')

pkgver() {
  cd "${_name}"
  printf "%s" "$(git describe --tags | sed 's/sgx_diver_//g' | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${_name}"
  patch -Np1 -i "${srcdir}/sgx_main.patch"
}

package() {
  installDir="${pkgdir}/usr/src/${_name}-${pkgver}"

  install -dm755 "${installDir}"

  # Copy dkms .conf
  install -Dm644 ../dkms.conf "${installDir}/dkms.conf"

  # Set name and version
  sed -e "s/@PKG@/${_name}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${installDir}/dkms.conf"

  # Copy sources
  cp -r "${srcdir}/${_name}"/* "${installDir}"

  # Remove .git folder
  rm -rf "${installDir}/.git*"
}
