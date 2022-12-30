# Maintainer: Felix Singer <felixsinger@posteo.net>

_targets="x86_64 aarch64 riscv64"

pkgbase=musl
pkgname=()
pkgver=1.2.3
pkgrel=1
pkgdesc='Lightweight implementation of C standard library'
arch=('x86_64' 'riscv64' 'aarch64')
url='https://musl.libc.org'
license=('MIT')
options=('staticlibs' '!buildflags' '!strip')
depends=()
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F')
source=(https://musl.libc.org/releases/musl-${pkgver}.tar.gz{,.asc})
sha256sums=('7d5b0b6062521e4627e099e4c9dc8248d32a30285e959b7eecaa780cf8cfd4a4'
            'SKIP')


for target in ${_targets}; do
  pkgname+=("${pkgbase}-${target}")
done


build() {
  cd musl-$pkgver
  muslsrc="$(pwd)"

  for _target in ${_targets}; do
    CROSS_TARGET=""
    AR=""
    RANLIB=""

    if [ "${_target}" = "x86_64" ]; then
      CROSS_TARGET="x86_64-pc"
      AR="x86_64-pc-linux-gnu-gcc-ar"
      RANLIB="x86_64-pc-linux-gnu-gcc-ranlib"
    else
      CROSS_TARGET="${_target}"
    fi

    mkdir "${muslsrc}/build-${_target}"
    cd "${muslsrc}/build-${_target}"

    AR="${AR}" \
    RANLIB="${RANLIB}" \
    CROSS_COMPILE="${CROSS_TARGET}-linux-gnu-" \
      ../configure \
      --target=${_target} \
      --build=${_target} \
      --prefix=/usr/${_target}-linux-musl \
      --syslibdir=/usr/${_target}-linux-musl/lib \
      --enable-wrapper=all

    make
  done
}


do_package() {
  _target="$(echo ${pkgname} | cut -d '-' -f 2)"

  cd ${srcdir}/musl-${pkgver}/build-${_target}
  make DESTDIR="${pkgdir}" install
  
  cd ..
  install -Dm0644 COPYRIGHT "$pkgdir"/usr/share/licenses/${pkgname}/COPYRIGHT
}


package_musl-x86_64() {
  do_package
}


package_musl-riscv64() {
  do_package
}


package_musl-aarch64() {
  do_package
}
