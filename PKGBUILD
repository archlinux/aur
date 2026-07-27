# Maintainer: Jake Steinman <j@metarealtyinc.ca>

pkgname=intel-ipu7-ir-dkms
pkgver=1.0
pkgrel=1
pkgdesc="Infrared camera and face-unlock support for Intel IPU7 laptops (Himax HM1092 behind a Synaptics SVP7500 bridge)"
arch=('any')
url="https://github.com/jibsta210/svp7500-camera-fix-pack"
license=('GPL-2.0-only')
depends=('dkms')
optdepends=(
  'intel-ipu7-dkms-git: the IPU7 ISYS/PSYS vendor drivers — required for the camera to work at all'
  'howdy: infrared face authentication (this package ships the IR recorder for it)'
  'python-numpy: required by the Howdy IR recorder'
  'python-opencv: required by the Howdy IR recorder'
  'libcamera: to enumerate and test the cameras'
  'v4l-utils: for media-ctl and v4l2-ctl, used by the verification tooling'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('687d0d4a1d771d3c7df91bdc9172c7cd73e3e7fc20d7fe3e794e47bee5fc709b')

_src="svp7500-camera-fix-pack-$pkgver"

# Every DKMS tree this package ships. int3472-patched is deliberately NOT in
# this list: mainline gained STROBE -> ir_flood LED registration, so on any
# kernel that has it our copy is not merely redundant, it is a downgrade --
# ours does not create /sys/class/leds/<sensor>::ir_flood_led at all, and DKMS
# would install it where it outranks the kernel's. That would break the very
# illuminator the face-unlock path depends on. It is shipped as source only,
# for anyone on a kernel old enough to need it.
_modules=(hm1092 intel-cvs ipu-bridge-patched ov05c10)

package() {
  cd "$srcdir/$_src"

  # --- DKMS sources -------------------------------------------------------
  for m in "${_modules[@]}"; do
    install -dm755 "$pkgdir/usr/src/$m-$pkgver"
    cp -r "dkms/$m-1.0/." "$pkgdir/usr/src/$m-$pkgver/"
    # dkms matches the directory name against PACKAGE_VERSION. A mismatch lets
    # `dkms add` succeed while every later command addresses a different tree.
    sed -i "s/^PACKAGE_VERSION=\".*\"$/PACKAGE_VERSION=\"$pkgver\"/" \
      "$pkgdir/usr/src/$m-$pkgver/dkms.conf"
  done

  # Shipped but not registered — see the comment on _modules above.
  install -dm755 "$pkgdir/usr/share/$pkgname/optional/int3472-patched"
  cp -r "dkms/int3472-patched-1.0/." \
    "$pkgdir/usr/share/$pkgname/optional/int3472-patched/"

  # --- udev ---------------------------------------------------------------
  # The illuminator must be group-writable. Face recognition runs as the
  # unprivileged user from a lock screen, the LED brightness is root-only by
  # default, so the flood never fires and every frame is too dark to match --
  # authentication times out while working perfectly under sudo.
  install -Dm644 udev/99-hm1092-ir-led.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-hm1092-ir-led.rules"
  install -Dm644 udev/99-svp7500-no-autosuspend.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-svp7500-no-autosuspend.rules"

  # --- Howdy IR recorder --------------------------------------------------
  # Not installed into Howdy's tree: that belongs to another package. Shipped
  # here with a helper that wires it up on request.
  install -Dm644 howdy/ir_reader.py \
    "$pkgdir/usr/share/$pkgname/howdy/ir_reader.py"
  install -Dm644 howdy/video_capture.patch \
    "$pkgdir/usr/share/$pkgname/howdy/video_capture.patch"

  # --- tooling ------------------------------------------------------------
  for t in verify.sh find-ir-node.sh int3472-needed.sh install-ipu7-r74.sh; do
    [[ -f tools/$t ]] && install -Dm755 "tools/$t" \
      "$pkgdir/usr/share/$pkgname/tools/$t"
  done

  # --- psys patches -------------------------------------------------------
  # These patch Intel's own DKMS tree rather than shipping their own source, so
  # they cannot be a package: applying them means writing into a directory
  # another package owns. install-ipu7-r74.sh applies them on request.
  install -dm755 "$pkgdir/usr/share/$pkgname/ipu7-psys-patches"
  cp -r dkms/ipu7-psys-patches/. \
    "$pkgdir/usr/share/$pkgname/ipu7-psys-patches/"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  for d in docs/*.md; do
    [[ -f $d ]] && install -Dm644 "$d" "$pkgdir/usr/share/doc/$pkgname/$(basename "$d")"
  done
}
