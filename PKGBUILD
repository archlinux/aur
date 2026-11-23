# Maintainer: hustles <hustles@users.noreply.github.com>
#
# Native libfprint-2-tod1 driver for the Synaptics "Metallica MIS Touch"
# 06cb:009a fingerprint reader (ThinkPad T480 / T480s / X280 / P52s), plus the
# one-time tooling this sensor actually needs in order to work:
#
#   * synaptics009a-upload-fwext  flashes the QMatcher firmware extension into
#     the sensor's flash partition 2.  WITHOUT this the driver fault-resets the
#     chip on every large capture command and enrolment can never succeed, even
#     though init and the TLS session work perfectly.
#   * synaptics009a-calibrate     generates the per-sensor host calibration.
#   * synaptics009a-setup         runs both of the above once, then restarts fprintd.
#   * synaptics009a-pam           optionally wires pam_fprintd for sudo/login.
#
# Upstream leaves the firmware step to python-validity; this package ships it
# natively, so no second driver stack is required.
#
# Packaging repo (patch, Cargo.lock, helper scripts, this PKGBUILD):
#   https://github.com/hustles/libfprint-2-tod1-synaptics009a

pkgname=libfprint-2-tod1-synaptics009a
pkgver=0.1.0
pkgrel=5
pkgdesc="Native libfprint-2-tod1 driver for the Synaptics 06cb:009a fingerprint reader (ThinkPad T480/T480s/X280/P52s); no python-validity needed"
arch=('x86_64')
url="https://github.com/hustles/libfprint-2-tod1-synaptics009a"
license=('MIT' 'LGPL-2.1-or-later')
# Keywords are NOT a PKGBUILD field the AUR reads: makepkg never writes them to
# .SRCINFO. They live server-side on the package base — set them with
#   ssh aur@aur.archlinux.org set-keywords libfprint-2-tod1-synaptics009a ...
# (currently: fingerprint synaptics thinkpad t480s x280 p52s libfprint-tod fprintd 06cb)
depends=('bash' 'fprintd' 'libfprint-tod-git' 'libusb' 'glib2')
# The python-validity stack replaces fprintd and claims the same sensor: two
# drivers cannot share one reader. pacman now refuses to install over it instead
# of relying on the user reading the README.
conflicts=('python-validity' 'open-fprintd' 'fprintd-clients-git')
makedepends=('rust' 'pkgconf' 'innoextract')
install="$pkgname.install"

# Pinned to upstream branch `arch-adoption`, the branch that carries the Arch
# build fixes and the calibrator.  `main` still hardcodes Debian multiarch paths.
_commit=216361ebeccb3d427844a4f15be8d6f96eaaf1c3

source=("$pkgname-$pkgver.tar.gz::https://github.com/blackandcold/t480s-fingerprint-driver-for-linux/archive/$_commit.tar.gz"
        "nz3gf07w.exe::https://download.lenovo.com/pccbbs/mobiles/nz3gf07w.exe"
        "0001-arch-fixes-clean-slate-init-and-fwext-uploader.patch"
        "Cargo.lock"
        "60-synaptics-009a.rules"
        "synaptics009a-no-timeout.conf"
        "synaptics009a-setup"
        "synaptics009a-pam"
        "README.md")

# Vendor driver archive, sha512 pinned upstream in python-validity's
# validitysensor/firmware_tables.py:
#   a4a4e6058b1ea8ab721953d2cfd775a1e7bc589863d160e5ebbb90344858f147d695103677a8df0b2de0c95345df108bda97196245b067f45630038fb7c807cd
sha256sums=('5483619bd53ff2ddd0a9704cba1e025f2b0d273c80bb7e4c69bb11994a9c6823'
            'c0f8fa6fe1279d4519cc8a381862455948231c45388234b5cf22aa26da6270ef'
            'a47bcd5cea12a04493b7feaefaf2ca71fdc88a665c4284b63b6a08f8f93681c4'
            '0e478f7736ea885edece581c77e269fd062536852d212dd0fe56b5c4b8f907df'
            '67a88690c8d14c85ec7c4acb82e1fc7718eea1183bfa13a386d78ebbfe5b1fb5'
            '15bc58562244378cfa2df0c6ff2e7c67b1cb0edb6ca55ab78ee1818cd8eca410'
            '474769c18736a272afc5ec37373dbd70b63a2e425ad9d5f5e38bc1be63e9db80'
            '26b73bcaacfc9ab9b0efca8abd650cdd0226b715f52cae2b0f8c1f16c965bc5e'
            '9dc7081a6d826586670ce75ad797e7b472291717f0c810b3756d10310d384334')
prepare() {
  cd "t480s-fingerprint-driver-for-linux-$_commit"

  # Our fixes: the pre-TLS clean-slate init blob, the fwext uploader, the
  # corrected 2-samples-per-pixel calibration averaging, and no stray 0x04 stop.
  patch -Np1 -i "$srcdir/0001-arch-fixes-clean-slate-init-and-fwext-uploader.patch"

  # Upstream ships no lockfile; use a pinned one for reproducible builds.
  cp "$srcdir/Cargo.lock" Cargo.lock

  # Pull 6_07f_lenovo_mis_qm.xpfwext out of Lenovo's Windows driver package.
  # 7z cannot map this Inno Setup payload's file names; innoextract can.
  innoextract --output-dir "$srcdir/fw" --include 6_07f_lenovo_mis_qm.xpfwext \
              --collisions overwrite "$srcdir/nz3gf07w.exe"
  install -Dm644 \
    "$(find "$srcdir/fw" -name 6_07f_lenovo_mis_qm.xpfwext -print -quit)" \
    "$srcdir/6_07f_lenovo_mis_qm.xpfwext"
}

build() {
  cd "t480s-fingerprint-driver-for-linux-$_commit"
  cargo build --release --locked
}

check() {
  cd "t480s-fingerprint-driver-for-linux-$_commit"
  cargo test --release --locked
}

package() {
  cd "t480s-fingerprint-driver-for-linux-$_commit"

  # The libfprint TOD-1 plugin.
  install -Dm644 target/release/libt480s_fingerprint_v2.so \
    "$pkgdir/usr/lib/libfprint-2/tod-1/libfprint-2-tod1-synaptics009a.so"

  # One-time setup tooling.
  install -Dm755 target/release/synaptics009a-calibrate "$pkgdir/usr/bin/synaptics009a-calibrate"
  install -Dm755 target/release/synaptics009a-upload-fwext "$pkgdir/usr/bin/synaptics009a-upload-fwext"
  install -Dm755 "$srcdir/synaptics009a-setup" "$pkgdir/usr/bin/synaptics009a-setup"
  install -Dm755 "$srcdir/synaptics009a-pam" "$pkgdir/usr/bin/synaptics009a-pam"

  # Vendor firmware extension, flashed by synaptics009a-setup.
  install -Dm644 "$srcdir/6_07f_lenovo_mis_qm.xpfwext" \
    "$pkgdir/usr/share/$pkgname/6_07f_lenovo_mis_qm.xpfwext"

  # Keep the reader powered (autosuspend is the #1 cause of lost captures).
  install -Dm644 "$srcdir/60-synaptics-009a.rules" \
    "$pkgdir/usr/lib/udev/rules.d/60-synaptics-009a.rules"

  # Keep the TLS session warm so the sensor is not reset while idle.
  install -Dm644 "$srcdir/synaptics009a-no-timeout.conf" \
    "$pkgdir/usr/lib/systemd/system/fprintd.service.d/synaptics009a-no-timeout.conf"

  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.python-validity \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.python-validity"
}
