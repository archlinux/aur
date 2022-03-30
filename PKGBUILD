pkgname=bgfx-git
pkgver=1.115.8109
pkgrel=1
pkgdesc="Cross-platform, graphics API agnostic, \"Bring Your Own Engine/Framework\" style rendering library."
arch=('x86_64')
url="https://bkaradzic.github.io/bgfx"
license=('BSD')

depends=('mesa' 'libx11')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=('git+https://github.com/bkaradzic/bx.git'
        'git+https://github.com/bkaradzic/bimg.git'
        'git+https://github.com/bkaradzic/bgfx.git')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  # From bgfx.cpp source:
  # bgfx 1.104.7082
  #      ^ ^^^ ^^^^
  #      | |   +--- Commit number  (https://github.com/bkaradzic/bgfx / git rev-list --count HEAD)
  #      | +------- API version    (from https://github.com/bkaradzic/bgfx/blob/master/scripts/bgfx.idl#L4)
  #      +--------- Major revision (always 1)
  cd "${srcdir}/${pkgname%-git}"
  api=`sed '4q;d' scripts/bgfx.idl  | sed 's,version(,,g' | sed 's,),,g'`
  printf "1.%s.%s" $api "$(git rev-list --count HEAD)"

}

build() {
  cd "${srcdir}/${pkgname%-git}"
  if [ `check_option debug`=y ]
  then
    make linux-debug64
  else
    make linux-release64
  fi
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  CONFIG=Release
  if [ `check_option debug`=y ]
  then
    CONFIG=Debug
  fi
  install -D .build/linux64_gcc/bin/libbgfx-shared-lib${CONFIG}.so ${pkgdir}/usr/lib/libbgfx.so
  install -dm755 ${pkgdir}/usr/include
  for PROJ in bx bimg bgfx
  do
    cp -r ${srcdir}/${PROJ}/include ${pkgdir}/usr
  done

  # add shader includes to include
  install -m644 src/bgfx_shader.sh ${pkgdir}/usr/include/bgfx/
  install -m644 src/bgfx_compute.sh ${pkgdir}/usr/include/bgfx/

  # prepend bgfx to bin names to avoid naming conflicts
  for BIN in geometryc geometryv shaderc texturec texturev
  do
    install -D .build/linux64_gcc/bin/${BIN}${CONFIG} ${pkgdir}/usr/bin/bgfx-${BIN}
  done

  # remove helper and 3rdparty includes used to compile bgfx
  rm -rf ${pkgdir}/usr/include/compat
  rm -rf ${pkgdir}/usr/include/tinystl
}

# vim:set ts=2 sw=2 et:
