#  Maintainer: John Machado <john at delinuxco dot com>

###############################################################################
# CONFIGURATION SECTION
# Replace these values with your specific application details.
###############################################################################
pkgname=tmog-appimage
_pkgname=TaskManagerOG
pkgver=0.1.3
pkgrel=1
pkgdesc="TMOG brings the depth of a serious systems console to a native, focused task manager for macOS, Windows, and Linux.."
arch=('x86_64')
url="https://www.tmog.org/"
license=('LicenseRef-Proprietary') # Replace with actual license
provides=('tmog-task-manager')
conflicts=('tmog-bin')

# The filename as it appears in the download URL (e.g., app-1.0.0-x86_64.AppImage)
_appimage_filename="TaskManagerOG-${pkgver}-${arch}.AppImage"

# The source URL to download AppImage
_source_url="https://www.tmog.org/downloads/TaskManagerOG-${pkgver}-${arch}.AppImage"

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
sha256sums=('a8aa11f5e30a273250bcfb9247cc3117e830d6cffaf502961e93f12b3dd85827'
            '2ddcddba5bf94f076676b42ec6e576cb93c9aa6676e1b1e487b2d4531fc52941'
)

prepare() {

    cd "${srcdir}"

    
  # 1. Make the AppImage executable and extract it
  chmod +x "${_appimage_filename}"
  ./"${_appimage_filename}" --appimage-extract

  # 3. Setup directory structure
  mkdir -p "${srcdir}/squashfs-root/assets/icons/"
  mkdir -p "${srcdir}/squashfs-root/assets/launchers/"

  # 4. Move the icon (Note the added 'fi' and use of ${srcdir})
  if [ -f "${srcdir}/${_icon_file}" ]; then
    cp "${srcdir}/${_icon_file}" "${srcdir}/squashfs-root/assets/icons/${_icon_file}"
  fi

  # 5. Rewrite the .desktop file
  if [ -f "${srcdir}/squashfs-root/${_desktop_file}" ]; then
    cp "${srcdir}/squashfs-root/${_desktop_file}" "${srcdir}/squashfs-root/assets/launchers/${_desktop_file}"
    
    desktop-file-edit --set-key=Exec --set-value="${_install_path} %U" \
      "${srcdir}/squashfs-root/assets/launchers/${_desktop_file}"
    desktop-file-edit --set-key=TryExec --set-value="${_install_path}" \
      "${srcdir}/squashfs-root/assets/launchers/${_desktop_file}"
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
