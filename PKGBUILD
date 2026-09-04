#  Maintainer: John Machado <john at delinuxco dot com>

###############################################################################
# CONFIGURATION SECTION
# Replace these values with your specific application details.
###############################################################################
pkgname=tmog-appimage
_pkgname=tmog-task-manager
pkgver=0.1.1
pkgrel=1
pkgdesc="TMOG brings the depth of a serious systems console to a native, focused task manager for macOS, Windows, and Linux.."
arch=('x86_64')
url="https://www.tmog.org/"
license=('LicenseRef-Proprietary') # Replace with actual license
provides=('tmog-task-manager')
conflicts=('tmog-bin')

# The filename as it appears in the download URL (e.g., app-1.0.0-x86_64.AppImage)
_appimage_filename="TMOG-Task-Manager-Linux-${arch}.AppImage"

# The source URL to download AppImage
_source_url="https://www.tmog.org/downloads/TMOG-Task-Manager-Linux-x86_64.AppImage?v=${pkgver}-free"

# Where the file will live in your system (Standard is /opt/appimages/)
_install_dir="/opt/appimages"
_install_path="${_install_dir}/${_pkgname}.AppImage"

# Inside the AppImage, what is the name of the .desktop file?
# Usually it matches the app name, e.g., 'org.kde.kcalc.desktop'
_desktop_file="com.tmog.taskmanager.desktop"

# Inside the AppImage, what is the name of the icon file?
_icon_file="tmog-task-manager.svg"
###############################################################################

depends=(
    'fuse2'
    'fuse3'
)

makedepends=(
    'desktop-file-utils'
)

# Add any optional dependencies
optdepends=()

options=(!strip)

# All source files in root directory of PKGBUILD must be listed and with corresponding sha256/md5 sums
source=("${_source_url}"
        "${_icon_file}")
sha256sums=('0baf064697d67732800d6315644697ec153b8e506a5173304c85f330b2dbe6d2'
            '2ddcddba5bf94f076676b42ec6e576cb93c9aa6676e1b1e487b2d4531fc52941'
)

prepare() {

  mv TMOG-Task-Manager-Linux-x86_64.AppImage?v=0.1.1-free TMOG-Task-Manager-Linux-x86_64.AppImage
    
  # 1. Make the AppImage executable and extract it
  chmod +x "${_appimage_filename}"
  ./"${_appimage_filename}" --appimage-extract

  # 2. Setup directory structure inside squashfs-root for the build process
  mkdir -p "${srcdir}/squashfs-root/assets/icons/"
  mkdir -p "${srcdir}/squashfs-root/assets/launchers/"

  # 3. Move the icon and desktop file to a known location for easy installation
  # Note: We check if they exist to prevent build failure if names differ
  if [ -f "${_icon_file}" ]; then
    cp "${_icon_file}" "squashfs-root/assets/icons/${_icon_file}"
  fi

  if [ -f "squashfs-root/${_desktop_file}" ]; then
    cp "squashfs-root/${_desktop_file}" "squashfs-root/assets/launchers/${_desktop_file}"

  # 4. CRITICAL: Rewrite the .desktop file to point to new path
  #    This rewrites the 'Exec' line so it will execute the AppImage from /opt/appimages/
  #    If the .desktop and svg files will be provided in the PKGBUILD directory, comment out the next two lines that start with "desktop-file-edit".
    desktop-file-edit --set-key=Exec --set-value="${_install_path} %U" "squashfs-root/assets/launchers/${_desktop_file}"
    desktop-file-edit --set-key=TryExec --set-value="${_install_path}" "squashfs-root/assets/launchers/${_desktop_file}"
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
  ln -s "${_install_path}" "${pkgdir}/usr/bin/${_pkgname}"
}
