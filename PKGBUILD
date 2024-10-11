# Maintainer: Kirisame Marisa <kirisame@mco.moe>

_target=riscv-none-elf
_pkgname=$_target-gcc
pkgname=$_pkgname-bin
pkgver=14.2.0_2
pkgrel=1
pkgdesc='Cross compiler for 32-bit and 64-bit RISC-V (The xPack GNU RISC-V Embedded GCC)'
arch=('arm' 'aarch64' 'x86_64')
url='https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack'
license=('GPL' 'LGPL')
depends=("libmpc")
provides=("xpack-${_pkgname}"
          "${_target}-gdb" "${_target}-binutils" "${_target}-newlib")
options=('!emptydirs' '!strip')
source_arm=("${url}/releases/download/v${pkgver//_/-}/xpack-${_pkgname}-${pkgver//_/-}-linux-arm.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver//_/-}/xpack-${_pkgname}-${pkgver//_/-}-linux-arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver//_/-}/xpack-${_pkgname}-${pkgver//_/-}-linux-x64.tar.gz")
sha256sums_arm=('16a797c25e3bc1aeb056472b357731cae38378fe52bde75b11abf23eecfd14b9')
sha256sums_aarch64=('e1348fdd679131510f610a9aa42ec4e5d6bceb40115df4b57a44cb7186a7caa7')
sha256sums_x86_64=('0ab93937aab882c3a69f63eff4fe8fc6e360e4a23776004fa116ad692e699d23')

package() {
  install -dm755 ${pkgdir}/opt/xpack/${_pkgname}

  cp -a ${srcdir}/xpack-${_pkgname}-${pkgver//_/-}/* ${pkgdir}/opt/xpack/${_pkgname}/

  # Strip target binaries
  #find "$pkgdir/opt/xpack/${_pkgname}/lib/gcc/$_target/" -type f \
  #  -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy \
  #  -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames \
  #  -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str \
  #  -R .debug_ranges -R .debug_loc '{}' \;

  # Strip host binaries
  # find "$pkgdir/opt/xpack/${_pkgname}/bin/" "$pkgdir/opt/xpack/${_pkgname}/libexec/gcc/$_target/" -type f \
  #  -and \( -executable \) -exec strip '{}' \;

   install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${_pkgname}.sh" << EOF
#!/bin/sh
[ -d /opt/xpack/${_pkgname}/bin ] && append_path '/opt/xpack/${_pkgname}/bin'

export PATH
EOF
}

