# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: Volodia Kraplich <v1mkss.m@gmail.com>

pkgname=xmcl-launcher
pkgver=0.51.6
pkgrel=1
pkgdesc="X Minecraft Launcher - A modern Minecraft Launcher"
arch=('x86_64' 'aarch64')
provides=('xmcl')
url="https://xmcl.app/"
license=('MIT')
conflicts=('xmcl-launcher-bin')
optdepends=(
  'jre8-openjdk: Minimum requirement for launching older game versions'
  'jre11-openjdk: Recommended Java version for launching versions 1.12-1.17'
  'jre17-openjdk: Recommended Java version for launching version 1.17 and above'
  'jre21-openjdk: Recommended Java version for launching version 1.20.5+ and above'
)
makedepends=('libarchive') # bsdtar is part of libarchive
options=('!strip' '!debug') # Disable stripping and debug symbol generation

# Define source based on architecture
if [ "${CARCH}" = "x86_64" ]; then
  source=("https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-x64.pacman")
  sha256sums=('SKIP')
else
  source=("https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-${CARCH}.pacman")
  sha256sums=('SKIP')
fi

prepare() {
  # Verify the source file exists
  if [ "${CARCH}" = "x86_64" ]; then
    _source_file="xmcl-${pkgver}-x64.pacman"
  else
    _source_file="xmcl-${pkgver}-${CARCH}.pacman"
  fi
  if [[ ! -f "${srcdir}/${_source_file}" ]]; then
    echo "Error: Source file ${_source_file} not found in ${srcdir}."
    echo "Please verify the URL in the source array and ensure the file is downloadable."
    exit 1
  fi

  # Create a temporary directory for extraction
  mkdir -p "${srcdir}/temp"
  cd "${srcdir}/temp"

  # Extract the .pacman file
  bsdtar -xf "${srcdir}/${_source_file}" || {
    echo "Error: Failed to extract the .pacman file: ${srcdir}/${_source_file}"
    exit 1
  }

  # Verify that required directories exist
  if [[ ! -d "opt/xmcl" || ! -d "usr" ]]; then
    echo "Error: Expected directories (opt/xmcl or usr) not found in the extracted .pacman file."
    exit 1
  fi

  # Modify the .desktop file to include --enable-wayland-ime
  if [[ -f "usr/share/applications/xmcl.desktop" ]]; then
    sed -i 's|Exec=/opt/xmcl/xmcl %U|Exec=/opt/xmcl/xmcl --enable-wayland-ime %U|' \
      "usr/share/applications/xmcl.desktop" || {
      echo "Error: Failed to modify .desktop file."
      exit 1
    }
  else
    echo "Warning: xmcl.desktop not found in usr/share/applications."
  fi
}

package() {
  cd "${srcdir}/temp"

  # Create required directories in pkgdir
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/opt"

  # Copy files to pkgdir
  cp -r opt/* "${pkgdir}/opt/" || {
    echo "Error: Failed to copy opt directory."
    exit 1
  }
  if [[ -d usr ]]; then
    cp -r usr/* "${pkgdir}/usr/" || {
      echo "Error: Failed to copy usr directory."
      exit 1
    }
  fi

  # Create symlink in /usr/bin
  ln -sf "/opt/xmcl/xmcl" "${pkgdir}/usr/bin/xmcl"

  # Set permissions for binaries
  chmod 755 "${pkgdir}/opt/xmcl/xmcl"
  if [[ -f "${pkgdir}/opt/xmcl/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/xmcl/chrome-sandbox"
  else
    echo "Warning: chrome-sandbox not found, sandboxing may not work."
  fi

  # Clean up
  cd "${srcdir}"
  rm -rf temp
}
