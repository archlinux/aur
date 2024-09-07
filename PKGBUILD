# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=syndical
pkgver=1.1.0
pkgrel=3
_pkgname="Syndical-${pkgver}"
_exe="TheAirBlow.Syndical.Application"
pkgdesc="An alternative to SamLoader - cleaner code, easier to understand and tamper with."
arch=('any')
url="https://github.com/Samsung-Loki/Syndical"
license=('MPL-2.0')
depends=('dotnet-runtime-7.0' 'gcc-libs' 'glibc' 'openssl-1.1')
makedepends=('dotnet-sdk-7.0')
optdepends=('android-udev: Adds udev rules for non-root users (Group adbusers)')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Samsung-Loki/Syndical/archive/refs/tags/v${pkgver}.tar.gz"
        'imei-fix.patch')
sha256sums=('7d8b4156a3fe9b0bb28b358d2fdc61912ab04daae20177fac7aa8430bcd845a0'
            '5434c1d2f8f055fa1c438af8e0ad226f17a572b3fa123a148aafddf36f99bfb8')

prepare() {
  cd "${_pkgname}"
  # IMEI fix 
  patch -Np1 -i "${srcdir}/imei-fix.patch"
}

build() {
  # https://learn.microsoft.com/en-us/dotnet/core/tools/#cli-commands
  # Add needed Nuget packages for building
  _NuPkgs=(
    "BouncyCastle.NetCore"
    "CommandLineParser"
    "Serilog"
    "Serilog.Exceptions"
    "Serilog.Sinks.Console"
    "Spectre.Console"
  )
  _NuVers=(
    "1.8.10"
    "2.8.0"
    "2.10.0"
    "8.0.0"
    "4.0.1"
    "0.42.0"
  )

  for i in "${!_NuPkgs[@]}"; do
    dotnet add "${_pkgname}/${_exe}/${_exe}.csproj" \
      package "${_NuPkgs[$i]}" -v "${_NuVers[$i]}" \
      --package-directory NuGet
  done

  # Build Visual Studio solution
  dotnet build "${_pkgname}/Syndical.sln" \
    --source NuGet \
    --configuration Release \
    --output build

  # https://learn.microsoft.com/en-us/nuget/consume-packages/managing-the-global-packages-and-cache-folders
  # Cleanup NuGet global-packages (optional)
  #dotnet nuget locals all --clear
}

package() {
  # Install package
  install -d "${pkgdir}/usr/bin"
  install -Dm644 ${srcdir}/build/*{.dll,.json} -t "${pkgdir}/opt/${pkgname}"
  install -Dm755 ${srcdir}/build/*.Application -t "${pkgdir}/opt/${pkgname}"
  # Install executable /usr/bin file
  ln -s "/opt/${pkgname}/${_exe}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
