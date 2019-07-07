# Maintainer: Minzord

pkgname="aura-git"
pkgver=2.0.1.r1616.831604b
pkgrel=1
pkgdesc="A package manager for Arch Linux and its AUR"
arch=("x86_64")
url="https://github.com/aurapm/aura"
license=("GPL3")
depends=("gmp" "zlib")
makedepends=("git" "stack")
optdepends=()
provides=("aura")
conflicts=("aura" "aura-bin")
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
  mkdir -p "aura/bin"
  stack --jobs "$[$(nproc)+1]" --local-bin-path "aura/bin/" install -- aura
}

package() {
  cd "${srcdir}/${pkgname}/aura"

  # Install binary
  install -Dm755 "bin/aura" "${pkgdir}/usr/bin/aura"

  # Install man page
  install -Dm644 "doc/aura.8" "${pkgdir}/usr/share/man/man8/aura.8"

  # Install bash and zsh completions
  install -Dm644 "doc/completions/bashcompletion.sh" "${pkgdir}/usr/share/bash-completion/completions/aura"
  install -Dm644 "doc/completions/_aura" "${pkgdir}/usr/share/zsh/site-functions/_aura"

  # Directory for storing {PKGBUILDs, source packages, installed package states}
  mkdir -p "${pkgdir}/var/cache/aura"/{pkgbuilds,src,states}
}
