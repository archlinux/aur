# Contributor: Philipp Gesang <phg@phi-gamma.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=luatex-git
epoch=1
pkgrel=1
pkgdesc="The LuaTeX engine, current git master, standalone binary"
pkgver=4340.f25f235c0
arch=('i686' 'x86_64' 'armv7h')
url="http://www.luatex.org"
depends=('glibc')
makedepends=('git')
license=('GPL2')
conflicts=('context-minimals-git')
source=("git+https://github.com/TeX-Live/luatex.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${pkgname%-git}
  ./build.sh --parallel
}

package() {
  local reporoot="${srcdir}/${pkgname%-git}"
  cd "${reporoot}"
  msg "Package executable ${bin}"
  install -Dm755 "build/texk/web2c/luatex" "${pkgdir}/usr/bin/luatex-$pkgver"
  ln -s luatex-$pkgver "${pkgdir}"/usr/bin/texlua-$pkgver 
  ln -s luatex-$pkgver "${pkgdir}"/usr/bin/texluac-$pkgver

  msg "Package luatex man page"
  install -Dm644 source/texk/web2c/man/luatex.man "${pkgdir}/usr/share/man/man1/luatex-$pkgver.1"
  msg "Package miscellaneous files"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 manual/luatex.pdf "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 INSTALL README "${pkgdir}/usr/share/doc/${pkgname}/"
}

