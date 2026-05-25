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
  # 1. Create directory for the binary
  install -d "${pkgdir}/usr/bin"
  
  # 2. Rename the actual binary (add a 'bin' suffix so it doesn't conflict)
  install -Dm755 build/ServerPickerX "${pkgdir}/usr/lib/${pkgname}/ServerPickerX"

  # 3. Create a wrapper script in /usr/bin that executes from a writable home folder
  echo -e "#!/bin/bash\ncd ~ && /usr/lib/${pkgname}/ServerPickerX" > "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"

  # 4. Copy the license
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
