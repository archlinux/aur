# Maintainer: Honjow <honjow311@gmail.com>
# Modified from: David Runge <dvzrv@archlinux.org>

pkgname=refind-r
_pkgname=refind
_reponame=refind-code
_tag=v.0.14.2R
pkgver=${_tag#v.}
pkgrel=1
pkgdesc="An EFI boot manager fork with Screen Rotation Support"
arch=(x86_64)  # we build architecture-specific EFI binaries
url="https://github.com/honjow/refind-code"
makedepends=(
  bash
  dosfstools
  efibootmgr
  gnu-efi
  make
  gcc
)
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
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$url/archive/refs/tags/${_tag}.tar.gz")
sha512sums=('52d7888c055e81fd7a8f3e9134a091a90f6154d0b259f135b2ce93f2f7398e3cb842aba039913ae5b2617806fde97c0e2589feea0ba267525bc16c1ccb404d5d')
b2sums=('06d8a196d05acb3cb7c511ba9cd0811b39dc8971fa7c7b99546abe9fd0408626f5ce572ae31d6daaa4f66c52d9c1f7d83a49d293c6c9126b349993359afcf7d7')
_arch='x64'

prepare() {
  cd $_reponame-${_tag}
  # remove the path prefix from the css reference, so that the css can live
  # in the same directory
  sed -e 's|../Styles/||g' -i docs/$_pkgname/*.html
  # hardcode RefindDir, so that refind-install can find refind_x64.efi
  sed -e 's|RefindDir=\"\$ThisDir/refind\"|RefindDir="/usr/share/refind/"|g' -i refind-install
  # add vendor line to the sbat file
  printf 'refind.%s,%s,%s,refind,%s,%s\n' 'arch' '1' 'Arch Linux' "${epoch:+${epoch}:}${pkgver}-${pkgrel}" 'https://archlinux.org/packages/?q=refind' >> refind-sbat.csv
}

build() {
  cd $_reponame-${_tag}
  make
  make gptsync
  make fs
}

package() {


  cd $_reponame-${_tag}
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