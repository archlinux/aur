# Maintainer: Komeil Parseh <ahmdparsh129@gmail.com>
pkgname=starwm-git
_gitname=starwm
pkgver=r64.da02779
pkgrel=1
epoch=2
pkgdesc=" StarWM is an extensible, floating and tiling, X window manager for Linux-based operating systems written in Rust. "
arch=('any')
url="https://github.com/starwm/starwm"
license=('MIT')
makedepends=('cargo' 'git')
depends=('libx11' 'libxcb' 'alacritty')
provides=('starwm-git')
conflicts=('starwm' 'starwm-git')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${_gitname}"


  install -Dm755 "${srcdir}/${pkgname}/target/release/${_gitname}" -t "${pkgdir}/usr/bin"
  install -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}/${_gitname}.desktop" "${pkgdir}/usr/share/xsessions/${_gitname}.desktop"
}
