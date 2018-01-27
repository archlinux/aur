# Maintainer: Ralph Alexander Bariz <ralph.bariz at protonmail.ch>

pkgname=('ldc-armv7h' 'liblphobos-armv7h' 'dub-armv7h')
groups=('dlang' 'dlang-ldc')
conflicts=('ldc' 'liblphobos' 'dub')
pkgver=1.6.0
epoch=1
pkgrel=2
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure including D runtime and libphobos2"
arch=('armv7h')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
makedepends=()

source=("https://github.com/ldc-developers/ldc/releases/download/v1.6.0/ldc2-1.6.0-linux-armhf.tar.xz"
	"ldc2.conf")
md5sums=('7b4ee4abb90a8d30df27e86f4b0b829b'
         '5d66934872d5242eaa56b10678fa932c')
_pkgdir="ldc2-1.6.0-linux-armhf"

package_ldc-armv7h() {
  depends=('liblphobos-armv7h' 'llvm-libs')
  backup=('etc/ldc2.conf')
  provides=("d-compiler=${dmd_fe_ver}")

  #cd "${srcdir}/${_pkgdir}/etc"
  install -D "ldc2.conf" "${pkgdir}/etc/ldc2.conf"

  cd "${srcdir}/${_pkgdir}/etc/bash_completion.d"
  install -D "ldc2" "${pkgdir}/etc/bash_completion.d/ldc2"

  cd "${srcdir}/${_pkgdir}/bin"
  # relink to libtinfo.so.6
  sed -i -e 's/libtinfo.so.5/libtinfo.so.6/g' ldc-build-runtime
  sed -i -e 's/libtinfo.so.5/libtinfo.so.6/g' ldc-profdata
  sed -i -e 's/libtinfo.so.5/libtinfo.so.6/g' ldc-prune-cache
  sed -i -e 's/libtinfo.so.5/libtinfo.so.6/g' ldc2
  sed -i -e 's/libtinfo.so.5/libtinfo.so.6/g' ldmd2
  
  install -D "ldc-build-runtime" "${pkgdir}/usr/bin/ldc-build-runtime"
  install -D "ldc-profdata" "${pkgdir}/usr/bin/ldc-profdata"
  install -D "ldc-prune-cache" "${pkgdir}/usr/bin/ldc-prune-cache"
  install -D "ldc2" "${pkgdir}/usr/bin/ldc2"
  install -D "ldmd2" "${pkgdir}/usr/bin/ldmd2"

  cd "${srcdir}/${_pkgdir}/lib"
  install -D "LLVMgold-ldc.so" "${pkgdir}/usr/lib/LLVMgold-ldc.so"

  cd "${srcdir}/${_pkgdir}"
  install -D "LICENSE" "${pkgdir}/usr/share/licenses/ldc/LICENSE"

  # creating symlinks
  cd "${pkgdir}/etc/bash_completion.d"
  ln -s ldc2 ldc 
  
  cd ${pkgdir}/usr/bin
  ln -s ldc2 ldc
  ln -s ldmd2 ldmd
}

package_liblphobos-armv7h() {
  provides=('d-runtime' 'd-stdlib')

  cd "${srcdir}/${_pkgdir}/lib"
  install -D "libdruntime-ldc-debug.a" "${pkgdir}/usr/lib/libdruntime-ldc-debug.a"
  install -D "libdruntime-ldc.a" "${pkgdir}/usr/lib/libdruntime-ldc.a"
  install -D "libldc-jit-rt.a" "${pkgdir}/usr/lib/libldc-jit-rt.a"
  install -D "libldc-jit.so" "${pkgdir}/usr/lib/libldc-jit.so"
  install -D "libldc-jit.so.1.6.0" "${pkgdir}/usr/lib/libldc-jit.so.1.6.0"
  install -D "libldc-profile-rt.a" "${pkgdir}/usr/lib/libldc-profile-rt.a"
  install -D "libphobos2-ldc-debug.a" "${pkgdir}/usr/lib/libphobos2-ldc-debug.a"
  install -D "libphobos2-ldc.a" "${pkgdir}/usr/lib/libphobos2-ldc.a"

  cd "${srcdir}/${_pkgdir}/import"
  mkdir -p "${pkgdir}/usr/include/dlang/ldc/"
  cp -adr --preserve=mode -t "${pkgdir}/usr/include/dlang/ldc/" *
  chown -R root:root "${pkgdir}/usr/include/dlang/ldc/"

  cd "${srcdir}/${_pkgdir}"
  install -D "LICENSE" "${pkgdir}/usr/share/licenses/liblphobos/LICENSE"
}

package_dub-armv7h() {
  cd "${srcdir}/${_pkgdir}/bin"
  install -D "dub" "${pkgdir}/usr/bin/dub"

  cd "${srcdir}/${_pkgdir}"
  install -D "LICENSE" "${pkgdir}/usr/share/licenses/dub/LICENSE"
}


