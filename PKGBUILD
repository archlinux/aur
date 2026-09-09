# Maintainer: GYFOOYA <gyfooya@antispam-gmail>

pkgname=labelforge-bin
pkgver=1.16.1
pkgrel=1
pkgdesc="Free and open-source ZPL label designer"
arch=('x86_64')
url="https://github.com/dextsamu/labelforge"
license=('MIT')

depends=(
'alsa-lib'
'gtk3'
'libxss'
'nss'
)

source=(
"LabelForge-linux-x64.zip::https://github.com/dextsamu/labelforge/releases/download/v${pkgver}/LabelForge-linux-x64.zip"
)

sha256sums=('0b06f3d41087fb094b06a2722f5c84a8741cb2ec28e81205e5547156fd67fcf3')

options=('!strip')

package() {
local appdir="${pkgdir}/opt/labelforge"
local resdir="${srcdir}/LabelForge-linux-x64/resources/app"

```
# Install complete Electron application
install -dm755 "${appdir}"
cp -a "${srcdir}/LabelForge-linux-x64/." "${appdir}/"

# Normalize permissions from the archive.
# The upstream archive contains directories with restrictive
# permissions that would otherwise prevent normal users from
# accessing the application.
find "${appdir}" -type d -exec chmod 755 {} +
find "${appdir}" -type f -exec chmod 644 {} +

# Executables
chmod 755 "${appdir}/LabelForge"
chmod 755 "${appdir}/chrome_crashpad_handler"

# Electron Chromium sandbox
chmod 4755 "${appdir}/chrome-sandbox"

# Command line launcher
install -dm755 "${pkgdir}/usr/bin"
ln -s "/opt/labelforge/LabelForge" \
    "${pkgdir}/usr/bin/labelforge"

# Application icons
install -Dm644 \
    "${resdir}/build/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/labelforge.png"

install -Dm644 \
    "${resdir}/build/icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/labelforge.svg"

# Desktop entry
install -dm755 "${pkgdir}/usr/share/applications"

printf '%s\n' \
    '[Desktop Entry]' \
    'Name=LabelForge' \
    'Comment=ZPL label designer' \
    'Exec=labelforge %U' \
    'Icon=labelforge' \
    'Terminal=false' \
    'Type=Application' \
    'Categories=Graphics;Office;' \
    'StartupWMClass=LabelForge' \
    > "${pkgdir}/usr/share/applications/labelforge.desktop"

# License
install -Dm644 \
    "${resdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
```

}
