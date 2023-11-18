# Maintainer: brainlessbitch
# Contributor: brainlessbitch

pkgname=guifetch-git
_pkgname=guifetch
pkgver=r32.e8084a4%
pkgrel=1
pkgdesc="GUI fetch tool written in Flutter for Linux"
arch=('x86_64')
url="https://github.com/FlafyDev/guifetch"
license=('MIT')
depends=('gtk3')
makedepends=('clang' 'cmake' 'ninja' 'flutter' 'git')

source=("git+https://github.com/FlafyDev/guifetch")
sha256sums=("SKIP")

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "guifetch"

  flutter build linux --release

  install -dm755 "${pkgdir}/opt/${_pkgname}/"

  cd "$srcdir/$_pkgname/build/linux/x64/release/bundle"
  local execfile="$(find . -mindepth 1 -maxdepth 1 -type f -perm /111)"
  install -Dm755 \
	  "${execfile}" \
	  "${pkgdir}/opt/${_pkgname}/${_pkgname}"

  cp -r 'lib/' "${pkgdir}/opt/${_pkgname}/"
  cp -r 'data/' "${pkgdir}/opt/${_pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"

  ln -s \
		"/opt/${_pkgname}/${_pkgname}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}

# vim: ts=2 sw=2 et:
