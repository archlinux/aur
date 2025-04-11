# Maintainer:

## options
#: ${_dotnet_type=-bin}
: ${_install_path:=usr/lib}

: ${_commit=7664f8cde9f8fe7ed0347e098086e1227aef8bdc}

_pkgname="ryujinx"
pkgname="$_pkgname"
pkgver=1.2.86
pkgrel=2
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

  local _args=(
    -c Release
    -r linux-x64
    --disable-build-servers
    --nologo
    --self-contained true
    -p:DebugType=none
    -p:ExtraDefineConstants=DISABLE_UPDATER
    -p:PublishSingleFile=true
    -p:Version="${pkgver%%.[A-Za-z]*}"
  )

  echo "Building AVA Interface..."
  dotnet publish "${_args[@]}" -o publish_ava "$_pkgsrc/src/Ryujinx"

  echo "Shutting down dotnet build server in background."
  (timeout -k 45 30 dotnet build-server shutdown) > /dev/null 2>&1 &
)

package() {
  # program
  install -dm755 "$pkgdir/$_install_path/ryujinx"
  cp -a --update=none --reflink=auto publish_ava/* "$pkgdir/$_install_path/ryujinx/"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/$_install_path/ryujinx/Ryujinx" "$pkgdir/usr/bin/ryujinx"

  # .desktop
  install -Dm644 "$_pkgsrc"/distribution/linux/Ryujinx.desktop "$pkgdir/usr/share/applications/ryujinx.desktop"

  # icon
  install -Dm644 "$_pkgsrc"/distribution/misc/Logo.svg "$pkgdir/usr/share/pixmaps/ryujinx.svg"

  # mimetype
  install -Dm644 "$_pkgsrc"/distribution/linux/mime/Ryujinx.xml "$pkgdir/usr/share/mime/packages/ryujinx.xml"

  # license
  install -Dm644 "$_pkgsrc"/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fix permissions
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/$_install_path/ryujinx/Ryujinx"
  chmod 755 "$pkgdir/$_install_path/ryujinx/Ryujinx.sh"

  # fix desktop file
  desktop-file-edit --set-key="Exec" --set-value="ryujinx %f" "$pkgdir/usr/share/applications/ryujinx.desktop"
  desktop-file-edit --set-icon="ryujinx" "$pkgdir/usr/share/applications/ryujinx.desktop"
}
