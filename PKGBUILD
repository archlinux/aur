# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=orbbec-openni2
pkgver=2.3.0.86
pkgrel=1
pkgdesc='Orbbec OpenNI2 SDK, drivers and samples for Orbbec depth cameras'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/orbbec/OpenNI_SDK'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'libusb' 'systemd-libs' 'freeglut' 'glu' 'libglvnd'
         'opencv' 'libuvc' 'libgomp')
makedepends=('cmake' 'patchelf' 'opencv' 'libuvc')
conflicts=('openni2' 'openni2-git')
backup=('etc/openni2/OpenNI.ini'
        'etc/openni2/Drivers/OniFile.ini'
        'etc/openni2/Drivers/orbbec.ini')

_beta=beta6
_commit=4c8f5aa4
_tag="v${pkgver}-beat6"
_base="${url}/releases/download/${_tag}"
source=('opencv5-port.patch' 'cmake-system-libs.patch' 'udev-uaccess.patch'
        'astra-pro-uvc.patch' 'libopenni2.pc' 'SimpleViewerXCB')
sha256sums=('edab930077fb83df81f096b7fb6e3ff674dc882ece8c699226b1e6274d957d60'
            '141191ad129e1df2c88eb197222d711173378cfa5339b82b66812c7153debfd6'
            'dec7d316dd7d0f3c6173aac43f397406cfb14c3aaa399dbcb557322e3fbb9e01'
            'e1672573ae75e494f62d2bd12690d9859d7c3653dd5ea65dba5677aae6238da5'
            '5ae2bfce005629158864a8e790945a375116601127f03ead9ddbd35af22cea0f'
            '823a083d1433d36c2d578c75480261c406c3106b317854dc13daab2d5b7d08a1')
source_x86_64=("${_base}/OpenNI_${pkgver}_202210111154_${_commit}_${_beta}_linux_x64.zip")
source_aarch64=("${_base}/OpenNI_${pkgver}_202210111155_${_commit}_${_beta}_arm64.zip")
source_armv7h=("${_base}/OpenNI_${pkgver}_202210111146_${_commit}_${_beta}_arm32.zip")
sha256sums_x86_64=('2240d645f3127bfcefbd2909be35bb35a446661e6a76d97dead414a4c5d684ad')
sha256sums_aarch64=('4a1b0277dca25d2a323413d02d22d87a4ce64117678abaffb187d48aec2a46d0')
sha256sums_armv7h=('800b49c570cb1e6e778bad998826e5b448a51d5ada5d4c02a22742e21ac1f65e')

_archmap() {
  case "$CARCH" in
    x86_64)  _date=202210111154; _platform=linux
             _uvc_dir=x64;      _d2c_dir=x64 ;;
    aarch64) _date=202210111155; _platform=a311d
             _uvc_dir=arm-64;   _d2c_dir=arm-64 ;;
    armv7h)  _date=202210111146; _platform=rpi
             _uvc_dir=arm-32;   _d2c_dir=arm-32 ;;
  esac
  _dir="OpenNI_${pkgver}_${_date}_${_commit}_${_beta}_${_platform}"
}

prepare() {
  _archmap

  # The arm64 asset is a zip wrapping a RAR5 archive.
  if [[ $CARCH == aarch64 ]]; then
    bsdtar -xf "$srcdir"/066797_OpenNI_*.rar -C "$srcdir"
    rm -f "$srcdir"/066797_OpenNI_*.rar
  fi

  # SimpleViewer uses OpenCV's legacy C API, which OpenCV 5 removed.
  patch -d "$srcdir/$_dir" -Np1 -i "$srcdir/opencv5-port.patch"
  patch -d "$srcdir/$_dir" -Np1 -i "$srcdir/cmake-system-libs.patch"
  # World-writable device nodes replaced by logind's uaccess ACL, as
  # recommended in https://wiki.archlinux.org/title/Udev.
  patch -d "$srcdir/$_dir" -Np1 -i "$srcdir/udev-uaccess.patch"
  # Astra Pro exposes its RGB camera as a separate UVC USB device.
  patch -d "$srcdir/$_dir" -Np1 -i "$srcdir/astra-pro-uvc.patch"
}

build() {
  _archmap
  local _samp="$srcdir/$_dir/samples/samples"
  local _build="$srcdir/samples-build"
  local _platform

  case "$CARCH" in
    x86_64)  _platform=x86_64 ;;
    aarch64) _platform=aarch64 ;;
    armv7h)  _platform=armv7l ;;
  esac

  local _cmake_opts=(
    -S "$_samp" -B "$_build"
    -Wno-author
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_CXX_STANDARD=11
    -DCMAKE_CXX_STANDARD_REQUIRED=ON
    -DCMAKE_SKIP_RPATH=YES
    -DBUILD_PLATFORM="$_platform"
  )
  cmake "${_cmake_opts[@]}"
  cmake --build "$_build" --parallel "$(nproc)"
}

package() {
  _archmap
  local _src="$srcdir/$_dir"
  local _ini _s

  install -d "$pkgdir/usr/lib/OpenNI2/Drivers"
  install -m755 "$_src/sdk/libs/libOpenNI2.so"                     "$pkgdir/usr/lib/"
  install -m755 "$_src/sdk/libs/OpenNI2/Drivers/libOniFile.so" \
                "$_src/sdk/libs/OpenNI2/Drivers/liborbbec.so"      "$pkgdir/usr/lib/OpenNI2/Drivers/"

  install -d "$pkgdir/usr/include/openni2/"{Driver,Linux-x86,Linux-Arm}
  install -m644 "$_src/sdk/Include/"*.h                            "$pkgdir/usr/include/openni2/"
  install -m644 "$_src/sdk/Include/Driver/"*.h                     "$pkgdir/usr/include/openni2/Driver/"
  install -m644 "$_src/sdk/Include/Linux-x86/"*.h                  "$pkgdir/usr/include/openni2/Linux-x86/"
  install -m644 "$_src/sdk/Include/Linux-Arm/"*.h                  "$pkgdir/usr/include/openni2/Linux-Arm/"

  # The prebuilt library and drivers look for config files next to their
  # modules, so link them to the /etc copies.
  install -d "$pkgdir/etc/openni2/Drivers"
  install -m644 "$_src/sdk/libs/OpenNI.ini"                        "$pkgdir/etc/openni2/OpenNI.ini"
  install -m644 "$_src/sdk/libs/OpenNI2/Drivers/OniFile.ini" \
                "$_src/sdk/libs/OpenNI2/Drivers/orbbec.ini"        "$pkgdir/etc/openni2/Drivers/"
  ln -s /etc/openni2/OpenNI.ini "$pkgdir/usr/lib/OpenNI.ini"
  for _ini in OniFile.ini orbbec.ini; do
    ln -s "/etc/openni2/Drivers/$_ini" "$pkgdir/usr/lib/OpenNI2/Drivers/$_ini"
  done

  # Ship NiViewer as NiViewer2: the legacy "openni" (OpenNI 1.x) package owns
  # /usr/bin/NiViewer. The armv7h release does not include it, hence the check.
  if [[ -f "$_src/tools/NiViewer/NiViewer" ]]; then
    install -Dm755 "$_src/tools/NiViewer/NiViewer"                 "$pkgdir/usr/bin/NiViewer2"
  fi
  install -Dm755 "$_src/tools/NiViewer/PS1080Console"              "$pkgdir/usr/bin/PS1080Console"
  install -Dm755 "$_src/tools/NiViewer/SimpleRead"                 "$pkgdir/usr/bin/SimpleRead"

  for _s in ColorReaderEvent ColorReaderPoll \
            DepthReaderEvent DepthReaderPoll \
            ExtendedAPI GeneratePointCloud \
            InfraredOniFileReader InfraredOniFileRecorder \
            InfraredReaderEvent InfraredReaderPoll \
            MultiDepthViewer \
            ColorReaderUVC SimpleViewer; do
    if [[ -f "$srcdir/samples-build/bin/$_s" ]]; then
      install -Dm755 "$srcdir/samples-build/bin/$_s" "$pkgdir/usr/bin/$_s"
    fi
  done

  # Orbbec proprietary closed-source libraries used by the UVC/D2C samples.
  install -d "$pkgdir/usr/lib"
  install -m755 "$_src/samples/samples/ThirdParty/UvcSwapper/$_uvc_dir/libUvc-Swapper.so" \
    "$pkgdir/usr/lib/"
  install -m755 "$_src/samples/samples/ThirdParty/d2c/lib/$_d2c_dir/libd2c.so" \
    "$pkgdir/usr/lib/"

  find "$pkgdir/usr/bin" \
       "$pkgdir/usr/lib/libUvc-Swapper.so" "$pkgdir/usr/lib/libd2c.so" \
    -type f -perm -u+x -exec patchelf --remove-rpath {} +

  # SimpleViewerXCB runs SimpleViewer on XWayland: OpenCV 5's Qt6 highgui
  # mis-sizes windows on Wayland (upstream bug). Installed after patchelf
  # because it is a shell script, not an ELF binary.
  install -Dm755 "$srcdir/SimpleViewerXCB" "$pkgdir/usr/bin/SimpleViewerXCB"

  install -Dm644 "$_src/rules/orbbec-usb.rules" \
    "$pkgdir/usr/lib/udev/rules.d/60-openni2-usb.rules"

  install -d "$pkgdir/usr/lib/pkgconfig"
  install -m644 "$srcdir/libopenni2.pc" \
    "$pkgdir/usr/lib/pkgconfig/libopenni2.pc"

  install -Dm644 "$_src/samples/samples/Readme.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/Readme.pdf"
}
