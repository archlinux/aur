# Maintainer: Honjow <honjow311@gmail.com>
# Modified from: David Runge <dvzrv@archlinux.org>

pkgname=refind-r
_pkgname=refind
_reponame=refind-code
_tag=v.0.14.2R1
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
sha512sums=('51f3186f4e9507777616331a261b9b90546989bfc51871f0207aa6cfe719e721981039160b4f32d8a8ed218128e71134c02c78b5ba3bec0fd3cfab1a848e0ca4')
b2sums=('a3c84a9c138ba2313eb585baa2c9944d34d881e79e3092392dbf443e6d4119d7e79c0a846e64d07ec88e9739e7c4d3e0f663b2dabbab8fabd345edc20668bbef')
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