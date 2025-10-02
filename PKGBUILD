# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="SS14.Launcher"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.35.0
pkgrel=1
pkgdesc="Space Station 14 launcher"
arch=('aarch64' 'x86_64')
url="https://spacestation14.com"
_url="https://github.com/space-wizards/${_Name}"
license=('MIT')
depends=(
  "dotnet-runtime-${_sdk}"
)
makedepends=(
  'gendesk'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-all.zip::${_url}/releases/download/v${pkgver}/${_Name}_Linux.zip"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/Readme.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE.txt"
        "${_pkgname}.svg::https://github.com/space-wizards/asset-dump/raw/refs/heads/master/icon.svg")
sha256sums=('1faae8d65337e0eacb9570742a87a3ccc5c08babfd4c47d985f0205537c2b068'
            'a4fe3a4ff1dcddaf4ce428f91a068bada67090a4f670730fb29f828c4a8a6f71'
            '0fbcce2a4bb551dab1e360febc2b26c5abbad45e91c4d7b78203735e6b8e807e'
            'a047c810a26088cc1fd1df73036bd5b4cfb441c0697a2cbd583733d08474f37e')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

build() {
  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${_pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_Name}" \
    --exec "${_Name}" \
    --categories "Game"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgname}.desktop"  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.svg"      "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${_pkgname}"
  cp -vaT "bin_${_msarch}" "${pkgdir}/usr/lib/${_pkgname}"
  ln -vsf "/usr/lib/${_pkgname}/${_Name}" "${pkgdir}/usr/bin/${_Name}"
}
