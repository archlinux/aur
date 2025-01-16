# Maintainer:
# Contributor: The one with the braid <info@braid.business>

## links
# https://fluffychat.im/
# https://github.com/krille-chan/fluffychat

: ${_fvm_version:=3.24.5}

: ${FVM_CACHE_PATH:=$SRCDEST/fvm-cache}
export FVM_CACHE_PATH

_pkgname="fluffychat"
pkgname="$_pkgname"
pkgver=1.23.0
pkgrel=2
pkgdesc="The cutest instant messenger in the [matrix]"
url="https://github.com/krille-chan/fluffychat"
license=('AGPL-3.0-only')
arch=('x86_64' 'aarch64')

depends=(
  'gtk3'
  'jsoncpp'
  'libolm'
  'libsecret'
  'openssl'
  'xdg-user-dirs'
  'zenity'
)
makedepends=(
  'clang'
  'cmake'
  'fvm' # AUR
  'git'
  'lld'
  'llvm'
  'ninja'
)

options=('!strip' '!debug')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('7165285e7eefe8a5906f06bdad6e7ca2c7cda1da4381c6f0d09e0f927e99cda8')

build() {
  if [ "${CARCH::1}" != "x" ]; then
    # fix incompatible C(XX)FLAGS on Arch Linux on ARM
    CFLAGS="${CFLAGS//-fstack-protector-strong/}"
    CFLAGS="${CFLAGS//-fstack-clash-protection/}"

    CXXFLAGS="${CXXFLAGS//-fstack-protector-strong/}"
    CXXFLAGS="${CXXFLAGS//-fstack-clash-protection/}"
  fi

  cd "$_pkgsrc"
  fvm install $_fvm_version
  fvm global $_fvm_version

  fvm flutter --disable-analytics
  #fvm flutter pub upgrade --major-versions
  fvm flutter pub get
  fvm flutter build linux --no-pub --release
}

package() {
  cd "$_pkgsrc"/build/linux/*/release
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/lib/$_pkgname" .
  cmake -P cmake_install.cmake

  # symlink
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # license
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # icon
  install -Dm644 "$srcdir/$_pkgname-$pkgver/assets/favicon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=FluffyChat
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
SingleMainWindow=true
StartupWMClass=chat.fluffy.fluffychat
Terminal=false
StartupNotify=false
Categories=Network;InstantMessaging;Chat;MatrixClient
X-Purism-FormFactor=Workstation;Mobile;
END
}
