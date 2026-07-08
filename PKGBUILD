# Maintainer:

pkgbase="zenmap-git"
pkgname=(
  'nmap-git'
  'ndiff-git'
  'zenmap-git'
)
pkgver=7.99.r181.gb47e7f0
pkgrel=1
url="https://github.com/nmap/nmap"
license=('LicenseRef-Nmap-Public-Source-License-Version-0.95')
arch=('x86_64')

makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-gettext'
  'python-wheel'

  # nmap
  'libpcap'
  'libssh2'
  'lua54'
  'openssl'
  'pcre2'
  'zlib'

  # zenmap
  'gtk3'
  'python-cairo'
  'python-gobject'
)

_pkgsrc="nmap"
source=(
  "$_pkgsrc"::"git+$url.git"
  'nmap-ndiff-fix-tests.patch'
)
sha256sums=(
  'SKIP'
  '93653a3d7e16d02c8e9e0d2472449758186381d2210a42ca7fa367b4eb5913b8'
)

pkgver() {
  cd "$_pkgsrc"
  local _file _regex _hash _ver
  _file='CHANGELOG'
  _regex='Nmap ([0-9\.]+) .*'
  read -r _hash _ver < <(
    NL=$(awk '/^'"${_regex}"'.*$/ { print NR; exit }' "$_file")
    git blame -L "$NL,+1" -- "$_file" \
      | sed -E -e 's&^([0-9a-f]+).*'"${_regex}"'.*$&\1 \2&'
  )

  git tag -f "$_ver" "$_hash"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  # Ensure we build de-vendored deps
  rm -r liblua libpcap libpcre macosx mswin32 libssh2 libz

  # Fix build
  sed -e '/strlcat/d' -i libdnet-stripped/acconfig.h

  # Keep zenmap from installing ndiff; Arch packages it separately
  sed -e '/^ndiff = "ndiff:run_main"$/d' -e '/^py-modules = \["ndiff"\]$/d' -i zenmap/pyproject.toml

  # Remove usage of Python module imp (removed in Python 3.13) &
  # remove import-time unittest.main() invocation
  patch -Np1 < ../nmap-ndiff-fix-tests.patch

  # use pkexec for root
  sed -E \
    -e 's@^(\s*)(if which gksu.*)$@\1if which pkexec >/dev/null 2>\&1; then\n\1  SU_TO_ROOT_X=pkexec\n\1el\2@' \
    -e '/gksu\)/i \      pkexec) pkexec "\$COMMAND";;' \
    -i "zenmap/install_scripts/unix/su-to-zenmap.sh"
}

build() {
  cd "$_pkgsrc"

  echo "Building nmap..."
  autoreconf -fiv -I /usr/share/gettext/m4
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
  python -m build --no-isolation --wheel ndiff

  echo "Building zenmap..."
  python -m build --no-isolation --wheel zenmap
}

check() {
  cd "$_pkgsrc"
  make check

  cd zenmap
  python -m unittest discover -p '*.py'

  cd ../ndiff
  python -m unittest discover -p '*.py'
}

package_nmap-git() {
  pkgdesc="Utility for network discovery and security auditing"
  depends=(
    'libpcap'
    'libssh2.so'
    'lua54'
    'openssl'
    'pcre2'
    'zlib'
  )

  provides=("nmap")
  conflicts=("nmap")

  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
  install -Dm644 README.md docs/nmap.usage.txt -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE docs/3rd-party-licenses.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ndiff-git() {
  pkgdesc="Compare two Nmap XML files and display a list of their differences"
  arch=('any')

  depends=('python')

  provides=("ndiff")
  conflicts=("ndiff")

  cd "$_pkgsrc"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  cd "ndiff"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 docs/ndiff.1 -t "$pkgdir/usr/share/man/man1/"
}

package_zenmap-git() {
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

  provides=("zenmap")
  conflicts=("zenmap")

  cd "$_pkgsrc"
  install -Dm644 "docs/zenmap.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

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
