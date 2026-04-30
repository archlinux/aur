# Maintainer:

_pkgname="rsync"
pkgname="$_pkgname-reflink-git"
pkgver=3.4.2.r9.g79fd7d5
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files - with reflink support'
url='https://github.com/RsyncProject/rsync'
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'libacl.so'    # acl
  'libxxhash.so' # xxhash
  'openssl'
  'popt'
  'zstd'
)
optdepends=(
  'python: for rrsync'
)
makedepends=(
  'git'
  'python-commonmark'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

backup=('etc/rsyncd.conf')

_patch_id() {
  local _url _response _commit
  _url="https://github.com/RsyncProject/rsync-patches"
  _response=$(curl -LSsf "$_url/commits.atom")
  _commit=$(grep -Pom1 '::Commit/\K([a-f0-9]+)' <<< "$_response")
  printf '%s' "${_commit:?}"
}
_patch_id=$(_patch_id)

_pkgsrc="rsyncproject.rsync"
source=(
  "$_pkgsrc"::"git+$url.git"
  "reflink-${_patch_id::7}-clone-dest.patch"::"$url-patches/raw/${_patch_id}/clone-dest.diff"
  'rsyncd.conf'
)
sha256sums=(
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
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "$srcdir/$src"
      echo
    fi
  done

  # For historic reasons we install the systemd unit as `rsyncd.*`, instead of
  # just `rsync.*`. Let's make it conflict as expected with these names.
  sed -i '/^Conflicts=/s|rsync.service|rsyncd.service|' packaging/systemd/rsync.socket
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

  # install support scripts to doc
  for i in support/*; do
    install -Dm0644 "$i" "$pkgdir/usr/share/doc/rsync/$i"
  done
  install -Dm644 "tech_report.tex" "$pkgdir/usr/share/doc/rsync/tech_report.tex"

  install -Dm644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
  install -Dm644 packaging/systemd/rsync.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
  install -Dm644 packaging/systemd/rsync.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
  install -Dm644 packaging/systemd/rsync@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
}
