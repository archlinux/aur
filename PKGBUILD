pkgname=v6emul-git
pkgver=1.1.0.r0.g5db448a
pkgrel=1
pkgdesc="Command-line emulator for the Vector-06C Soviet PC. Git version"
arch=('x86_64')
url="https://github.com/parallelno/v6emul"
license=('MIT')
depends=('glibc' 'gcc-libs' 'luajit')
makedepends=('cmake' 'git' 'nlohmann-json')
provides=('v6emul')
conflicts=('v6emul')
options=('!debug')
source=("${pkgname}::git+${url}.git"
        "system-deps.patch"
        "build-fixes.patch")
sha256sums=('SKIP'
            'bcd35d83b99d5841b7cb1f76a6f6327fa7aa759fca7cb5fddae1145771eee088'
            '7aba3c89f6529d855dd530052b455b6d002f94807692ff0cc2cd197237200bb7')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  patch -Np1 -i "${srcdir}/system-deps.patch"
  patch -Np1 -i "${srcdir}/build-fixes.patch"
}

build() {
  export V6EMUL_VERSION="${pkgver}"
  cmake -S "${pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  install -Dm755 build/app/v6emul "${pkgdir}/usr/bin/v6emul"

  cd "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/v6emul/boot/" res/boot/*
  install -Dm644 -t "${pkgdir}/usr/share/v6emul/fdd/" res/fdd/*
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
