# Maintainer: Kirisame Marisa <kirisame@mco.moe>

_target=riscv-none-elf
_pkgname=$_target-gcc
pkgname=$_pkgname-bin
pkgver=13.2.0_2
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
sha256sums_arm=('29a876dbab0b770e20bcbb81d6de0802a81608e7d049e5f79b18c28b1a83c1d6')
sha256sums_aarch64=('1c981c611a38dfe5af902089aed570d4dd501eb4ed88d801043e59ab9a62a86a')
sha256sums_x86_64=('52545afb900200fbf65fe05f7ce7090b8a42c64091f4f5d43cae6bb68ea2434a')

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

