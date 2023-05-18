# Maintainer: VHSgunzo <vhsgunzo.github.io>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname='linux-xanmod-bin'
pkgver='6.3.3'
pkgrel="1"
psabi='x64v1'
pkgdesc='The Linux kernel, modules and headers with Xanmod patches - Prebuilt version'
url="http://www.xanmod.org/"
arch=('x86_64')
license=('GPL2')
options=('!strip')
depends=('coreutils' 'kmod' 'initramfs' 'pahole')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-headers-bin")
optdepends=('crda: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
makedepends=('curl')
provides=('VIRTUALBOX-GUEST-MODULES'
          'WIREGUARD-MODULE'
          'KSMBD-MODULE'
          'NTFS3-MODULE')
_url="https://api.github.com/repos/xanmod/linux/releases"
_url_info="$(curl -sL "$_url")"
_url_image=("$(echo "$_url_info"|grep -o "https:.*/download/${pkgver}-xanmod1/linux-image.*deb"|grep "$psabi")")
_url_headers=("$(echo "$_url_info"|grep -o "https:.*/download/${pkgver}-xanmod1/linux-headers.*deb"|grep "$psabi")")
source=("${_url_image}" "${_url_headers}")
noextract=("${_url_image}" "${_url_headers}")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha256sums=('7ff4ba83b3b2be69050602fbc78912ae69d4f8f09425ec5ebbb6e3ff08b9c699'
            'caea9bb73063e01446385dd49a3f811440e3567cad23a9ac1342aec8f94fe9cd')
_file_image="${_url_image##*/}"
_file_headers="${_url_headers##*/}"
prepare() {
  bsdtar -xf ${_file_image} data.tar.xz
  bsdtar -xf data.tar.xz
  rm -f data.tar.xz
  bsdtar -xf ${_file_headers} data.tar.xz
  bsdtar -xf data.tar.xz
  rm -f data.tar.xz
}

package() {
  local kernver="${pkgver}-$psabi-xanmod1"
  local modulesdir="$pkgdir/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}"
  msg2 "Installing modules..."
  cp -r lib/modules/${kernver}/* "${modulesdir}/"
  cp -r usr/* ${pkgdir}/usr
  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "boot/vmlinuz-${kernver}" "$modulesdir/vmlinuz"
  # Used by mkinitcpio to name the kernel
  echo "${pkgname%-bin}" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
}
