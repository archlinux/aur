# Maintainer: Giulio Lettieri <giulio.lettieri@gmail.com>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=lpm-git
_pkgname=lpm
_gitname=lite-xl-plugin-manager
pkgver=1.2.0.r5.g45d1d50
pkgrel=1
pkgdesc='A lite-xl plugin manager.'
arch=('x86_64' 'aarch64')
url="https://github.com/lite-xl/lite-xl-plugin-manager"
license=('MIT')
depends=('lua' 'zlib' 'libzip' 'libgit2' 'mbedtls2')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lite-xl/lite-xl-plugin-manager")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long --exclude continuous --exclude latest | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${_gitname}"
  FULL_VERSION=$(git describe --tags --long --exclude continuous --exclude latest)
  CFLAGS="$CFLAGS -DLPM_VERSION='\"$FULL_VERSION\"'"
  arch-meson -Dstatic=true . build
  meson compile -C build
}

package() {
  install -D "${srcdir}/${_gitname}/build/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -D -t "${pkgdir}/usr/share/licenses/lpm/" "${srcdir}/${_gitname}/LICENSE"
  install -D -t "${pkgdir}/usr/share/doc/lpm/" "${srcdir}/${_gitname}/"{README,SPEC}.md
}
