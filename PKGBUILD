# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="IronPython"
_basename="${_Name,,}"
pkgver=2.7.12
pkgrel=3
pkgname="${_basename}${pkgver%%.*}"
pkgdesc="Implementation of the Python programming language for .NET Framework; built on top of the Dynamic Language Runtime (DLR)"
arch=('any')
url="https://ironpython.net"
_url="https://github.com/IronLanguages/${pkgname}"
license=('Apache-2.0')
depends=(
  'mono>=5.12'
  'sh'
)
makedepends=(
  'mono-msbuild'
  'nuget'
)
optdepends=(
  'gtk2: Window Console Help'
)
provides=(
  "${_basename}${pkgver%.*}"
)
replaces=(
  "${_basename}<3"
)
conflicts=(
  "${provides[@]}"
  "${replaces[@]}"
)
_pkgsrc="${_url##*/}-ipy-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/ipy-${pkgver}.tar.gz"
        "dlr-60dfacb9852ec022dd076c152e286b116553c905.tar.gz::https://github.com/IronLanguages/dlr/archive/60dfacb9852ec022dd076c152e286b116553c905.tar.gz"
        "${pkgname}_nuget_config_json_url.patch"
        "${_basename}.sh")
b2sums=('df01bb18b07c1fe43fb87990c60dcd342bc861dbc9bd32abdf4f975d8d7275888290b298b8ed65f7131ca22c5cf47537c4d0413cfc760647a68b32e57619f903'
        '20a8da80eb7e8605577e57e3ea9bc698c2e7ecc74d1411e6b6647a78d9c99821cc349943e938d136d8029947eec27e13f71c9d4b63dafca95f8e836fd46dc32f'
        '65b81a7b6d4b69da948bc834c49609c172beab926fde0d30a90d9c02e0ed9a4bb9c4070b62acd569cba9ba412e0ff58b422d61d33e030bc52cf1fcf34f306152'
        'b8fd9254e36ce7bfa00e38c6d5886283c1aed1a530ca65775cf5639b5ff46b8ebe346f674146ed54d24a9793a7d58590673f0334756219ad530741504b4cb722')

_srcenv() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
}

prepare() {
  _srcenv

  cd "${srcdir}"
  sed -i "s/@@VERSION_MAJOR_MINOR@@/${pkgver%.*}/g" "${_basename}.sh"

  cp -RT "dlr-60dfacb9852ec022dd076c152e286b116553c905" "${_pkgsrc}/Src/DLR"

  cd "${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_nuget_config_json_url.patch"
  sed -i '/<TreatWarningsAsErrors>/d' 'Directory.Build.props'

  nuget restore
}

build() {
  _srcenv
  local msbuild_options=(
    Build.proj
    /p:Configuration=Release
    /p:Platform="Any CPU"
    /p:TargetFramework=net45
    /p:DebugType=None
    /p:DebugSymbols=false
    /t:Stage
    /nologo
    /verbosity:minimal
    -m
  )

  cd "${srcdir}/${_pkgsrc}"
  msbuild "${msbuild_options[@]}"
}

# check() {
#   _srcenv
#   local msbuild_options=(
#     Src/IronPythonTest/IronPythonTest.csproj
#     /p:Configuration=Release
#     /p:Platform="Any CPU"
#     /p:TargetFramework=net45
#     /t:VSTest
#     /nologo
#     /verbosity:minimal
#     -m
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   msbuild "${msbuild_options[@]}"
# }

package() {
  cd "${srcdir}"
  for _exe in ipy ipyc ipyw; do
    install -vDm755 "${_basename}.sh" "${pkgdir}/usr/bin/${_exe}${pkgver%.*}"
    sed -i "s/@@EXE@@/${_exe}/g"      "${pkgdir}/usr/bin/${_exe}${pkgver%.*}"
    ln -vsf "${_exe}${pkgver%.*}"     "${pkgdir}/usr/bin/${_exe}${pkgver%%.*}"
  done
  for _exe in ipy ipyw; do
    install -vDm755 "${_basename}.sh" "${pkgdir}/usr/bin/${_exe}${pkgver%.*}-32"
    sed -i "s/@@EXE@@/${_exe}32/g"    "${pkgdir}/usr/bin/${_exe}${pkgver%.*}-32"
    ln -vsf "${_exe}${pkgver%.*}-32"  "${pkgdir}/usr/bin/${_exe}${pkgver%%.*}-32"
  done

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "Package/Release/Stage/${_Name}-${pkgver}"
  install -vd "${pkgdir}/usr/lib/${_basename}${pkgver%.*}" "${pkgdir}/usr/share/${_basename}${pkgver%.*}"
  cp -aT --no-preserve=ownership "Lib"   "${pkgdir}/usr/lib/${_basename}${pkgver%.*}"
  cp -aT --no-preserve=ownership "net45" "${pkgdir}/usr/share/${_basename}${pkgver%.*}"
}
