# Maintainer:

## useful links
# https://rsync.samba.org/
# https://github.com/RsyncProject/rsync
# https://github.com/RsyncProject/rsync-patches

_pkgname="rsync"
pkgname="$_pkgname-reflink-git"
pkgver=3.3.0.r6.g85c906f
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files - with reflink support'
url='https://github.com/RsyncProject/rsync'
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'libacl.so' # acl
  'libxxhash.so' # xxhash
  'openssl'
  'popt'
  'zstd'

  ## implicit
  #bash
  #lz4
  #zlib
)
optdepends=(
  ## AUR
  'python-braceexpand: for rrsync'
)
makedepends=(
  'git'
  'python-commonmark'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

backup=(
  'etc/rsyncd.conf'
  'etc/xinetd.d/rsync'
)

_pkgsrc="rsyncproject.rsync"
source+=("$_pkgsrc"::"git+$url.git")
sha256sums+=('SKIP')

_patch_id() {
  local _url="https://github.com/RsyncProject/rsync-patches"
  local _response=$(curl -LSsf "$_url/commits.atom")

  local _date=$(
    printf '%s' "$_response" \
      | grep '<updated>' \
      | sed -E 's&^.*<updated>(.*)</updated>.*$&\1&;s&[-:Z]&&g;s&T&-&' \
      | sort -rV | head -1
  )
  echo "$_date"
}
_patch_id=$(_patch_id)
_patch_branch="master"

source+=(
  "reflink-${_patch_id}-clone-dest.patch"::"$url-patches/raw/${_patch_branch}/clone-dest.diff"
  "reflink-${_patch_id}-detect-renamed.patch"::"$url-patches/raw/${_patch_branch}/detect-renamed.diff"
  "reflink-${_patch_id}-detect-renamed-lax.patch"::"$url-patches/raw/${_patch_branch}/detect-renamed-lax.diff"
  'rsyncd.conf'
)
sha256sums+=(
  'SKIP'
  'SKIP'
  'SKIP'
  '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b'
)

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
)

prepare() {
  cd "$_pkgsrc"

  # Apply patches from source array
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]] ; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "$srcdir/$src"
    fi
  done
}

build() {
  cd "$_pkgsrc"

  local _configure_options=(
    --prefix=/usr
    --enable-ipv6
    --disable-debug
    --with-rrsync
    --with-included-popt=no
    --with-included-zlib=no
  )

  ./configure "${_configure_options[@]}"
  make
}

check() {
  cd "$_pkgsrc"
  make test
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install

  install -Dm644 \
    "$srcdir/rsyncd.conf" \
    "$pkgdir/etc/rsyncd.conf"

  install -Dm644 \
    "packaging/lsb/rsync.xinetd" \
    "$pkgdir/etc/xinetd.d/rsync"

  install -Dm644 \
    "packaging/systemd/rsync.service" \
    "$pkgdir/usr/lib/systemd/system/rsyncd.service"

  install -Dm644 \
    "packaging/systemd/rsync.socket" \
    "$pkgdir/usr/lib/systemd/system/rsyncd.socket"

  install -Dm644 \
    "packaging/systemd/rsync@.service" \
    "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
}
