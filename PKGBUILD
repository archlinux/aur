# Maintainer:

_pkgname="mx-samba-config"
pkgname="$_pkgname-git"
pkgver=24.4.r1.gce56e6d
pkgrel=1
pkgdesc="Samba configuration tool designed to work with the usershare system"
url="https://github.com/MX-Linux/mx-samba-config"
license=('GPL-3.0-or-later') # LICENSE file is LGPL-3.0-only, but headers have GPL-3.0-or-later; GPL > LGPL.
arch=('x86_64')

depends=(
  'qt6-base'
)
makedepends=(
  'cmake'
  'git'
)
optdepends=(
  'smb.conf: samba configuration'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

options=('emptydirs')

install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "$_pkgname.sysusers.conf"
  "mx-samba-config-lib.sh"
  "mx-samba-config-list-users.sh"
)
sha256sums=(
  'SKIP'
  '65f5888ecfd8bf4c7f5a65213ddd710b93c632c1f05f258e1c691e9f7acff83e'
  '02c7cbb51bd9b635e52bb64e858c87d539832e82c2df2c48af1efb47b1acd148'
  '7d1636d66b34b04a91e03095132f54489e343934defe67c618e28312f4643ef4'
)

pkgver() {
  cd "$_pkgsrc"
  local _file _regex _hash _ver _rev _commit
  _file="debian/changelog"
  _regex='mx-samba-config \(([0-9\.]+)\)'
  read -r _hash _ver < <(
    NL=$(awk '/^'"${_regex}"'.*$/ { print NR; exit }' "$_file")
    git blame -L "$NL,+1" -- "$_file" \
      | sed -E -e 's&^([0-9a-f]+).*'"${_regex}"'.*$&\1 \2&'
  )
  _rev=$(git rev-list --count --cherry-pick "$_hash"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.g%s" "${_ver:?}" "${_rev:?}" "${_commit:?}"
}

prepare() {
  # update version.h, see debian/rules
  head -n1 "$_pkgsrc/debian/changelog" \
    | sed -e "s/.*(\([^(]*\)).*/const QString VERSION {\"\1\"};/" \
      > "$_pkgsrc/version.h"

  # fix service name
  sed -E 's&\b(systemctl is-enabled) smbd\b&\1 smb&' \
    -i "$_pkgsrc/mainwindow.cpp"

  # update for qt6
  sed -E 's&Qt5&Qt6&g' -i "$_pkgsrc/CMakeLists.txt"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"

    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
    'hicolor-icon-theme'
    'samba'
  )

  # binary
  install -Dm755 "build/$_pkgname" -t "$pkgdir/usr/bin"

  # helper scripts
  #install -Dm755 "$_pkgsrc/scripts"/* -t "$pkgdir/usr/lib/$_pkgname/"
  install -Dm755 "mx-samba-config-lib.sh" \
    "$pkgdir/usr/lib/$_pkgname/mx-samba-config-lib"

  install -Dm755 "mx-samba-config-list-users.sh" \
    "$pkgdir/usr/lib/$_pkgname/mx-samba-config-list-users"

  # desktop file
  install -Dm644 "$_pkgsrc/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

  # icon
  install -Dm644 "$_pkgsrc/images/mx-samba-config.svg" \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  # polkit
  install -Dm644 "$_pkgsrc/actions/"*.policy -t "$pkgdir/usr/share/polkit-1/actions"

  # config files
  install -Dm644 "$_pkgname.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"

  # empty share folder
  install -dm775 "$pkgdir/var/lib/samba/usershares"
}
