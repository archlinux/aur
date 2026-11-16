# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Noah Vogt (noahvogt) <noah@noahvogt.com>

_pkgname=headlamp
pkgname=headlamp-bin
pkgver=0.46.0
pkgrel=1
pkgdesc='A Kubernetes web UI that is fully-featured, user-friendly and extensible'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
url='https://headlamp.dev/'
depends=('gtk3' 'libxss' 'nss')
provides=('headlamp')
conflicts=('headlamp')
options=('!debug' '!strip' '!emptydirs')
source=(${_pkgname}.svg::"https://raw.githubusercontent.com/kubernetes-sigs/headlamp/main/frontend/src/resources/icon-dark.svg"
        "${_pkgname}.desktop")
source_x86_64=(${_pkgname}-${pkgver}-x64.tar.gz::"https://github.com/kubernetes-sigs/headlamp/releases/download/v${pkgver}/Headlamp-${pkgver}-linux-x64.tar.gz")
source_aarch64=(${_pkgname}-${pkgver}-arm64.tar.gz::"https://github.com/kubernetes-sigs/headlamp/releases/download/v${pkgver}/Headlamp-${pkgver}-linux-arm64.tar.gz")
b2sums=('60dfacf0a97e0a642a25ca38e54a0c9448598ad0d9f40afe0966029536c40d502940068a1029463ce63df9e5216d4eba7fbd75538cedfdfd10f4014b8673a5bb'
        '775b6f07693b57548517b7e2f5cbf576daac8cc4ab744289ae2d8bb986d3609f8c5330776603fbf140a264bb31d3bba2dff3db5435aef22f9ddcabddc25c2853')
b2sums_x86_64=('cb54995eee6740a610c97a43a4507bf5f1616cd94b5b9839185189bbfe122b3f1aec7d16a230548cce8142201ce73b2df73ef5dac46bc607142c42d078e1edee')
b2sums_aarch64=('fff5c952db987a8899d9ec4ab12384a68eb6f82ed3b7769b86babbf8e1a96c4aff78ce5ffd820a3f00de569712551f4ecd9416533e4571a593d664fcfa05e31f')

package() {
  local _arch
  case "${CARCH}" in
    x86_64) _arch=x64 ;;
    aarch64) _arch=arm64 ;;
  esac

  # move the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${_pkgname}
  mv "${srcdir}"/Headlamp-${pkgver}-linux-${_arch}/* \
    "${pkgdir}"/usr/share/${_pkgname}

  # icon
  install -Dm 644 ${_pkgname}.svg \
    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg

  # desktop file
  install -Dm 644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${_pkgname}/${_pkgname} \
    "${pkgdir}"/usr/bin/${_pkgname}

  # clean and fix permissions
  chmod -x "${pkgdir}"/usr/share/${_pkgname}/*.so
}
