# Maintainer:
# Contributor: The one with the braid <info@braid.business>

## links
# https://fluffychat.im/
# https://github.com/krille-chan/fluffychat

: ${_fvm_version:=3.27.3}

: ${FVM_CACHE_PATH:=$SRCDEST/fvm-cache}
export FVM_CACHE_PATH

_pkgname="fluffychat"
pkgname="$_pkgname"
pkgver=1.24.0
pkgrel=1
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
sha256sums=('84b08cae206b6ea8b3f373e267de4e0cb1dcbea5a0d29802314afa2811604b77')

build() {
  # fix incompatible C(XX)FLAGS on Arch Linux on ARM
  if [ "${CARCH::1}" != "x" ]; then
    local i _cflags _cxxflags _unwanted
    _cflags=(${CFLAGS})
    _cxxflags=(${CXXFLAGS})

    _unwanted=(
      -fstack-protector-strong
      -fstack-clash-protection
    )

    for i in ${_unwanted[@]}; do
      _cflags=(${_cflags[@]//$i/})
      _cxxflags=(${_cxxflags[@]//$i/})
    done

    CFLAGS="${_cflags[@]}"
    CXXFLAGS="${_cxxflags[@]}"
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
