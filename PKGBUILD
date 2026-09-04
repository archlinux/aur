#  Maintainer: John Machado <joao at delinuxco dot com>

###############################################################################
# CONFIGURATION SECTION
# Replace these values with your specific application details.
###############################################################################
pkgname=cin-appimage
_pkgname=Cinelerra-GG
pkgver=20260831
pkgrel=1
pkgdesc="Cinelerra GG Infinity is a free and open source video editing software for Linux.."
arch=('x86_64')
url="https://www.cinelerra-gg.org/"
license=('GPL-2.0-only')
provides=('cinelerra-gg')
conflicts=('cin')

# The filename as it appears in the download URL (e.g., app-1.0.0-x86_64.AppImage)
_appimage_filename="CinGG-${pkgver}-x86_64.AppImage"

# The source URL to download AppImage
_source_url="https://download.cinelerra-gg.org/download.php?file=images/CinGG-${pkgver}-${arch}.AppImage"

# Where the file will live in your system (Standard is /opt/appimages/)
_install_dir="/opt/appimages"
_install_path="${_install_dir}/${_pkgname}.AppImage"

# Inside the AppImage, what is the name of the .desktop file?
# Usually it matches the app name, e.g., 'org.kde.kcalc.desktop'
_desktop_file="Cinelerra-GG.desktop"

# Inside the AppImage, what is the name of the icon file?
_icon_file="cin.svg"
###############################################################################

depends=(
    'fuse2'
    'fuse3'
    'libxcrypt-compat' # Often needed for older AppImages on Arch but can removed for newer AppImages
)

makedepends=(
    'desktop-file-utils'
)

# Add any optional dependencies
optdepends=()

options=(!strip)

# All source files in root directory of PKGBUILD must be listed and with corresponding sha256/md5 sums
source=(
        "${_source_url}"
        "${_desktop_file}"
)
sha256sums=('f126e9241b75b00aed81a4d43f157903385afa1528811794a7086a98c863e966'
            '74d4ee8095035a3bff7c787804e85e91a4d673f638cc642fb69e196aecfd5d61'
)

prepare() {

  # 1. Make the AppImage executable and extract it
  chmod +x "${_appimage_filename}"
  ./"${_appimage_filename}" --appimage-extract

  # 2. Setup directory structure inside squashfs-root for the build process
  mkdir -p "${srcdir}/squashfs-root/assets/icons/"
  mkdir -p "${srcdir}/squashfs-root/assets/launchers/"

  # 3. Move the icon and desktop file to a known location for easy installation
  # Note: We check if they exist to prevent build failure if names differ
  if [ -f "squashfs-root/${_icon_file}" ]; then
    cp "squashfs-root/${_icon_file}" "squashfs-root/assets/icons/${_icon_file}"
  fi

  if [ -f "${_desktop_file}" ]; then
    cp "${_desktop_file}" "squashfs-root/assets/launchers/${_desktop_file}"

  # 4. CRITICAL: Rewrite the .desktop file to point to new path
  #    This rewrites the 'Exec' line so it will execute the AppImage from /opt/appimages/
  #    If the .desktop and svg files will be provided in the PKGBUILD directory, comment out the next two lines that start with "desktop-file-edit".
   ## desktop-file-edit --set-key=Exec --set-value="${_install_path} %U" "squashfs-root/assets/launchers/${_desktop_file}"
   ## desktop-file-edit --set-key=TryExec --set-value="${_install_path}" "squashfs-root/assets/launchers/${_desktop_file}"
  fi
}

package() {
  # 1. Install the actual AppImage to /opt/appimages/
  install -d "${pkgdir}${_install_dir}"
  install -Dm755 "${srcdir}/${_appimage_filename}" "${pkgdir}${_install_path}"

  # 2. Install the Desktop Entry and Icon to standard system paths
  if [ -f "${srcdir}/squashfs-root/assets/launchers/${_desktop_file}" ]; then
    install -Dm644 "squashfs-root/assets/launchers/${_desktop_file}" "${pkgdir}/usr/share/applications/${_desktop_file}"
  fi

  if [ -f "${srcdir}/squashfs-root/assets/icons/${_icon_file}" ]; then
    install -Dm644 "squashfs-root/assets/icons/${_icon_file}" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_icon_file}"
  fi

  # 3. Create the symlink in /usr/bin so you can launch it from terminal via 'appname'
  install -d "${pkgdir}/usr/bin"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/cin"
}
