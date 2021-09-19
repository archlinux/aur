# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=quest-package-manager-git
pkgver=r201.44b19ae
pkgrel=1
pkgdesc="Package manager for Quest mods"
arch=('x86_64')
url="https://github.com/sc2ad/QuestPackageManager"
license=('GPL3')

depends=('dotnet-runtime')
makedepends=(
  'git'
  'dotnet-host'
  'dotnet-sdk'
)
provides=()
conflicts=()
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

publish_dir="/QPM/bin/Release/net5.0/arch-x64/publish"

build() {
  cd "${srcdir}/${pkgname}/QPM"
  dotnet clean
  dotnet restore
  dotnet publish -r arch-x64 -c Release

  # run qpm once to generate appsettings.json
  cd "${srcdir}/${pkgname}/${publish_dir}"
  ./QPM version
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"

  cp -a "${srcdir}/${pkgname}/${publish_dir}/". "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/QPM" "${pkgdir}/usr/bin/qpm"
}
