# Maintainer: VHSgunzo <vhsgunzo.github.io>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname='linux-xanmod-bin'
pkgver='5.18.17'
xanmod='1'
pkgrel="$xanmod"
pkgbase="$pkgname"
pkgdesc='The Linux kernel and modules with Xanmod patches - Prebuilt version'
url="http://www.xanmod.org/"
arch=('x86_64')
license=('GPL2')
options=('!strip')
depends=('coreutils' 'kmod' 'initramfs')
conflicts=("${pkgname%-bin}")
optdepends=('crda: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
makedepends=('curl')
provides=('VIRTUALBOX-GUEST-MODULES'
          'WIREGUARD-MODULE'
          'KSMBD-MODULE'
          'NTFS3-MODULE')
_url="https://github.com/xanmod/linux/releases"
source=("${_url}$(curl -L -s "${_url}/tag/${pkgver}-xanmod${xanmod}"|grep -o '\/download.*linux-image.*deb')")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha256sums=('9cb71c8b424adbeec28ba3251c28cbcb216932831991d4a6b5906c5a89263db4')

prepare() {
  bsdtar -xf 'data.tar.xz'
}

package() {
  local kernver="${pkgver}-xanmod${xanmod}"
  local modulesdir="$pkgdir/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}"
  msg2 "Installing modules..."
  cp -r lib/modules/${kernver}/* "${modulesdir}/"
  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "boot/vmlinuz-${kernver}" "$modulesdir/vmlinuz"
  # Used by mkinitcpio to name the kernel
  echo "${pkgname%-bin}" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
}
