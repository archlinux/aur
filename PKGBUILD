# Maintainer: yaroslav <proninyaroslav@mail.ru>

pkgname=infer
pkgver=0.8.1
pkgrel=1
pkgdesc="Static Analyzer by Facebook"
arch=('x86_64')
url="https://github.com/facebook/infer"
license=('BSD')
depends=('python2' 'python' 'java-environment' 'gcc>=4.7.2' 'opam>=1.2.0')
makedepends=('git' 'rsync')
source=("${pkgname}::git://github.com/facebook/infer.git")
sha256sums=('SKIP')


build() {
    opam init -y --comp=4.02.3
    opam switch 4.02.1
    eval $(opam config env)

    cd "${pkgname}"
    git submodule update --init --recursive
    opam update
    opam pin add --yes --no-action infer .
    opam install --deps-only infer
    ./build-infer.sh
}

package() {
    srcdir="${pkgname}"
    mkdir -p "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/facebook-clang-plugins/" "${pkgdir}/usr/lib/${pkgname}"
    cat > "${pkgdir}/usr/bin/infer" <<EOF
#!/bin/bash
/usr/lib/infer/infer/bin/infer "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/infer"
}
