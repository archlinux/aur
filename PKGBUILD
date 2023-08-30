# Maintainer: alcubierre-drive
pkgname=naturaldocs2-git
pkgver=r2141.dc9452d
pkgrel=1
pkgdesc="Readable Source Code Documentation for 20 Programming Languages"
url="https://www.naturaldocs.org/"
source=('NaturalDocs::git+https://github.com/NaturalDocs/NaturalDocs.git' naturaldocs2)
arch=('i686' 'x86_64' 'aarch64')
license=('AGPLv3')
depends=('mono')
optdepends=()
makedepends=(sqlite)
conflicts=()
replaces=(naturaldocs2)
backup=()
install=

md5sums=('SKIP' '53a82c33c4b42e6558eca5f01d55685b')

build() {
  cd "${srcdir}/NaturalDocs/"
  mkdir -p "build/"
  xbuild /property:Configuration=Release \
         /property:TargetDir='../build/' \
         /property:OperatingSystemTarget=Unix CLI/CLI.csproj
}

pkgver() {
  cd "${srcdir}/NaturalDocs/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  cp -r "${srcdir}/NaturalDocs/build/"* "${pkgdir}/opt/${pkgname}/"
  cp -r "${srcdir}/NaturalDocs/CLI/bin/Release/"* "${pkgdir}/opt/${pkgname}/"
  cp -r "${srcdir}/NaturalDocs/Engine/bin/Release/"* "${pkgdir}/opt/${pkgname}/"
  cp "${srcdir}/NaturalDocs/Engine/Resources/SQLite/NaturalDocs.Engine.dll.config" \
     "${pkgdir}/opt/${pkgname}/"
  cp /usr/lib/libsqlite3.so "${pkgdir}/opt/${pkgname}/libSQLite.Linux.x64.so"
  cp /usr/lib/libsqlite3.so "${pkgdir}/opt/${pkgname}/libSQLite.Linux.x86.so"

  mkdir -p ${pkgdir}/usr/bin/
  cp ${srcdir}/naturaldocs2 ${pkgdir}/usr/bin/
}
