# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.9.0
_pkgver="${pkgver%.*}"
pkgrel=2

_pkgname="${_basename}${_pkgver}"
pkgname="${_pkgname}-bin"
pkgdesc="A language server for Zig"
arch=(
  # 'aarch64'
  # 'armv7h'
  'i686'
  # 'riscv64'
  'x86_64'
)
url="https://zigtools.org/zls"
license=('MIT')
depends=(
  'sh'
  "zig${_pkgver}"
)
makedepends=(
  'minisign'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source=("${_basename}-versioned.sh")
# source_aarch64=("https://builds.zigtools.org/${_basename}-linux-aarch64-${pkgver}.tar.xz"
#                 "https://builds.zigtools.org/${_basename}-linux-aarch64-${pkgver}.tar.xz.minisig")
source_i686=("https://builds.zigtools.org/${_basename}-linux-x86-${pkgver}.tar.xz"
             "https://builds.zigtools.org/${_basename}-linux-x86-${pkgver}.tar.xz.minisig")
# source_riscv64=("https://builds.zigtools.org/${_basename}-linux-riscv64-${pkgver}.tar.xz"
#                 "https://builds.zigtools.org/${_basename}-linux-riscv64-${pkgver}.tar.xz.minisig")
source_x86_64=("https://builds.zigtools.org/${_basename}-linux-x86_64-${pkgver}.tar.xz"
               "https://builds.zigtools.org/${_basename}-linux-x86_64-${pkgver}.tar.xz.minisig")
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68')
sha256sums_i686=('4596d0fcf236da331fa3afd9f282ac2492f22469f1b673465035b80850f4bd01'
                 'SKIP')
sha256sums_x86_64=('0bb16e2e3a1c4dab22b1d6b25deeefd2212abcc2e88702a3f58705164703a7f8'
                   'SKIP')

if   [ "${CARCH}" = 'aarch64' ]; then _arch=aarch64;
elif [ "${CARCH}" = 'armv7h'  ]; then _arch=armv7a;
elif [ "${CARCH}" = 'i686'    ]; then _arch=x86; # i386
elif [ "${CARCH}" = 'riscv64' ]; then _arch=riscv64;
elif [ "${CARCH}" = 'x86_64'  ]; then _arch=x86_64;
else _arch=DUMMY;
fi

verify() {
  # https://zigtools.org/zls/releases/0.9.0/
  local zls_minisign="RWR+9B91GBZ0zOjh6Lr17+zKf5BoSuFvrx2xSeDE57uIYvnKBGmMjOex"

  minisign -V \
    -P "${zls_minisign}" \
    -m "${_basename}-linux-${_arch}-${pkgver}.tar.xz"
}

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${_pkgname}|g" \
      -i "${_basename}-versioned.sh"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${_pkgname}/${_basename}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
