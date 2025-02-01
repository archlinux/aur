# Maintainer:

: ${_pkgtype=-git}

pkgbase="zenmap-git"
pkgver=7.95.r219.g6f72b2e
pkgrel=1
url="https://github.com/nmap/nmap"
license=('LicenseRef-Nmap-Public-Source-License-Version-0.95')
arch=('x86_64')

makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'

  # nmap
  'libpcap'
  'libssh2'
  'lua'
  'openssl'
  'pcre2'
  'zlib'

  # zenmap
  'gtk3'
  'python-cairo'
  'python-gobject'
)

options=('!debug')

_pkgsrc="nmap"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

source+=("3020-fix-link-nping.patch"::"https://github.com/nmap/nmap/pull/3020.diff")
sha256sums+=('b8d59d23cd406e941538b63f24a31c05034cc33f517a51479a7323a26298d706')

pkgver() {
  cd "$_pkgsrc"
  local _regex _file _line _line_num _version _commit _revision _hash
  _regex='^Nmap ([0-9\.]+) .*$'
  _file='CHANGELOG'
  _line=$(grep -Esm1 "$_regex" "$_file")
  _line_num=$(grep -Ensm1 "$_regex" "$_file" | cut -d':' -f1)
  _version=$(sed -E "s@$_regex@\1@" <<< "$_line")
  _commit=$(git blame -L $_line_num,+1 -- "$_file" | awk '{print $1;}')
  _revision=$(git rev-list --count --cherry-pick "$_commit"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  local _devendor i src
  _devendor=(
    liblua
    libpcap
    libpcre
    libssh2
    libz
    macosx
  )

  for i in ${_devendor[@]}; do
    rm -r "$_pkgsrc/$i"
  done

  cd "$_pkgsrc"
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
      echo
    fi
  done
}

_build_nmap() (
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

  echo "Building nmap..."
  cd "$_pkgsrc"
  autoreconf -fiv
  ./configure \
    --prefix=/usr \
    --with-libpcap=/usr \
    --with-libpcre=/usr \
    --with-zlib=/usr \
    --with-libssh2=/usr \
    --with-liblua=/usr \
    --without-ndiff \
    --without-zenmap
  make
)

_build_zenmap() (
  echo "Building zenmap..."
  cd "$_pkgsrc/zenmap"
  python -m build --no-isolation --wheel
)

build() {
  _build_nmap
  _build_zenmap
}

check() {
  cd "$_pkgsrc"
  make check
}

_package_nmap() {
  pkgdesc="Utility for network discovery and security auditing"
  depends=(
    'libpcap'
    'libssh2.so'
    'lua'
    'openssl'
    'pcre2'
    'zlib'
  )

  provides=("nmap=${pkgver%%.r*}")
  conflicts=("nmap")

  cd "$_pkgsrc"
  make -j1 DESTDIR="$pkgdir" install
  install -Dm644 README.md docs/nmap.usage.txt -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE docs/3rd-party-licenses.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

_package_zenmap() {
  pkgdesc="Graphical Nmap frontend and results viewer"
  arch=('any')

  depends=(
    'gtk3'
    'nmap'
    'python'
    'python-cairo'
    'python-gobject'
  )
  optdepends=(
    'gksu: start zenmap as root'
  )

  provides=("zenmap=${pkgver%%.r*}")
  conflicts=("zenmap")

  cd "$_pkgsrc"
  install -Dm644 "docs/zenmap.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm755 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd zenmap
  python -m installer --destdir="$pkgdir" dist/*.whl

  ln -s zenmap "$pkgdir/usr/bin/nmapfe"
  ln -s zenmap "$pkgdir/usr/bin/xnmap"
}

pkgname=(
  'nmap-git'
  'zenmap-git'
)

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_${_p%${_pkgtype:-}}")
    _package_${_p%${_pkgtype:-}}
  }"
done
