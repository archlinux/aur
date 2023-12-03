# Maintainer: VHSgunzo <vhsgunzo.github.io>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname='linux-xanmod-bin'
pkgver='6.6.4'
branch='main'
pkgrel="1"

check_psabi() {
  awk 'BEGIN {
      while (!/flags/) if (getline < "/proc/cpuinfo" != 1) exit 1
      if (/lm/&&/cmov/&&/cx8/&&/fpu/&&/fxsr/&&/mmx/&&/syscall/&&/sse2/) level = 1
      if (level == 1 && /cx16/&&/lahf/&&/popcnt/&&/sse4_1/&&/sse4_2/&&/ssse3/) level = 2
      if (level == 2 && /avx/&&/avx2/&&/bmi1/&&/bmi2/&&/f16c/&&/fma/&&/abm/&&/movbe/&&/xsave/) level = 3
      if (level == 3 && /avx512f/&&/avx512bw/&&/avx512cd/&&/avx512dq/&&/avx512vl/) level = 4
      if (level > 0) { print "x64v" level }
  }' 2>/dev/null||echo "x64v1"
}

psabi="$(check_psabi)"
pkgdesc='The Linux kernel, modules and headers with Xanmod patches - Prebuilt version'
url="http://www.xanmod.org/"
arch=('x86_64')
license=('GPL2')
options=('!strip')
depends=('coreutils' 'kmod' 'initramfs' 'pahole')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-headers-bin")
optdepends=('crda: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
makedepends=('curl' 'gawk' 'grep' 'libarchive' 'xz' 'jq')
provides=('VIRTUALBOX-GUEST-MODULES'
          'WIREGUARD-MODULE'
          'KSMBD-MODULE'
          'NTFS3-MODULE')
_url="https://sourceforge.net/projects/xanmod/files/releases/$branch/${pkgver}-xanmod1/${pkgver}-${psabi}-xanmod1"
_url_info="$(curl -sL "$_url"|grep "net.sf.files"|sed 's|net.sf.files = ||g;s|;$||'|jq -r '.[].download_url'|grep -v '\-dbg_')"
_url_image="$(echo "$_url_info"|grep -o "https:.*/linux-image.*deb")"
_url_headers="$(echo "$_url_info"|grep -o "https:.*/linux-headers.*deb")"
source=("${_url_image}" "${_url_headers}")
noextract=("${_url_image}" "${_url_headers}")
sha256sums=('SKIP' 'SKIP')
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
