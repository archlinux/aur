# Maintainer: Lukas Wölfer (domain is thasky) <aur at [domain] dot one>
pkgname=diaria-git
pkgver=0.2.4.r1.g4b23ea1
pkgrel=1
pkgdesc='Diary entry manager'
url='https://github.com/corrodedHash/diaria'
source=("${pkgname}::git+https://github.com/corrodedHash/${pkgname%-git}#branch=main")
arch=('x86_64' 'i686')
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=('git' 'cmake')
checkdepends=('python-pytest')
depends=('libsodium' 'glibc' 'gcc-libs' 'xz')
optdepends=()

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"

  cmake -D BUILD_STATIC_BINARY=OFF --preset=release-linux -B build/
}

build () {
  cd "${srcdir}/${pkgname}"

  cmake --build build/ --parallel `nproc --all`
  cmake --install build/ --prefix dist/
}

check() {
  cd "${srcdir}/${pkgname}"
  cd test/end_to_end
  DIARIA="../../dist/bin/diaria" pytest
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm0755 dist/bin/diaria "${pkgdir}/usr/bin/diaria"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "extra/zsh_completions" "${pkgdir}/usr/share/zsh/site-functions/_diaria"
}
