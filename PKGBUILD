# Maintainer: zargbell <zargbell@yandex.ru>
pkgname="aura-git"
pkgver=2.0.0.r1459.4f208e8
pkgrel=1
pkgdesc="A package manager for Arch Linux and its AUR"
arch=("x86_64")
url="https://github.com/aurapm/aura"
license=("GPL3")
depends=("gmp" "zlib")
makedepends=("git" "stack")
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
replaces=()
options=("strip")
source=("${pkgname}"::"git+https://github.com/aurapm/aura.git")
md5sums=("SKIP")


pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.r%s.%s" "$(awk -F"\"" '($1 == "auraVersion = ") {print $2}' aura/exec/aura.hs)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p bin
	stack --jobs "$[$(nproc)+1]" --local-bin-path "bin/" install -- aura
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/bin/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}