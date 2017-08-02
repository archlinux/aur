# Maintainer: n0vember <n0vember at half-9 dot net>
pkgname=trustedgrub2
pkgver=1.4.0
pkgrel=3
pkgdesc="TPM enabled GRUB2 Bootloader"
arch=('i686' 'x86_64')
url="https://github.com/Sirrix-AG/TrustedGRUB2/"
license=('GPL')
depends=()
optdepends=()
makedepends=('git' 'autogen' 'autoconf' 'automake' 'gcc' 'bison' 'flex')
provides=("$pkgname" "grub")
conflicts=("$pkgname" "grub")
source=('git+https://github.com/Sirrix-AG/TrustedGRUB2' 'grub.default')
sha256sums=('SKIP' '8f156cb0a372686549f8aab166f89470777e0f78d352866f93379a96423907c6')

pkgverfix="de218083a"

prepare() {
  cd "$srcdir/TrustedGRUB2"
}

build() {
  cd "$srcdir/TrustedGRUB2"
  git checkout tags/$pkgver -b $pkgverfix
  ./autogen.sh
  ./configure --prefix=/usr \
        --bindir="/usr/bin" \
        --sbindir="/usr/bin" \
        --mandir="/usr/share/man" \
        --infodir="/usr/share/info" \
        --datarootdir="/usr/share" \
        --sysconfdir="/etc" \
        --with-bootdir="/boot" \
        --with-grubdir="grub" \
        --enable-grub-mkfont \
        --enable-grub-mount \
        --target=i386 -with-platform=pc
  make CFLAGS+="-fno-stack-protector"
}

package() {
  cd "$srcdir/TrustedGRUB2"

  make DESTDIR="$pkgdir/" bashcompletiondir="/usr/share/bash-completion/completions" install
  mkdir -p "${pkgdir}/usr/etc/default"
  msg "Install /etc/default/grub (used by grub-mkconfig)"
  install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
}

# vim:set ts=2 sw=2 et:
