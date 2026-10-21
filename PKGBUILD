# Maintainer: Karthik Jayakumar <valliyilkarthik@gmail.com>

_pkgname=qcom-test-automation-controller
pkgname=$_pkgname-git
pkgver=6.9.0.r0.g954c804
pkgrel=3
pkgdesc="Qualcomm Test Automation Controller (QTAC) - control Qualcomm devices through a debug board"
arch=('x86_64')
url="https://github.com/qualcomm/qcom-test-automation-controller"
license=('BSD-3-Clause-Clear' 'LicenseRef-FTDI' 'LGPL-2.1-or-later')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'hidapi'
  'libgcc'
  'libstdc++'
  'qt6-base'
  'qt6-multimedia'
  'qt6-serialport'
)
makedepends=('cmake' 'git' 'ninja')
optdepends=('python: TACDev Python interface and example scripts'
            'python-setuptools: install the TACDev Python package via setup.py'
            'python-yaml: MCP example scripts (they also need fastmcp)')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"

# Upstream's CMake downloads this archive at configure time and links its static
# library into every binary; fetch it here so the build works offline.
_ftdi=libftd2xx-linux-x86_64-1.4.33.tgz
source=("git+$url.git"
        "https://web.archive.org/web/20250822044524/https://ftdichip.com/wp-content/uploads/2025/03/$_ftdi"
        LICENSE.FTDI
        devlist-static-init.patch
        tac-library-paths.patch)
noextract=("$_ftdi")
sha256sums=('SKIP'
            'e260a4594a313583b87bf230c79cec9d46f11db6dcfd7c7d4f963279703214d3'
            '4b080f7fa03bc5a2448b0d7dfcf9e7f2837ca89b008d0c474bd5044441b4a5fa'
            'bf2099ddc56b5505dca549163a8a5f447b6545118491f50d21fda82beadfc384'
            '4fc09f5c5a4f6cfb10ba0da816451b67190315c400cb5245c939407b9730559b')

# Paths are hardcoded in the sources (TACDev.py, ApplicationEnhancements.cpp, ...)
_prefix=/opt/qcom/QTAC
_datadir=/var/lib/qcom/data/QTAC

pkgver() {
  cd "$_pkgname"
  # Only release tags (6.9.0, ...); upstream also has tags like develop-1.1.0
  git describe --long --tags --abbrev=7 --match '[0-9]*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  if ! grep -qF "$_ftdi" third-party/CMakeLists.txt; then
    error "third-party/CMakeLists.txt no longer uses $_ftdi; update _ftdi in the PKGBUILD"
    return 1
  fi
  ln -sf "$srcdir/$_ftdi" third-party/

  # DevList misses the installed devicelist.json (static init order bug);
  # skipped automatically once upstream moves the global into main()
  if grep -q '^const QString kUSBDescriptorPath' src/applications/devlist/main.cpp; then
    patch -Np1 -i "$srcdir/devlist-static-init.patch"
  fi

  # TAC replaces Qt's plugin search paths with a nonexistent directory, so KIO
  # (file dialogs: "Unknown protocol 'file'") and QtMultimedia find no plugins
  if grep -q 'QCoreApplication::setLibraryPaths' src/applications/test-automation-controller/main.cpp; then
    patch -Np1 -i "$srcdir/tac-library-paths.patch"
  fi

  # Arch has no 'dialout' group; serial devices belong to 'uucp'
  sed -i 's/GROUP="dialout"/GROUP="uucp"/' udev-rules/*.rules
}

build() {
  # TRY_FIND_PACKAGE_MODE makes FetchContent use the system hidapi instead of
  # cloning it, and TARGETS_GLOBAL exposes hidapi::hidapi outside third-party/.
  # FULLY_DISCONNECTED turns any remaining download into an error.
  # No executable links a private shared library, so no RPATH is needed.
  cmake -S "$_pkgname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DFETCHCONTENT_TRY_FIND_PACKAGE_MODE=ALWAYS \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DCMAKE_FIND_PACKAGE_TARGETS_GLOBAL=ON \
    -Wno-dev
  cmake --build build

  # Regenerate the device list from the shipped configurations, as upstream CI
  # and the .deb postinst do. HOME is redirected so nothing lands in ~/Documents.
  local _out="$srcdir/$_pkgname/__Builds/Linux/Release"
  rm -rf devicelist && mkdir devicelist
  cp "$_pkgname"/configurations/*.tcnf devicelist/
  HOME="$srcdir/home" QT_QPA_PLATFORM=offscreen \
    "$_out/bin/UpdateDeviceList" dir="$srcdir/devicelist"
  # It records absolute .tcnf paths; point them at the installed location
  sed -i "s|\"$srcdir/devicelist/|\"$_datadir/configurations/|" devicelist/devicelist.json
}

package() {
  cd "$_pkgname"
  local _out=__Builds/Linux/Release _bin

  # Layout mirrors upstream's packaging/linux/package_QTAC.sh
  install -d "$pkgdir/usr/bin" "$pkgdir$_prefix"/{bin,lib,docs/QTAC,examples,python}

  # Install whatever executables upstream builds, so new tools need no PKGBUILD change
  for _bin in "$_out"/bin/*; do
    [[ -f $_bin && -x $_bin ]] || continue
    install -m755 "$_bin" "$pkgdir$_prefix/bin/"
    ln -s "$_prefix/bin/${_bin##*/}" "$pkgdir/usr/bin/${_bin##*/}"
  done
  cp -P "$_out"/lib/libTACDev.so* "$pkgdir$_prefix/lib/"

  cp -r --no-preserve=ownership docs/. "$pkgdir$_prefix/docs/QTAC/"
  rm -rf "$pkgdir$_prefix/docs/QTAC/tools"  # Sphinx build scripts
  cp -r --no-preserve=ownership examples/. "$pkgdir$_prefix/examples/"
  cp -r --no-preserve=ownership interfaces/Python/. "$pkgdir$_prefix/python/"

  install -Dm644 configurations/* -t "$pkgdir$_datadir/configurations/"
  install -Dm644 "$srcdir/devicelist/devicelist.json" -t "$pkgdir$_datadir/configurations/"
  install -Dm644 interfaces/C++/TACDev/*.h -t "$pkgdir$_datadir/interfaces/C++/TACDev/"
  install -d "$pkgdir$_datadir/interfaces"/{Python,Java}
  cp -r --no-preserve=ownership interfaces/Python/. "$pkgdir$_datadir/interfaces/Python/"
  cp -r --no-preserve=ownership interfaces/Java/. "$pkgdir$_datadir/interfaces/Java/"

  # pacman's 35-systemd-udev-reload hook reloads udev after the transaction
  install -Dm644 udev-rules/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"

  local _app=src/applications
  install -Dm644 "$_app"/test-automation-controller/resources/TAC.desktop \
                 "$_app"/tac-configuration-editor/resources/TACConfigEditor.desktop \
                 "$_app"/device-catalog/resources/DeviceCatalog.desktop \
                 -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$_app"/test-automation-controller/resources/TAC.png \
                 "$pkgdir/usr/share/icons/hicolor/256x256/apps/tac.png"
  install -Dm644 "$_app"/tac-configuration-editor/resources/TACConfigEditor.png \
                 "$pkgdir/usr/share/icons/hicolor/256x256/apps/tac-config-editor.png"
  install -Dm644 "$_app"/device-catalog/resources/device-catalog.png \
                 "$pkgdir/usr/share/icons/hicolor/256x256/apps/device-catalog.png"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/LICENSE.FTDI" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
