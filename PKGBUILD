# Maintainer: xiota / aur.chaotic.cx
# Contributor: necklace <ns@nsz.no>

# options
: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="avaloniailspy"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=7.2rc.r10.gbc00df4
pkgrel=2
pkgdesc="Avalonia-based .NET Decompiler (port of ILSpy)"
url="https://github.com/icsharpcode/AvaloniaILSpy"
license=('MIT' 'LGPL-2.1-only' 'MS-PL')
arch=("any")

# main package
_main_package() {
  depends=(
    'dotnet-runtime'
  )
  makedepends=(
    'dotnet-sdk'
    'gendesk'
    'git'
    'libicns'
    'optipng'
  )

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _pkgver="$(echo "${pkgver:?}" | sed -E 's@^(.*)(rc)@\1-\2@')"
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${_pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}" | sed -E 's/-(rc)/\1/;s/-/./g;s/\.r.*$//'
  }
}

# git package
_main_git() {
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgname"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed -E 's/^v//;s/-(rc)/\1/;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
_install_path="usr/lib/$_pkgname"

prepare() {
  cat <<EOF > "$_pkgname.sh"
#!/usr/bin/env sh
exec "/$_install_path/ILSpy" "\$@"
EOF

  local _gendesk_options=(
    -q -f -n
    --pkgname="$_pkgname"
    --pkgdesc="$pkgdesc"
    --name="AvaloniaILSpy"
    --exec="$_pkgname %u"
    --icon="$_pkgname"
    --terminal=false
    --categories="Development"
    --startupnotify=true
  )

  gendesk "${_gendesk_options[@]}"

  icns2png -x "$_pkgsrc/ILSpy/ILSpy.icns"
  optipng ILSpy_256x256x32.png
}

build() {
  cd "$_pkgsrc"
  dotnet tool restore
  dotnet cake
}

package() {
  install -dm755 "$pkgdir/$_install_path"
  cp --reflink=auto -r "$_pkgsrc/artifacts/linux-x64"/* "$pkgdir/$_install_path/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"

  # script
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  # icon
  install -Dm644 "ILSpy_256x256x32.png" \
    "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # .desktop
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # licenses
  install -Dm644 "$_pkgsrc/doc/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 "$_pkgsrc/doc/LGPL.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL-2.1"
  install -Dm644 "$_pkgsrc/doc/MS-PL.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MS-PL"
}

# execute
_main_package
