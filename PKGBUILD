# Maintainer: Evilleader <evilleader91@gmail.com>
_pkgname=server-picker-x
pkgname=server-picker-x-git
pkgver=1.0.6
pkgrel=1
pkgdesc="Lightweight CS2, Deadlock and Marathon GUI server picker for blocking/unblocking server locations"
arch=('x86_64') # .NET compiled binary targets standard desktop CPUs
url="https://github.com/FN-FAL113/server-picker-x"
license=('GPL-3.0')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'dotnet-sdk') # Requires Microsoft's .NET SDK to compile from source
provides=('server-picker-x')
conflicts=('server-picker-x')
source=("git+${url}.git")
sha256sums=('SKIP')

# CRITICAL: Prevents Arch from mangling self-contained .NET binary structures
options=('!strip' '!debug')

build() {
  cd "${_pkgname}"
  
  # Compile the C# project into a single self-contained executable for Linux
  dotnet publish ServerPickerX/ServerPickerX.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -o ../build
}

package() {
  # 1. Create system binary folder
  install -d "${pkgdir}/usr/bin"
  
  # 2. Install the compiled single binary executable directly into /usr/bin
  # The file compiled by dotnet matches the project name exactly: "ServerPickerX"
  install -Dm755 build/ServerPickerX "${pkgdir}/usr/bin/${pkgname}"

  # 3. Copy the license file over
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
