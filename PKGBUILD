# Maintainer:

pkgbase="zenmap-git"
pkgver=7.98.r8.g751d5fd
pkgrel=2
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
  'python-setuptools-gettext'
)

options=('!debug')

_pkgsrc="nmap"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

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

  # use pkexec for root
  sed -E \
    -e 's@^(\s*)(if which gksu.*)$@\1if which pkexec >/dev/null 2>\&1; then\n\1  SU_TO_ROOT_X=pkexec\n\1el\2@' \
    -e '/gksu\)/i \      pkexec) pkexec "\$COMMAND";;' \
    -i "$_pkgsrc/zenmap/install_scripts/unix/su-to-zenmap.sh"
}

build() {
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

  echo "Building nmap..."
  cd "$_pkgsrc"
  #autoreconf -fiv
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

  echo "Building ndiff..."
  cd "ndiff"
  python -m build --no-isolation --wheel

  echo "Building zenmap..."
  cd "../zenmap"
  python -m build --no-isolation --wheel
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
    'polkit: start zenmap as root'
  )

  provides=("zenmap=${pkgver%%.r*}")
  conflicts=("zenmap")

  cd "$_pkgsrc"
  install -Dm644 "docs/zenmap.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  python -m installer --destdir="$pkgdir" ndiff/dist/*.whl

  cd "zenmap"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # icon
  install -Dm644 "zenmapCore/data/pixmaps/zenmap.png" -t "$pkgdir/usr/share/pixmaps/"

  cd "install_scripts/unix"
  install -Dm755 "su-to-zenmap.sh" -t "$pkgdir/usr/bin/"
  install -Dm644 "zenmap.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "zenmap-root.desktop" -t "$pkgdir/usr/share/applications/"

  ln -s zenmap "$pkgdir/usr/bin/nmapfe"
  ln -s zenmap "$pkgdir/usr/bin/xnmap"

  # polkit policy
  install -Dm644 /dev/stdin "$pkgdir/usr/share/polkit-1/actions/org.gnome.pkexec.zenmap.policy" << END
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
  "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
  "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="com.gnome.pkexec.zenmap">
    <message gettext-domain="zenmap">Authentication is required to run zenmap</message>
    <icon_name>zenmap</icon_name>
    <defaults>
      <allow_any>auth_admin</allow_any>
      <allow_inactive>auth_admin</allow_inactive>
      <allow_active>auth_admin</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/zenmap</annotate>
    <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
  </action>
</policyconfig>
END
}

pkgname=(
  'nmap-git'
  'zenmap-git'
)

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_${_p%-git}")
    _package_${_p%-git}
  }"
done
