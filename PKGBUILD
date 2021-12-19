# Maintainer: yjun <jerrysteve1101 at gmail dot com>

_target=riscv-none-embed
pkgname=$_target-gcc
pkgver=10.2.0_1.2
pkgrel=1
pkgdesc='Cross compiler for 32-bit and 64-bit RISC-V (The xPack GNU RISC-V Embedded GCC)'
arch=('x86_64')
url='https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack'
license=('GPL' 'LGPL' 'FDL')
depends=("libmpc")
provides=("xpack-${pkgname}"
          "${_target}-gdb" "${_target}-binutils" "${_target}newlib")
options=('!emptydirs' '!strip')
source=("${url}/releases/download/v${pkgver//_/-}/xpack-${pkgname}-${pkgver//_/-}-linux-x64.tar.gz")
md5sums=('362f4eea39d4edd3c91294ca1ce3f5ea')

package() {
  install -dm755 ${pkgdir}/opt/xpack/${pkgname}

  cp -a ${srcdir}/xpack-${pkgname}-${pkgver//_/-}/* ${pkgdir}/opt/xpack/${pkgname}/

  # Strip target binaries
  #find "$pkgdir/opt/xpack/${pkgname}/lib/gcc/$_target/" -type f \
  #  -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy \
  #  -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames \
  #  -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str \
  #  -R .debug_ranges -R .debug_loc '{}' \;

  # Strip host binaries
  # find "$pkgdir/opt/xpack/${pkgname}/bin/" "$pkgdir/opt/xpack/${pkgname}/libexec/gcc/$_target/" -type f \
  #  -and \( -executable \) -exec strip '{}' \;

   install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname}.sh" << EOF
#!/bin/sh
[ -d /opt/xpack/${pkgname}/bin ] && append_path '/opt/xpack/${pkgname}/bin'

export PATH
EOF
}

# vim: ts=4 sw=4 et
