# Maintainer: SoftExpert <softexpert at gmail dot com>
# Contributor: Joan Figueras <ffigue at gmail dot com>

_arch=x64v2
_pkgbase=linux-xanmod-lts
_major=6.1
_minor=24
_branch=6.x
_xanmodrel=1
pkgrel=1

pkgbase=${_pkgbase}-linux-bin-${_arch}
pkgver=${_major}.${_minor}
pkgname=("${pkgbase}" "${_pkgbase}-linux-headers-bin-${_arch}")
pkgdesc="The Linux kernel and modules with Xanmod patches - Current Stable (LTS) - Prebuilt version - ${_arch}"
url="http://www.xanmod.org/"
arch=(x86_64)
license=(GPL2)
options=('!strip')
makedepends=('jq' 'curl')

# Resolve URL of sources from GiHub provider
# cache the response of the API to reduce the number of calls made to GitHub; not authenticated calls are limited to 60 per hour
_json_data=$(curl -L -s https://api.github.com/repos/xanmod/linux/releases/tags/${pkgver}-xanmod${_xanmodrel})
_url_image=$(echo "${_json_data}" | jq --arg PKGVER "${pkgver}" --arg PKGREL "${_xanmodrel}" --arg ARCH "${_arch}" -r '.assets[] | select(.name | startswith("linux-image-" + $PKGVER + "-" + $ARCH + "-xanmod" + $PKGREL) and endswith(".deb")).browser_download_url')
_url_headers=$(echo "${_json_data}" | jq --arg PKGVER "${pkgver}" --arg PKGREL "${_xanmodrel}" --arg ARCH "${_arch}" -r '.assets[] | select(.name | startswith("linux-headers-" + $PKGVER + "-" + $ARCH + "-xanmod" + $PKGREL) and endswith(".deb")).browser_download_url')
source=("${_url_image}" "${_url_headers}")
noextract=("${_url_image}" "${_url_headers}")
# Save files we will extract later manually
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

validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha256sums=('6231033cf8084195eb9695bc2394af67d87e8b8bf4d237f0dd73a52ef1fb380f'
            'bf36378e1ef869a8a9ded83bbe5413c875d9e35dc4eda99294c04f98f1a044c0')

_package() {
  pkgdesc="The Linux kernel and modules with Xanmod patches - Current Stable (MAIN) - Prebuilt version - ${_arch}"
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
  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}

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
  echo "${kernver}" | install -Dm644 /dev/stdin "${modulesdir}/kernelbase"

  echo "${kernver}" > "${pkgdir}/boot/${pkgbase}.kver"

  local _extramodules="extramodules-${kernver}"
  ln -s "../${_extramodules}" "${modulesdir}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${kernver}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # now we call depmod...
  # depmod -b "${pkgdir}/usr" -F "${srcdir}/boot/System.map-${kernver}"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the Linux Xanmod - Current Stable (MAIN) - Prebuilt version - ${_arch}"
  depends=(pahole)

  mkdir -p "${pkgdir}"/usr/share/doc
  cp -r usr/share/doc/linux-headers-* "${pkgdir}/usr/share/doc/"
  cp -r usr/src "${pkgdir}/usr/"
}

eval "package_${pkgname[0]}() { _package \"\$@\"; }"
eval "package_${pkgname[1]}() { _package-headers \"\$@\"; }"

# vim:set ts=8 sts=2 sw=2 et:
