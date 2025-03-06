# Maintainer: Jujstme <just.tribe at gmail dot com>

pkgname=unleashedrecomp-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="An unofficial PC port of the Xbox 360 version of Sonic Unleashed created through the process of static recompilation"
arch=('x86_64')
url="https://github.com/hedge-dev/UnleashedRecomp"
license=('GPL3')
depends=(
  'gtk3'
  'glib2'
  'pango'
  'harfbuzz'
  'cairo'
  'pixman'
  'libx11'
  'libxext'
  'gcc-libs'
  'glibc'
  'zlib'
  'freetype2'
  'fontconfig'
)
optdepends=(
  'at-spi2-core: Accessibility support'
  'libcloudproviders: Cloud storage integration'
  'libxinerama: Multi-monitor support'
  'libxrandr: Screen resizing support'
  'libxcursor: Cursor theming'
  'libxdamage: Graphics optimizations'
  'wayland: Wayland support'
  'sqlite: Embedded database support'
  'json-glib: JSON parsing'
  'brotli: Brotli compression support'
  'bzip2: Support for .bz2 compressed files'
  'zstd: Support for Zstandard compressed files'
  'libjpeg-turbo: JPEG image support'
  'libtiff: TIFF image support'
  'graphite: Advanced text rendering'
  'libthai: Thai language support'
)
makedepends=('ostree')
source=(
  "https://github.com/hedge-dev/UnleashedRecomp/releases/download/v1.0.1/UnleashedRecomp-Flatpak.zip"
)
sha256sums=(
'1d617da8597830c647ec36c9b08f6d732902355e6fec9f72d72f1ee82c1bbcc9'
)

package() {
  # Extracting the flatpak contents
  ostree init --repo=repo --mode=bare-user
  ostree static-delta apply-offline --repo=repo io.github.hedge_dev.unleashedrecomp.flatpak
  ostree checkout --repo=repo -U $(basename $(echo repo/objects/*/*.commit | cut -d/ -f3- --output-delimiter= ) .commit) outdir
  
  # We need to manually patch the main executable as, by default, it wants to write the
  # data data into /var, which is obviously a bad idea.
  # Instead, we manually edit the executable to extract the data into a .sunrdata directory
  # inside the local home folder
  sed -i 's|/var/data|\.sunrdata|g' outdir/files/bin/UnleashedRecomp
  
  # Then we proceed to setting up the directory inside the pkgdir
  mkdir -p "${pkgdir}/usr/bin/"
  cp "outdir/files/bin/UnleashedRecomp" "${pkgdir}/usr/bin/UnleashedRecomp"
  mkdir -p "${pkgdir}/usr/share/applications"
  
  # And we set up the .desktop file
  cat > "${pkgdir}/usr/share/applications/io.github.hedge_dev.unleashedrecomp.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Unleashed Recompiled
Comment=Static recompilation of Sonic Unleashed
TryExec=UnleashedRecomp
Exec=UnleashedRecomp
Icon=io.github.hedge_dev.unleashedrecomp
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/unleashedrecomp
EOF

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  cp "outdir/files/share/icons/hicolor/128x128/apps/io.github.hedge_dev.unleashedrecomp.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.hedge_dev.unleashedrecomp.png"
}
