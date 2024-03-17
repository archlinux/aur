# Maintainer:

## useful linkes
# https://rsync.samba.org/
# https://github.com/WayneD/rsync
# https://github.com/WayneD/rsync-patches

## options
: ${_build_git:=false}

unset _pkgtype
_pkgtype+="-reflink"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="rsync"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=3.2.7
pkgrel=7
pkgdesc='A fast and versatile file copying tool for remote and local files - with reflink support'
url='https://github.com/WayneD/rsync'
license=('GPL-3.0-or-later')
arch=('x86_64')

# main package
_main_package() {
  depends=(
    'libacl.so' # acl
    'libxxhash.so' # xxhash
    'openssl'
    'popt'
    'zstd'

    ## implicit
    #bash
    #glibc
    #lz4
    #zlib
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

  backup=(
    'etc/rsyncd.conf'
    'etc/xinetd.d/rsync'
  )

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi

  source+=(
    "$url-patches/raw/master/clone-dest.diff"
    "$url-patches/raw/master/detect-renamed.diff"
    "$url-patches/raw/master/detect-renamed-lax.diff"
    'rsyncd.conf'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
    '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b'
  )
}

# stable package
_main_stable() {
  : ${_pkgver:=${pkgver%%.r*}}

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${_pkgver:?}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() (
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  )
}

# common functions
prepare() {
  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  cd "$_pkgsrc"

  # patches
  apply-patch "$srcdir/clone-dest.diff"
  apply-patch "$srcdir/detect-renamed.diff"
  apply-patch "$srcdir/detect-renamed-lax.diff"
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

# execute
_main_package
