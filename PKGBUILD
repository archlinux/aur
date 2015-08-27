# Maintainer: yaroslav <proninyaroslav@mail.ru>

pkgname=infer
pkgver=0.3.0
pkgrel=1
pkgdesc="Static Analyzer by Facebook"
arch=('x86_64')
url="https://github.com/facebook/infer"
license=('BSD')
depends=('python2' 'python' 'java-environment<=7' 'opam')
makedepends=('gcc>=4.7.2' 'git' 'rsync')
source=("${pkgname}::git://github.com/facebook/infer.git")
sha256sums=('SKIP')


build() {
  opam init -y --comp=4.01.0
  eval `opam config env`
  opam install -y extlib.1.5.4 atdgen.1.6.0 javalib.2.3.1 sawja.1.5.1

  cd "${pkgname}"
  git submodule update --init --recursive
  cd facebook-clang-plugins
  git checkout 1bd0b7fbd2bd940418936be480efc26c6356cc3c
  cd ..
  facebook-clang-plugins/clang/setup.sh
  unset CFLAGS
  ./compile-fcp.sh
  make -C infer
}

package() {
  srcdir="${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
  cp -r "${srcdir}"/* "${pkgdir}/usr/lib/${pkgname}"
  cat > "${pkgdir}/usr/bin/infer" <<EOF
#!/bin/bash
/usr/lib/infer/infer/bin/infer "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/infer"
}
