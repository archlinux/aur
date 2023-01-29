# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_arch=x64v3
pkgbase=linux-xanmod-linux-bin-${_arch}
_pkgbase=linux-xanmod
_major=6.1
pkgver=${_major}.8
xanmod=1
pkgrel=${xanmod}
pkgdesc="The Linux kernel and modules with Xanmod patches - Current Stable (MAIN) - Prebuilt version - ${_arch}"
url="http://www.xanmod.org/"
arch=(x86_64)
license=(GPL2)
options=('!strip')
makedepends=('jq' 'curl')

# Resolve URL of sources
#_url_image=$(curl -L -s https://api.github.com/repos/xanmod/linux/releases/tags/${pkgver}-xanmod${xanmod} | jq --arg PKGVER "${pkgver}" --arg XANMOD "${xanmod}" --arg ARCH "${_arch}" -r '.assets[] | select(.name | contains("linux-image-" + $PKGVER + "-" + $ARCH + "-xanmod" + $XANMOD)).browser_download_url')
#_url_headers=$(curl -L -s https://api.github.com/repos/xanmod/linux/releases/tags/${pkgver}-xanmod${xanmod} | jq --arg PKGVER "${pkgver}" --arg XANMOD "${xanmod}" --arg ARCH "${_arch}" -r '.assets[] | select(.name | contains("linux-headers-" + $PKGVER + "-" + $ARCH + "-xanmod" + $XANMOD)).browser_download_url')
#source=("${_url_image}" "${_url_headers}")

# Sourceforge download provider
_image_files=($(curl -sL https://sourceforge.net/projects/xanmod/files/releases/main/${pkgver}-${_arch}-xanmod${xanmod}/ | grep net.sf.files | cut -d'=' -f2- | jq '.[].name' 2>/dev/null | grep "\.deb" | grep -v linux-libc-dev | cut -d'"' -f2))
source=("${_image_files[0]}::https://sourceforge.net/projects/xanmod/files/releases/main/${pkgver}-${_arch}-xanmod${xanmod}/${_image_files[0]}/download"
        "${_image_files[1]}::https://sourceforge.net/projects/xanmod/files/releases/main/${pkgver}-${_arch}-xanmod${xanmod}/${_image_files[1]}/download")
noextract=("${_image_files[0]}" "${_image_files[1]}")

# Save files we will extract later manually
#_file_image="${_url_image##*/}"
#_file_headers="${_url_headers##*/}"
#noextract=("${_file_image}" "${_file_headers}")

validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha256sums=('e0bd8660dc009257550b004697801b8c079b7fc9f23688a08a770578f1ec9f12'
            '0c6c4431086bb164c182bef5cb73f3ef64b4e7f93d6a3c7b287ef7e92b53d8a0')

prepare() {
  for _f in ${_image_files[@]} ; do
    bsdtar -xf ${_f} data.tar.xz
    bsdtar -xf data.tar.xz
    rm -f data.tar.xz
  done
  #bsdtar -xf ${_file_image} data.tar.xz
  #bsdtar -xf data.tar.xz
  #rm -f data.tar.xz
  #bsdtar -xf ${_file_headers} data.tar.xz
  #bsdtar -xf data.tar.xz
  #rm -f data.tar.xz
}

_package() {
  pkgdesc="The Linux kernel and modules with Xanmod patches - Current Stable (MAIN) - Prebuilt version - ${_arch}"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE
            KSMBD-MODULE
            NTFS3-MODULE)

  local kernver="${pkgver}-${_arch}-xanmod${xanmod}"
  local modulesdir="${pkgdir}/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}" "${pkgdir}/usr/share/doc"

  msg2 "Installing modules..."
  cp -r lib/modules/${kernver}/* "${modulesdir}/"

  # Docs
  cp -r usr/share/doc/linux-image-* "${pkgdir}/usr/share/doc/"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "boot/vmlinuz-${pkgver}-${_arch}-xanmod${xanmod}" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${pkgname}" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the Linux Xanmod - Current Stable (MAIN) - Prebuilt version - ${_arch}"
  depends=(pahole)

  mkdir -p "${pkgdir}"/usr/share/doc
  cp -r usr/share/doc/linux-headers-* "${pkgdir}/usr/share/doc/"
  cp -r usr/src "${pkgdir}/usr/"
}

pkgname=("${_pkgbase}-linux-bin-${_arch}" "${_pkgbase}-linux-headers-bin-${_arch}")
eval "package_${pkgname[0]}() { _package \"\$@\"; }"
eval "package_${pkgname[1]}() { _package-headers \"\$@\"; }"

# vim:set ts=8 sts=2 sw=2 et:
