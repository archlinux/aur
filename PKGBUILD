# Maintainer:

: ${_pkgtype=-git}

pkgbase="zenmap-git"
pkgver=7.95.r110.g5039f7e
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

pkgver() {
  cd "$_pkgsrc"
  local _regex='^Nmap ([0-9\.]+) .*$'
  local _file='CHANGELOG'

  local _line=$(grep -Esm1 "$_regex" "$_file")
  local _line_num=$(grep -Ensm1 "$_regex" "$_file" | cut -d':' -f1)

  local _version=$(sed -E "s@$_regex@\1@" <<< "$_line")

  local _commit=$(git blame -L $_line_num,+1 -- "$_file" | awk '{print $1;}')

  local _revision=$(git rev-list --count --cherry-pick "$_commit"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  cd "$_pkgsrc"
  # ensure we build devendored deps
  rm -rf liblua libpcap libpcre macosx mwin32 libssh2 libz
  autoreconf -fiv
}

_build_nmap() (
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=*/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=*/_FORTIFY_SOURCE=2}"

  cd "$_pkgsrc"
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
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md docs/nmap.usage.txt -t "${pkgdir}/usr/share/doc/$pkgname/"
  install -Dm 644 LICENSE docs/3rd-party-licenses.txt -t "${pkgdir}/usr/share/licenses/$pkgname/"
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
