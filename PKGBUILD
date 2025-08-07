# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=8.0
pkgname="trx2junit"
pkgver=2.1.0
pkgrel=1
pkgdesc="Transforms XML from trx-Testresults to JUnit-Testresults / trx to JUnit XML and the other way round"
arch=('x86_64')
url="https://github.com/gfoidl/${pkgname}"
license=('MIT')
depends=("dotnet-runtime-${_sdk}")
makedepends=("dotnet-sdk-${_sdk}")
options=('!strip' '!debug')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d2e4d1b681e30e3fdac009dfd68155c6b5728d94fc8a933556f7f1345f0156e59fb6e88e3e0c2b1396995bdd168057a319e8337a54b65233baaa2b8658f15434')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

_srcenv() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
}

prepare() {
  _srcenv
  local dotnet_options=(
    --runtime "linux-${_msarch}"
    --locked-mode
    # --verbosity normal
  )

  cd "${srcdir}/${_pkgsrc}"
  dotnet restore "${dotnet_options[@]}" ./"source/${pkgname}"
}

build() {
  _srcenv
  local dotnet_options=(
    --configuration Release
    --framework "net${_sdk}"
    --no-restore
    --output build
    --no-self-contained
    --runtime "linux-${_msarch}"
    # --verbosity detailed
  )

  cd "${srcdir}/${_pkgsrc}"
  dotnet publish "${dotnet_options[@]}" ./"source/${pkgname}"
  dotnet build-server shutdown

  find "build" -type f -name '*.pdb' -delete
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaP build/* "${pkgdir}/usr/lib/${pkgname}/"
  ln -vsf "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "ReadMe.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
