# Maintainer: VHSgunzo <vhsgunzo.github.io>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname='linux-xanmod-bin'
pkgver='6.2.12'
pkgrel="1"
psabi='x64v1'
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
_url="https://api.github.com/repos/xanmod/linux/releases"
source=("$(curl -L -s "$_url"|grep -o "https:.*/download/${pkgver}-xanmod1/linux-image.*deb"|grep "$psabi")")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha256sums=('8553be3b1bf4ea8c2b4cbba233c7934e0fcc54b1371058d1be4cf9f533e91666')

prepare() {
  bsdtar -xf 'data.tar.xz'
}

package() {
  local kernver="${pkgver}-$psabi-xanmod1"
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
