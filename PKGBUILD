# Maintainer: Jake Steinman <j@metarealtyinc.ca>

pkgname=intel-ipu7-ir-dkms
pkgver=1.0.2
pkgrel=1
pkgdesc="Infrared camera and face-unlock support for Intel IPU7 laptops (Himax HM1092 behind a Synaptics SVP7500 bridge)"
arch=('any')
url="https://github.com/jibsta210/svp7500-camera-fix-pack"
license=('GPL-2.0-only')
depends=('dkms')
optdepends=(
  'intel-ipu7-dkms-git: the IPU7 ISYS/PSYS vendor drivers — the camera cannot work without them'
  'howdy: infrared face authentication (this package ships the IR recorder it needs)'
  'libcamera: to enumerate and test the cameras'
  'v4l-utils: media-ctl and v4l2-ctl, used by the verification tooling'
  'zstd: lets verify.sh read compressed modules to check what was actually built'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c29ff7d744d36ebc683a82833118a35789c8119b09d591ed82d7e7a07de84074')

_src="svp7500-camera-fix-pack-$pkgver"

# int3472-patched is deliberately absent from this list. Mainline gained
# STROBE -> ir_flood LED registration, so on any kernel that has it our copy is
# not merely redundant, it is a downgrade: ours does not create
# /sys/class/leds/<sensor>::ir_flood_led at all, and DKMS would install it where
# it outranks the kernel's. That breaks the illuminator the face-unlock path
# depends on. Shipped as source only, for kernels old enough to need it.
_modules=(hm1092 intel-cvs ipu-bridge-patched ov05c10)

package() {
  cd "$srcdir/$_src"

  for m in "${_modules[@]}"; do
    install -dm755 "$pkgdir/usr/src/$m-$pkgver"
    cp -r "dkms/$m-1.0/." "$pkgdir/usr/src/$m-$pkgver/"
    # dkms matches the directory name against PACKAGE_VERSION. A mismatch lets
    # `dkms add` succeed while every later command addresses a different tree.
    sed -i "s/^PACKAGE_VERSION=\".*\"$/PACKAGE_VERSION=\"$pkgver\"/" \
      "$pkgdir/usr/src/$m-$pkgver/dkms.conf"
  done

  install -dm755 "$pkgdir/usr/share/$pkgname/optional/int3472-patched"
  cp -r "dkms/int3472-patched-1.0/." \
    "$pkgdir/usr/share/$pkgname/optional/int3472-patched/"

  # The illuminator must be group-writable: face recognition runs as the
  # unprivileged user from a lock screen, the LED is root-only by default, so
  # the flood never fires and every frame is too dark to match. Authentication
  # then times out while working perfectly under sudo.
  install -Dm644 udev/99-hm1092-ir-led.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-hm1092-ir-led.rules"
  install -Dm644 udev/99-svp7500-no-autosuspend.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-svp7500-no-autosuspend.rules"

  # Not installed into Howdy's tree — that belongs to another package.
  install -Dm644 howdy/ir_reader.py \
    "$pkgdir/usr/share/$pkgname/howdy/ir_reader.py"
  install -Dm644 howdy/video_capture.patch \
    "$pkgdir/usr/share/$pkgname/howdy/video_capture.patch"

  for t in verify.sh find-ir-node.sh int3472-needed.sh install-ipu7-r74.sh lib-detect.sh; do
    [[ -f tools/$t ]] && install -Dm755 "tools/$t" "$pkgdir/usr/share/$pkgname/tools/$t"
  done

  # These patch Intel's own DKMS tree rather than shipping their own source, so
  # they cannot be a package: applying them means writing into a directory
  # another package owns. install-ipu7-r74.sh applies them on request.
  install -dm755 "$pkgdir/usr/share/$pkgname/ipu7-psys-patches"
  cp -r dkms/ipu7-psys-patches/. "$pkgdir/usr/share/$pkgname/ipu7-psys-patches/"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  for d in docs/*.md; do
    [[ -f $d ]] && install -Dm644 "$d" "$pkgdir/usr/share/doc/$pkgname/$(basename "$d")"
  done
}
