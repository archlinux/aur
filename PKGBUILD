# Maintainer: Chenx Dust <chenx_dust@outlook.com>
# Modified from: David Runge <dvzrv@archlinux.org>

pkgname=refi2nd
_pkgname=refind
pkgver=0.14.2
pkgrel=1
pkgdesc="A fork of rEFInd with bug-fixes and optimizations."
arch=(x86_64)  # we build architecture-specific EFI binaries
url="https://github.com/chenx-dust/rEFI2nd"
makedepends=(
  bash
  dosfstools
  efibootmgr
  gnu-efi
)
_suffix='rEFI2nd'
_arch='x64'
license=(
  BSD-2-Clause
  CC-BY-SA-3.0
  CC-BY-SA-4.0
  GPL-2.0-only
  GPL-2.0-or-later
  GPL-3.0-or-later
  LGPL-2.1-or-later
  'LGPL-3.0-or-later OR CC-BY-SA-3.0'
)
depends=(
  bash
  dosfstools
  efibootmgr
)
optdepends=(
  'gptfdisk: for finding non-vfat ESP with refind-install'
  'imagemagick: for refind-mkfont'
  'openssl: for generating local certificates with refind-install'
  'python: for refind-mkdefault'
  'refind-docs: for HTML documentation'
  'sbsigntools: for EFI binary signing with refind-install'
  'sudo: for privilege elevation in refind-install and refind-mkdefault'
)
provides=($_pkgname)
conflicts=($_pkgname)

source=($url/archive/refs/tags/v$pkgver-$_suffix.tar.gz)
sha512sums=('89abc48671f0037075d83ffaed000ff8f64dd580fe5314263bed874fa8dde9be2d2e2c70d07ac0e33098852e9dab64611a533dcb7c21b0f1ba958ea00865b15f')
b2sums=('bb5b1d206eefc70de7bf8a4566227573ef3dbe295eb6c9f84f07ad557be5c52f3a911bbcb4c9bdc3f7a9991ad0184cce29d8b9e9dda088ed0a1c2a442f2db188')

prepare() {
  cd rEFI2nd-$pkgver-$_suffix
  # remove the path prefix from the css reference, so that the css can live
  # in the same directory
  sed -e 's|../Styles/||g' -i docs/$_pkgname/*.html
  # hardcode RefindDir, so that refind-install can find refind_x64.efi
  sed -e 's|RefindDir=\"\$ThisDir/refind\"|RefindDir="/usr/share/refind/"|g' -i refind-install
  # add vendor line to the sbat file
  printf 'refind.%s,%s,%s,refind,%s,%s\n' 'arch' '1' 'Arch Linux' "${epoch:+${epoch}:}${pkgver}-${pkgrel}" 'https://archlinux.org/packages/?q=refind' >> refind-sbat.csv
}

build() {
  cd rEFI2nd-$pkgver-$_suffix
  make
  make gptsync
  make fs
}

package() {
  cd rEFI2nd-$pkgver-$_suffix
  # NOTE: the install target calls refind-install, therefore we install things
  # manually
  # efi binaries
  install -vDm 644 refind/*.efi -t "$pkgdir/usr/share/$_pkgname/"
  install -vDm 644 drivers_*/*.efi -t "$pkgdir/usr/share/refind/drivers_$_arch/"
  install -vDm 644 gptsync/*.efi -t "$pkgdir/usr/share/$_pkgname/tools_$_arch/"
  # sample config
  install -vDm 644 $_pkgname.conf-sample -t "$pkgdir/usr/share/$_pkgname/"
  # keys
  install -vDm 644 keys/*{cer,crt} -t "$pkgdir/usr/share/$_pkgname/keys/"
  # keysdir
  install -vdm 700 "$pkgdir/etc/refind.d/keys"
  # fonts
  install -vDm 644 fonts/*.png -t "$pkgdir/usr/share/$_pkgname/fonts/"
  # icons
  install -vDm 644 icons/*.png -t "$pkgdir/usr/share/$_pkgname/icons"
  install -vDm 644 icons/svg/*.svg -t "$pkgdir/usr/share/$_pkgname/icons/svg/"
  # scripts
  install -vDm 755 {refind-{install,mkdefault,sb-healthcheck},mkrlconf,mvrefind} -t "$pkgdir/usr/bin/"
  install -vDm 755 fonts/mkfont.sh "$pkgdir/usr/bin/$_pkgname-mkfont"
  # man pages
  install -vDm 644 docs/man/*.8 -t "$pkgdir/usr/share/man/man8/"
  # docs
  install -vDm 644 {CREDITS,NEWS,README}.txt -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -vDm 644 fonts/README.txt "$pkgdir/usr/share/doc/$_pkgname/README.$_pkgname-mkfont.txt"
  install -vDm 644 icons/README "$pkgdir/usr/share/doc/$_pkgname/README.icons.txt"
  install -vDm 644 keys/README.txt "$pkgdir/usr/share/doc/$_pkgname/README.keys.txt"
  # license
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
