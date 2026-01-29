# Maintainer: Honjow <honjow311@gmail.com>
# Modified from: David Runge <dvzrv@archlinux.org>

pkgname=refind-r
_pkgname=refind
_reponame=refind-code
_tag=v.0.14.2R2
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
sha512sums=('d00825bbbf8e10a84791f966c2dfb388a8fa02a2cfb55ac75130207cde2f7784d73777b6f7e61fb15b996dfb368e3881c205c97ab990a5d3d367c8e3acb858e7')
b2sums=('157a87e7dd34d5f50e3a651e87e4d5b0b358bc6fc4ae403c4ce9a30d00863a66dad80bce8c27d3c97277d2f73ffd6d9a7799969a5e92523a1793cdadf2fa972b')
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