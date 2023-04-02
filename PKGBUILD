# Maintainer: SoftExpert <softexpert at gmail dot com>
# Contributor: Joan Figueras <ffigue at gmail dot com>

_arch=x64v1
_pkgbase=linux-xanmod-lts
_major=6.1
_minor=22
_branch=6.x
_xanmodrel=1
pkgrel=3
pkgbase=${_pkgbase}-linux-bin-${_arch}
pkgver=${_major}.${_minor}
pkgname=("${pkgbase}" "${_pkgbase}-linux-headers-bin-${_arch}")
pkgdesc="The Linux kernel and modules with Xanmod patches - Current Stable (LTS) - Prebuilt version - ${_arch}"
url="http://www.xanmod.org/"
arch=(x86_64)
license=(GPL2)
options=('!strip')
makedepends=('jq' 'curl')

# Resolve URL of sources
_url_image=$(curl -L -s https://api.github.com/repos/xanmod/linux/releases/tags/${pkgver}-xanmod${_xanmodrel} | jq --arg PKGVER "${pkgver}" --arg PKGREL "${_xanmodrel}" --arg ARCH "${_arch}" -r '.assets[] | select(.name | startswith("linux-image-" + $PKGVER + "-" + $ARCH + "-xanmod" + $PKGREL) and endswith(".deb")).browser_download_url')
_url_headers=$(curl -L -s https://api.github.com/repos/xanmod/linux/releases/tags/${pkgver}-xanmod${_xanmodrel} | jq --arg PKGVER "${pkgver}" --arg PKGREL "${_xanmodrel}" --arg ARCH "${_arch}" -r '.assets[] | select(.name | startswith("linux-headers-" + $PKGVER + "-" + $ARCH + "-xanmod" + $PKGREL) and endswith(".deb")).browser_download_url')
source=("${_url_image}" "${_url_headers}")
noextract=("${_file_image}" "${_file_headers}")

# Save files we will extract later manually
_file_image="${_url_image##*/}"
_file_headers="${_url_headers##*/}"

validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha256sums=('505408d75450a06a070381a4cbe6af47008376b082942351239c2a2340dc65ef'
            '4a95d0a5f6ddc6ab0a2545e9dc2b7126fdfe9ea7b25260bd068a31582984a568')

prepare() {
  bsdtar -xf ${_file_image} data.tar.xz
  bsdtar -xf data.tar.xz
  rm -f data.tar.xz
  bsdtar -xf ${_file_headers} data.tar.xz
  bsdtar -xf data.tar.xz
  rm -f data.tar.xz
}

_package() {
  pkgdesc="The Linux kernel and modules with Xanmod patches - Current Stable (LTS) - Prebuilt version - ${_arch}"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE
            KSMBD-MODULE
            NTFS3-MODULE)

  local kernver="${pkgver}-${_arch}-xanmod${_xanmodrel}"
  local modulesdir="${pkgdir}/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}" "${pkgdir}/usr/share/doc"

  msg2 "Installing modules..."
  cp -r lib/modules/${kernver}/* "${modulesdir}/"

  # Docs
  cp -r usr/share/doc/linux-image-* "${pkgdir}/usr/share/doc/"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "boot/vmlinuz-${kernver}" "${modulesdir}/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${pkgbase}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the Linux Xanmod - Current Stable (LTS) - Prebuilt version - ${_arch}"
  depends=(pahole)

  mkdir -p "${pkgdir}"/usr/share/doc
  cp -r usr/share/doc/linux-headers-* "${pkgdir}/usr/share/doc/"
  cp -r usr/src "${pkgdir}/usr/"
}

eval "package_${pkgname[0]}() { _package \"\$@\"; }"
eval "package_${pkgname[1]}() { _package-headers \"\$@\"; }"

# vim:set ts=8 sts=2 sw=2 et:
