# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="smolrtsp-libevent"
_commit_rel="c4d914648dc6832cc650b1eeb3b7c4e8914aaa68" # 0.1.0
_commit="7451e74a574e3d982bf175094aa0baa432cba7dd" # r1
pkgver="0.1.0+r1+g${_commit::7}"
pkgrel=2
pkgdesc="SmolRTSP + libevent 2.x"
arch=(
  'x86_64'
)
url="https://github.com/OpenIPC/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
optdepends=(
  'libevent'
  'smolrtsp'
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${url}/archive/${_commit}/${_pkgsrc}.tar.gz"
)
sha256sums=('10859dbbe51f8fc1717843c914816bf0e0ca4564916ac9129cef29f1f05f31c0')

build() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} ${CPPFLAGS} -fPIC -shared \
    -Iinclude \
    src/*.c \
    ${LDFLAGS} \
    -Wl,-soname,libsmolrtsp-libevent.so."${pkgver%%.*}" \
    -o "lib${pkgname}.so.${pkgver%%+*}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr"
  cp -va --no-preserve=ownership "include" -t "${pkgdir}/usr"

  install -vDm644 "lib${pkgname}.so.${pkgver%%+*}" -t "${pkgdir}/usr/lib"

  install -vDm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}/usr/lib"
  for lib in lib*.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done
}
