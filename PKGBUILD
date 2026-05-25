# Maintainer: Evilleader <evilleader91@gmail.com>
_pkgname=server-picker-x
pkgname=server-picker-x-git
pkgver=1.0.6
pkgrel=1
pkgdesc="Lightweight CS2, Deadlock and Marathon GUI server picker for blocking/unblocking server locations"
arch=('x86_64')
url="https://github.com/FN-FAL113/server-picker-x"
license=('GPL-3.0')
depends=('glibc' 'gcc-libs' 'fontconfig')
makedepends=('git' 'dotnet-sdk')
provides=('server-picker-x')
conflicts=('server-picker-x')
# Add "icon.png" here, assuming it's in the same folder as your PKGBUILD
source=("git+${url}.git")
sha256sums=('SKIP')

# CRITICAL: Prevents Arch from mangling self-contained .NET binary structures
options=('!strip' '!debug')

build() {
  cd "${_pkgname}"

  dotnet publish ServerPickerX/ServerPickerX.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:IncludeNativeLibrariesForSelfExtract=true \
    -o ../build
}

package() {
  # 1. Install files to /opt/
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r build/* "${pkgdir}/opt/${pkgname}/"
  
  # 2. Create the symbolic link in /usr/bin/
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/ServerPickerX" "${pkgdir}/usr/bin/${pkgname}"

  # 3. Permissions for logging
  chmod -R 777 "${pkgdir}/opt/${pkgname}"

  # 4. Install the icon into the hicolor theme
  install -Dm644 "${_pkgname}/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

  # 5. Create desktop entry
  install -d "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=Server Picker X
Comment=Block/Unblock server locations for CS2 and Deadlock
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Utility;Network;
EOF

  # 6. Copy the license
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
