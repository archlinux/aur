# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=hashboot
pkgver=0.9.14
pkgrel=2
pkgdesc="Check integrity of files in /boot"
url="https://schlomp.space/tastytea/hashboot"
license=("custom:The Hug-Ware License")
arch=("any")

# Dependencies
makedepends=("asciidoc")
depends=("systemd" "bash")

# Download information
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz" "${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
validpgpkeys=("F7301ADFC9ED262448C42B64242E5AC4DA587BF9")
sha512sums=("7b3134abf0a615e8d6b4b56da5b6210abff3d1ebc25a5d286f764754e4f28bfc883dda29bfabc20aec5d3da1298da5b252ea9e5436b2f53e3fdfec4bac2285bd" "a738939599ed14f97058f5d0df5a70946452183dc976b79dc769a3a5affe08fa8ad2f332b2c01f03e6875f0485782df58a0f45df7ab4872dd1c2a4a00f58a725")

# Post-install and post-remove operations
install=hashboot.install

prepare() {
  # Build manpage from asciidoc
  cd "${srcdir}/${pkgname}"
  bash build_manpage.sh
}

package() {
  cd "${srcdir}/${pkgname}"

  # hashboot binary
  install -D -m755 hashboot "${pkgdir}/usr/bin/${pkgname}"

  # docs
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 hashboot.1 "${pkgdir}/usr/share/man/man1/hashboot.1"

  # systemd
  install -D -m644 init/systemd/hashboot.service "${pkgdir}/usr/lib/systemd/system/hashboot.service"

  # pacman hook
  install -D -m644 hooks/pacman.hook "${pkgdir}/usr/share/libalpm/hooks/99-hashboot.hook"
}
