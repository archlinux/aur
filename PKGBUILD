# Maintainer:

## options
#: ${_dotnet_type=-bin}
: ${_install_path:=usr/lib}

: ${_commit=e2143d43bcb6762340d8a01f20e7b5fdf104f02f}

_pkgname="ryujinx"
pkgname="$_pkgname"
pkgver=1.3.3
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
url="https://git.ryujinx.app/ryubing/ryujinx"
license=('MIT')
arch=('x86_64')

depends=(
  'alsa-lib'
  'fontconfig'
  'jack'
  'libpulse'
  'libx11'
  'wayland'
)
makedepends=(
  "dotnet-sdk${_dotnet_type:-}"
  'desktop-file-utils'
)

options=('!strip' '!debug')

_pkgsrc="$_pkgname-$_commit"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver-${_commit::7}.$_pkgext"::"$url/-/archive/$_commit/$_pkgname-$_commit.$_pkgext")
sha256sums=('SKIP')

build() (
  export HOME="$SRCDEST/nuget-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  local _runtime="linux-x64"
  local _args=(
    -c Release
    -r "$_runtime"
    --disable-build-servers
    --nologo
    --self-contained true
    -p:DebugType=none
    -p:ExtraDefineConstants=DISABLE_UPDATER
    -p:PublishSingleFile=true
    -p:Version="$pkgver"
    -p:RuntimeIdentifiers="$_runtime"
  )

  echo "Building AVA Interface..."
  dotnet publish "${_args[@]}" -o publish_ava "$_pkgsrc/src/Ryujinx"

  echo "Shutting down dotnet build server in background."
  (timeout -k 45 30 dotnet build-server shutdown) > /dev/null 2>&1 &
)

package() {
  # program
  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  cp -a publish_ava/* "$pkgdir/$_install_path/$_pkgname/"

  # symlink
  mkdir -pm755 "$pkgdir/usr/bin"
  ln -s "/$_install_path/ryujinx/Ryujinx" "$pkgdir/usr/bin/$_pkgname"

  # launcher
  local _launcher="$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgsrc"/distribution/linux/Ryujinx.desktop "$_launcher"

  desktop-file-edit --set-key="Exec" --set-value="$_pkgname %f" "$_launcher"
  desktop-file-edit --set-icon="$_pkgname" "$_launcher"

  # icon
  install -Dm644 "$_pkgsrc"/distribution/misc/Logo.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  # mimetype
  install -Dm644 "$_pkgsrc"/distribution/linux/mime/Ryujinx.xml "$pkgdir/usr/share/mime/packages/$_pkgname.xml"

  # license
  install -Dm644 "$_pkgsrc"/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # permissions
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/$_install_path/$_pkgname/Ryujinx"
  chmod 755 "$pkgdir/$_install_path/$_pkgname/Ryujinx.sh"
}
