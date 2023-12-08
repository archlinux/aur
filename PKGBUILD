# Maintainer:

_pkgname="mx-samba-config"
pkgname="$_pkgname-git"
pkgver=23.7.r5.ga48fb0b
pkgrel=1
pkgdesc="Samba configuration tool designed to work with the 'usershare' system"
url="https://github.com/MX-Linux/mx-samba-config"
license=('LGPL3')
arch=('x86_64')

depends=()
makedepends=(
  'cmake'
  'git'
  'qt5-base'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "$_pkgname.sysusers.conf"
  "mx-samba-config-lib.sh"
)
sha256sums=(
  'SKIP'
  '65f5888ecfd8bf4c7f5a65213ddd710b93c632c1f05f258e1c691e9f7acff83e'
  '5280cc7d9cc8d7183954244784f142da43b741d3a275e5d3f2dfb742ad2482eb'
)

pkgver() {
  cd "$_pkgsrc"

  local _regex='^\s*Version: ([0-9\.]+)\s*$'
  local _file
  for i in debs/mx-samba-config_*.dsc ; do
    if [ -e "$i" ] ; then
      _file="$i"
    fi
  done

  if [ -z "$_file" ] ; then
    _regex='^\s*const QString VERSION \{"([0-9\.]+)"\};$'
    _file='version.h'
  fi

  local _line=$(grep -Esm1 "$_regex" "$_file")
  local _line_num=$(grep -En "$_regex" "$_file" | cut -d':' -f1)

  local _version=$(sed -E "s@$_regex@\1@" <<< "$_line")

  local _commit=$(git blame -L $_line_num,$_line_num -- "$_file" | awk '{print $1;}')

  local _revision=$(git rev-list --count $_commit..HEAD)
  local _hash=$(git rev-parse --short HEAD)

  printf "%s.r%s.g%s" "$_version" "$_revision" "$_hash"
}

prepare() {
  # fix helper script
  sed -E 's&\bsmbd\b&smb&;s&\bnmbd\b&nmb&' -i "$_pkgsrc/scripts/"*
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
    'qt5-base'
    'samba'
  )

  # binary
  install -Dm755 "build/$_pkgname" -t "$pkgdir/usr/bin"

  # helper scripts
  install -Dm755 "$_pkgsrc/scripts/mx-samba-config-list-users" -t "$pkgdir/usr/lib/$_pkgname/"
  install -Dm755 "mx-samba-config-lib.sh" "$pkgdir/usr/lib/$_pkgname/mx-samba-config-lib"

  # desktop file
  install -Dm644 "$_pkgsrc/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

  # icon
  install -Dm644 "$_pkgsrc/images/mx-samba-config.svg" \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  # polkit
  install -Dm644 "$_pkgsrc/actions/"*.policy -t "$pkgdir/usr/share/polkit-1/actions"

  # sysusers
  install -Dm644 "$_pkgname.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"

  # empty share folder
  install -dm775 "$pkgdir/var/lib/samba/usershares"
}
