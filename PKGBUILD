# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="FAKE"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=6.1.3
pkgrel=2
pkgdesc="Cross platform F# build automation system"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://fake.build"
_url="https://github.com/fsprojects/${_Name}"
license=('Apache-2.0')
depends=('dotnet-runtime-6.0' 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-any.zip")
source=("${_pkgsrc}-any.zip::${_url}/releases/download/${pkgver}/fake-dotnetcore-portable.zip"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE.txt::${_url}/raw/refs/tags/${pkgver}/License.txt"
        "${_pkgsrc}.bash::${_url}/raw/refs/tags/${pkgver}/completion/bash/fake-completion.bash"
        "${_pkgsrc}.powershell::${_url}/raw/refs/tags/${pkgver}/completion/powershell/posh-fake.psm1"
        "${_pkgname}.sh")
sha256sums=('737b518f147ddb82677cf3f7ba64cc5a9be3d69a4e89771972e7860150645ba4'
            'd67208f0b909d1a0fcb5ae82a0f524de1bd01c767c7041d0d801b6374b70f5dd'
            '84bc6641335ca2e7ff35969943f15fd37e9772f097f7591faea160d3fa814800'
            '9a6f62e564b44627a8e1268fa600b715c8412d5c98ecaf294401ea45879f54a4'
            'fa064a1fffee2c23d98fa4e50b4c94d6686f9306ff168314c40b45d4e553bd51'
            '1e92f382e5f318cc08ea46aad321d04e69e6b151eeb1039a4f3848c8f71d86a7')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-any"
  bsdtar -xf "${_pkgsrc}-any.zip" -C "${_pkgsrc}-any"

  cd "${_pkgsrc}-any/runtimes"
  find . -mindepth 1 -maxdepth 1 -type d ! -name "linux-${_msarch}" -exec \
    rm -rf "{}" +
}

package() {
  cd "${srcdir}"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-any"/* "${pkgdir}/usr/lib/${_pkgname}"

  install -vDm755 "${_pkgname}.sh"         "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "${_pkgsrc}.bash"        "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgsrc}.powershell"  "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}
