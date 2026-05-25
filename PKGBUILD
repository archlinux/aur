# Maintainer: Evilleader <evilleader91@gmail.com>
_pkgname=server-picker-x
pkgname=server-picker-x-git
pkgver=1.0.6
pkgrel=1
pkgdesc="Lightweight CS2, Deadlock and Marathon GUI server picker for blocking/unblocking server locations"
arch=('x86_64') # .NET compiled binary targets standard desktop CPUs
url="https://github.com/FN-FAL113/server-picker-x"
license=('GPL-3.0')
depends=('glibc' 'gcc-libs' 'fontconfig')
makedepends=('git' 'dotnet-sdk') # Requires Microsoft's .NET SDK to compile from source
provides=('server-picker-x')
conflicts=('server-picker-x')
source=("git+${url}.git")
sha256sums=('SKIP')

# CRITICAL: Prevents Arch from mangling self-contained .NET binary structures
options=('!strip' '!debug')

build() {
  cd "${_pkgname}"

  # Tell .NET to include the required native SkiaSharp libraries for Linux
  dotnet publish ServerPickerX/ServerPickerX.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:IncludeNativeLibrariesForSelfExtract=true \
    -o ../build
}

package() {
  # 1. Install files to /opt/ (a common place for self-contained, writable apps)
  install -d "${pkgdir}/opt/${pkgname}"
  
  # Copy everything to /opt/
  cp -r build/* "${pkgdir}/opt/${pkgname}/"
  
  # 2. Create the symbolic link in /usr/bin/
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/ServerPickerX" "${pkgdir}/usr/bin/${pkgname}"

  # 3. FIX: Grant the world (or your user) permission to write in /opt/
  # This allows the app to create the log file in its own directory
  chmod -R 777 "${pkgdir}/opt/${pkgname}"

  # 4. Copy the license
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
