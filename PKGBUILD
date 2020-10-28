# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>
# Contributor: Olaf Leidinger <oleid@mescharet.de>

pkgname=futhark-nightly
pkgver=0.19.0.r1603790886.g0d10f768
pkgrel=1
pkgdesc="A data-parallel functional programming language"
arch=('x86_64')
url="https://github.com/diku-dk/futhark"
license=('ISC')
depends=('ncurses5-compat-libs'
         'zlib'
         'gmp')
optdepends=('opencl-headers: opencl support'
            'ocl-icd: opencl support'
            'opencl-driver: opencl support')
makedepends=('curl')
provides=("${pkgname%-nightly}")
conflicts=("${pkgname%-nightly}")
_tarurl="https://futhark-lang.org/releases/futhark-nightly-linux-${arch}.tar.xz"
_modificationtime=$(date +%s -d "$(curl -sI ${_tarurl} | grep Last-Modified | sed s/^'Last-Modified: '//)")
source=("${pkgname}-${_modificationtime}.tar.xz::https://futhark-lang.org/releases/futhark-nightly-linux-${arch}.tar.xz")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/futhark-nightly-linux-${arch}"

    if [[ $(cat commit-id) =~ "-g" ]]
    then
        # If commit-id contains output from `git describe`
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' < commit-id
    else
        # Fallback on modification time and commit-id
        printf "%s.r%s.g%s" "$(./bin/futhark -V | grep Futhark | sed "s/Futhark //")" "$_modificationtime" "$(cut -c 1-8 < commit-id)"
    fi
}

package() {
    cd "${srcdir}/futhark-nightly-linux-${arch}"
    make PREFIX="${pkgdir}/usr" install

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
