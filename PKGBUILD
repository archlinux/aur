# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-xanmod-edge-linux-bin-x64v2
pkgname=linux-xanmod-edge-linux-bin-x64v2
_major=5.18
pkgver=${_major}.11
_git=20220713.df1e87b
xanmod=1
pkgrel=${xanmod}
pkgdesc='The Linux kernel and modules with Xanmod patches - Latest Mainline (EDGE) - Prebuilt version'
url="http://www.xanmod.org/"
arch=(x86_64)

license=(GPL2)
options=('!strip')
depends=(coreutils kmod initramfs)
optdepends=('crda: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
provides=(VIRTUALBOX-GUEST-MODULES
          WIREGUARD-MODULE
          KSMBD-MODULE
          NTFS3-MODULE)

source=("https://github.com/xanmod/linux/releases/download/${pkgver}-xanmod${xanmod}/linux-image-${pkgver}-xanmod${xanmod}-x64v2_${pkgver}-xanmod${xanmod}-x64v2-0.git${_git}_amd64.deb")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

sha256sums=('6ed9543671a54a773d9cf9d4b0d086db75e557745aa5e48e4bb7742e74a37f50')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {

  local kernver="${pkgver}-xanmod${xanmod}-x64v2"
  local modulesdir="$pkgdir/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}"

  msg2 "Installing modules..."
  cp -r lib/modules/${kernver}/* "${modulesdir}/"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "boot/vmlinuz-${pkgver}-xanmod${xanmod}-x64v2" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${pkgname}" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

}

# vim:set ts=8 sts=2 sw=2 et:
