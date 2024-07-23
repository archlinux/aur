# Maintainer:
# Contributor: James Cuzella <james.cuzella@lyraphase.com>
# Contributor: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>

: ${_hgrev=3d43b280298c39a67d1d889e01e173f52c12da35}

_gitname="dvb-apps"
_pkgname="linuxtv-dvb-apps"
pkgname="$_pkgname"
pkgver=1505
pkgrel=6
pkgdesc='Linux DVB API applications and utilities'
url='https://www.linuxtv.org'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

depends=('glibc')
makedepends=('mercurial')
optdepends=(
  'dtv-scan-tables-git: initial tuning data necessary for scanning utils'
)

## patch collections
#_patch_url_1='https://git.busybox.net/buildroot/plain/package/dvb-apps'
_patch_url_2='https://gitweb.gentoo.org/repo/gentoo.git/plain/media-tv/linuxtv-dvb-apps/files'
#_patch_url_3='https://git.openembedded.org/meta-openembedded/plain/meta-multimedia/recipes-multimedia/dvb-apps/files'

## Debian dvb-apps bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=779520
_patch_url_4='https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=779520;filename=bug779520.patch;msg=17'
#_patch_url_5='https://patch-diff.githubusercontent.com/raw/tufei/dvb-apps/pull/2.patch'

_pkgsrc="$_gitname"
source=(
  "$_pkgsrc"::"hg+https://linuxtv.org/legacy-hg/dvb-apps/#revision=${_hgrev}"

  "0001-glibc-2.31.patch"::"$_patch_url_2/linuxtv-dvb-apps-glibc-2.31.patch"
  "0002-no-ca_set_pid.patch"::"$_patch_url_2/linuxtv-dvb-apps-no-ca_set_pid.patch"
  "0003-alevt.patch"::"$_patch_url_2/linuxtv-dvb-apps-1.1.1.20100223-alevt.patch"
  "0004-ldflags.patch"::"$_patch_url_2/linuxtv-dvb-apps-1.1.1.20100223-ldflags.patch"
  "0005-perl526.patch"::"$_patch_url_2/linuxtv-dvb-apps-1.1.1.20100223-perl526.patch"
  "0006-dvbdate.patch"::"$_patch_url_2/linuxtv-dvb-apps-1.1.1.20140321-dvbdate.patch"
  "0007-gcc10.patch"::"$_patch_url_2/linuxtv-dvb-apps-1.1.1.20140321-gcc10.patch"
  "0008-64-bit-addr-int-bug779520.patch"::"$_patch_url_4"
)
sha256sums=(
  'SKIP'

  'cd26db2922605b82fdf370d1d06557b600072ba20b3900b71b3da21a79963a9f'
  '58773c592c064eb85df2cbb64aef9d03ae0ce421065f974baa22c428db2f6d78'
  '1707ddbdac648059c84837fdabdcb2fa2d73661748f82163023a187d0ecc9ffd'
  '8eb444d72c922db4166c5f926ae80537c56e1087ef792be34749caa6629f7e94'
  '4460c9c8f4474fcc776b8d02d1c527584a81dbc84b69db9ed9a8b43ca24d49c5'
  '74b3e5b1c74339decaabedac121809fcf058d7337fd3f7e1dd353a24e10b698c'
  '10d18f1ceb311a7a247548e8a942e46381a976ee089c8073549ef78ab1fe05c6'
  'c65d70a91b437930fb2b63c83d763c3431fd4c9a0e3248c0aed4df652dd8be16'
)

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

pkgver() {
  cd "$_pkgsrc"
  hg identify -n | sed 's/+//'
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install

  # Avoid conflict with xbase (FS#37862)
  mv "$pkgdir/usr/bin"/{zap,dvb-zap}

  # Avoid conflict with sane-scan-pdf-git
  mv "$pkgdir/usr/bin"/{scan,dvb-scan}
}
