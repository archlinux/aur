# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="IronPython"
_basename="${_Name,,}"
_commit_rel="bd43cf1cdde50171946da6d3a5b0a62898cdce96" # 2.7.12
_commit="d834e174b8e4f75eb98c9f185cc66d094b2dd42c" # r4
pkgver="2.7.12+r4+g${_commit::7}"
_pkgver="${pkgver%%+*}"
pkgrel=1
pkgname="${_basename}${_pkgver%%.*}"
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
  "${_basename}${_pkgver%.*}"
)
replaces=(
  "${_basename}<3"
)
conflicts=(
  "${provides[@]}"
  "${replaces[@]}"
)
_pkgsrc="${_url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "dlr-60dfacb9852ec022dd076c152e286b116553c905.tar.gz::https://github.com/IronLanguages/dlr/archive/60dfacb9852ec022dd076c152e286b116553c905.tar.gz"
        "${_basename}.sh")
b2sums=('2897e097dfb4e16179c2ace34487627d1a0a62a37fdc712e5b673074ad245cbd76eef3f2fb3d4a710008f27e94e9a821598ad04507850e1d31826c70ad9ce887'
        '20a8da80eb7e8605577e57e3ea9bc698c2e7ecc74d1411e6b6647a78d9c99821cc349943e938d136d8029947eec27e13f71c9d4b63dafca95f8e836fd46dc32f'
        'b8fd9254e36ce7bfa00e38c6d5886283c1aed1a530ca65775cf5639b5ff46b8ebe346f674146ed54d24a9793a7d58590673f0334756219ad530741504b4cb722')

_srcenv() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
}

prepare() {
  _srcenv

  cd "${srcdir}"
  sed -i "s/@@VERSION_MAJOR_MINOR@@/${_pkgver%.*}/g" "${_basename}.sh"

  cp -RT "dlr-60dfacb9852ec022dd076c152e286b116553c905" "${_pkgsrc}/Src/DLR"

  cd "${_pkgsrc}"
  rm -vf "NuGet.config"
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
    install -vDm755 "${_basename}.sh" "${pkgdir}/usr/bin/${_exe}${_pkgver%.*}"
    sed -i "s/@@EXE@@/${_exe}/g"      "${pkgdir}/usr/bin/${_exe}${_pkgver%.*}"
    ln -vsf "${_exe}${_pkgver%.*}"    "${pkgdir}/usr/bin/${_exe}${_pkgver%%.*}"
  done
  for _exe in ipy ipyw; do
    install -vDm755 "${_basename}.sh" "${pkgdir}/usr/bin/${_exe}${_pkgver%.*}-32"
    sed -i "s/@@EXE@@/${_exe}32/g"    "${pkgdir}/usr/bin/${_exe}${_pkgver%.*}-32"
    ln -vsf "${_exe}${_pkgver%.*}-32" "${pkgdir}/usr/bin/${_exe}${_pkgver%%.*}-32"
  done

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "Package/Release/Stage/${_Name}-${_pkgver}"
  install -vd "${pkgdir}/usr/lib/${_basename}${_pkgver%.*}" "${pkgdir}/usr/share/${_basename}${_pkgver%.*}"
  cp -aT --no-preserve=ownership "Lib"   "${pkgdir}/usr/lib/${_basename}${_pkgver%.*}"
  cp -aT --no-preserve=ownership "net45" "${pkgdir}/usr/share/${_basename}${_pkgver%.*}"
}
