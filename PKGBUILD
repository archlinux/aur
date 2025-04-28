# Maintainer: lesto <lestofante88@gmail.com>
# Maintainer: Torben <git@letorbi.com>
# Contributor: F. Rødseth <xyproto@archlinux.org>


pkgname=processing
pkgver=4.4.1
_build=1301
pkgrel=7
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://www.processing.org/'
license=(GPL LGPL)
depends=('java-environment-openjdk=17' ffmpeg bash glibc mesa libdrm libx11 libxi libxrandr libxrender libxcursor libxxf86vm zlib)
optdepends=('processing-examples: Examples for Processing')
makedepends=(gradle rsync unzip)
options=(!strip)
source=("https://github.com/processing/processing4/archive/processing-$_build-$pkgver.tar.gz"
	'disable_update_check.patch'
	'no_jdk_download.patch')
sha256sums=('e35f9db78ad81b41a21a63ddac6b7b7d7174d957561203d2d57738117e9c21f8'
            '35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30'
            '3721e7d9e5aaab4d38ec94649614d47ed4c9b12cf2dfeba46e87696ce36e00ce')

prepare() {
  # Check if OpenJDK 17 executable is actually installed
  if ! [ -f "/usr/lib/jvm/java-17-openjdk/bin/java" ]; then
    echo "Error: OpenJDK 17 executable '/usr/lib/jvm/java-17-openjdk/bin/java' is missing."
    sh -c "exit 1"
  fi
  # Check if FFmpeg executable is actually installed
  if ! [ -f "/usr/bin/ffmpeg" ]; then
    echo "Error: FFmpeg executable '/usr/bin/ffmpeg' is missing."
    sh -c "exit 1"
  fi

  # Symbolic link for not having to repeat the revision number
  ln -sf "${pkgname}4-processing-$_build-$pkgver" "$pkgname"

  # Don't download JDK and JFX files during build process
  patch "$pkgname/app/build.gradle.kts" < no_jdk_download.patch

  # Disable update check in default preferences
  patch "$pkgname/build/shared/lib/defaults.txt" < disable_update_check.patch

  # Pass version number to build process
  echo "version=$pkgver" > "$pkgname/gradle.properties"
}

build() {
  cd "$pkgname"

  # Create *.desktop file using the existing template file
  sed -e "s,<BINARY_LOCATION>,/usr/share/processing/bin/Processing,g" \
      -e "s,<ICON_NAME>,processing-pde,g" build/linux/desktop.template > processing-pde.desktop

  # Build the application
  JAVA_HOME="/usr/lib/jvm/java-17-openjdk" gradle createDistributable
}

package() {
  cd "$pkgname"

  install -d "$pkgdir/usr/share/processing/"
  cp -r app/build/compose/binaries/main/app/Processing/* "$pkgdir/usr/share/processing/"

  # MIME type, icon and desktop shortcut
  install -d "$pkgdir/usr/share/"{applications,desktop-directories,mime/packages/,icons/hicolor/}
  (
    # Prepare the environment
    export XDG_UTILS_INSTALL_MODE=system
    export XDG_DATA_DIRS="$pkgdir/usr/share/"
    export XDG_CONFIG_DIRS="$pkgdir/etc/"
    export LIB_DIR="app/build/compose/binaries/main/app/Processing/lib/app/resources/lib"

    # Install the icon files using name and resolutions
    xdg-icon-resource install --context mimetypes --size 16 "${LIB_DIR}/icons/app-16.png" processing-pde
    xdg-icon-resource install --context mimetypes --size 32 "${LIB_DIR}/icons/app-32.png" processing-pde
    xdg-icon-resource install --context mimetypes --size 48 "${LIB_DIR}/icons/app-48.png" processing-pde
    xdg-icon-resource install --context mimetypes --size 64 "${LIB_DIR}/icons/app-64.png" processing-pde
    xdg-icon-resource install --context mimetypes --size 128 "${LIB_DIR}/icons/app-128.png" processing-pde
    xdg-icon-resource install --context mimetypes --size 256 "${LIB_DIR}/icons/app-256.png" processing-pde
    xdg-icon-resource install --context mimetypes --size 512 "${LIB_DIR}/icons/app-512.png" processing-pde
    xdg-icon-resource install --context mimetypes --size 1024 "${LIB_DIR}/icons/app-1024.png" processing-pde

    # Install the created *.desktop file
    xdg-desktop-menu install "processing-pde.desktop"

    # Install Processing mime type
    xdg-mime install "build/linux/processing-pde.xml"

    # Install icons for mime type
    xdg-icon-resource install --context mimetypes --size 16 "${LIB_DIR}/icons/pde-16.png" text-x-processing
    xdg-icon-resource install --context mimetypes --size 32 "${LIB_DIR}/icons/pde-32.png" text-x-processing
    xdg-icon-resource install --context mimetypes --size 48 "${LIB_DIR}/icons/pde-48.png" text-x-processing
    xdg-icon-resource install --context mimetypes --size 64 "${LIB_DIR}/icons/pde-64.png" text-x-processing
    xdg-icon-resource install --context mimetypes --size 128 "${LIB_DIR}/icons/pde-128.png" text-x-processing
    xdg-icon-resource install --context mimetypes --size 256 "${LIB_DIR}/icons/pde-256.png" text-x-processing
    xdg-icon-resource install --context mimetypes --size 512 "${LIB_DIR}/icons/pde-512.png" text-x-processing
    xdg-icon-resource install --context mimetypes --size 1024 "${LIB_DIR}/icons/pde-1024.png" text-x-processing

    # Make the Processing Development Environment the default app for *.pde files
    xdg-mime default processing-pde.desktop text/x-processing

    # Make the Processing Development Environment the default app for pde scheme
    xdg-mime default processing-pde.desktop x-scheme-handler/pde
  )
  # Clean up unwanted files
  rm "$pkgdir/usr/share/applications/mimeinfo.cache"
  rm -r "$pkgdir/usr/share/desktop-directories"
  find "$pkgdir/usr/share/mime/" -maxdepth 1 -type f -exec rm {} \;

  # Symbolic links in /usr/bin
  install -d "$pkgdir/usr/bin/"
  ln -s /usr/share/processing/bin/Processing "$pkgdir/usr/bin/processing"

  # Link processing's internal JDK to the system's one
  rm -rf "$pkgdir/usr/share/processing/lib/runtime" # TODO prevent that the runtime is added at all
  ln -s /usr/lib/jvm/java-17-openjdk "$pkgdir/usr/share/processing/lib/runtime"
  ln -s /usr/lib/jvm/java-17-openjdk "$pkgdir/usr/share/processing/lib/app/resources/jdk-17.0.14+7"
}
