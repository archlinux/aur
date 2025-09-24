# Maintainer: Torben <git at letorbi dot com>

pkgname=processing-git
pkgver=4.4.7.r37.g72db9b7db
pkgrel=1
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://github.com/processing/processing4'
license=(GPL LGPL)
conflicts=(processing)
depends=('java-environment-openjdk=17' ffmpeg bash glibc mesa libdrm libx11 libxi libxrandr libxrender libxcursor libxxf86vm zlib)
optdepends=('processing-examples: Examples for Processing')
makedepends=(gradle8)
options=(!strip)
source=(disable_update_check.patch
        no_jdk_download.patch)
sha256sums=('35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30'
            '5ec5c1814c97c2a4d81c3af9129ba2855e9f90b92aa99d9b1cb5b0d0e995021e')
install='processing.install'

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --long --tags | sed 's/^processing-[^-]\+-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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

  # The size of a full clone is more than 1GB, so we just make a shallow clone
  # Fetching 1000 commits is hopefully enough to find the latest version tag
  rm -rf $pkgname
  git clone --depth 1000 https://github.com/processing/processing4.git $pkgname

  # Don't download packages that can be provided via dependencies
  patch "$pkgname/app/build.gradle.kts" < no_jdk_download.patch

  # Disable update check in default preferences
  patch $pkgname/build/shared/lib/defaults.txt < disable_update_check.patch
}

build() {
  cd "$pkgname"

  # Create *.desktop file using the existing template file
  sed -e "s,<BINARY_LOCATION>,/usr/share/processing/bin/Processing,g" \
      -e "s,<ICON_NAME>,processing-pde,g" build/linux/desktop.template > processing-pde.desktop

  # Build the application
  JAVA_HOME="/usr/lib/jvm/java-17-openjdk" gradle8 createDistributable
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
  ln -s /usr/lib/jvm/java-17-openjdk "$pkgdir/usr/share/processing/lib/app/resources/jdk"
}
