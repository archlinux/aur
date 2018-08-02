# Maintainer: anonimal <anonimal at getmonero dot org>

pkgname=('kovri')
# AUR's stupid pkgver convention prevents hypens
pkgver=0.1.0_alpha
pkgrel=1
pkgdesc="Official package for Kovri: a free, decentralized, anonymity technology developed by Monero"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://getkovri.org/"
license=('custom:BSD-3')
depends=('boost-libs')
makedepends=('git' 'cmake' 'boost' 'openssl')
provides=('kovri')
conflicts=('kovri-git')
source=("${pkgname}"::"git+https://github.com/monero-project/kovri#tag=v${pkgver//_/-}")
sha256sums+=('SKIP')

prepare()
{
  git -C "${pkgname}" submodule update --init --recursive --force
}

build()
{
  cd "${srcdir}/${pkgname}"
  make release
}

# TODO(anonimal): hack. We should supply env options to `make install`
package()
{
  # Local resources path
  local _data_dir="${HOME}/.kovri"
  if [[ ! -d $_data_dir ]]; then
    mkdir "$_data_dir" 2>/dev/null
  fi

  # Remove existing resources
  local _core=${_data_dir}/core
  local _client=${_data_dir}/client
  local _resources=($_core ${_client}/address_book/addresses ${_client}/address_book/addresses.csv ${_client}/certificates)
  for _resource in ${_resources[@]}; do
    if [[ -e $_resource ]]; then
      rm -fr $_resource 2>/dev/null
    fi
  done

  # Install new resources
  cp -fR "${srcdir}/${pkgname}/pkg/client" "${HOME}/.kovri/"
  install -b -Dm600 "${srcdir}/${pkgname}/pkg/config/kovri.conf" "${HOME}/.kovri/config/kovri.conf"
  install -b -Dm600 "${srcdir}/${pkgname}/pkg/config/tunnels.conf" "${HOME}/.kovri/config/tunnels.conf"

  # Install remaining package
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm755 "${srcdir}/${pkgname}/build/kovri" "${pkgdir}/usr/bin/kovri"
  install -Dm755 "${srcdir}/${pkgname}/build/kovri-util" "${pkgdir}/usr/bin/kovri-util"
}
