# Maintainer: Ross <git [at] ross [dot] ch>

pkgname=nexusmods-app-git
_pkgname=nexusmods-app
pkgver=r8711.e6b99cf
pkgrel=1
_fullver=${pkgver}-${pkgrel}
pkgdesc="A mod installer, creator and manager for all your popular games."
arch=('x86_64')
url="https://github.com/Nexus-Mods/NexusMods.App"
license=('GPL-3.0-or-later')
depends=('xdg-utils' 'desktop-file-utils' 'fontconfig' 'hicolor-icon-theme' 'dotnet-runtime-9.0')
makedepends=(
  'desktop-file-utils'
  'dotnet-sdk-9.0'
  'git'
  'git-lfs'
)
optdepends=('xdg-desktop-portal-dde: Deepin'
  'xdg-desktop-portal-gnome: GNOME'
  'xdg-desktop-portal-gtk: Generic Desktop'
  'xdg-desktop-portal-kde: KDE Plasma'
  'xdg-desktop-portal-liri-git: Liri'
  'xdg-desktop-portal-td: theDesk'
  'xdg-desktop-portal-cosmic: Cosmic'
  'xdg-desktop-portal-hyprland: Hyprland'
  'xdg-desktop-portal-lxqt: LXQT'
  'xdg-desktop-portal-wlr: WLRoots')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
_source="https://github.com/Nexus-Mods/NexusMods.App.git"

prepare() {
  git lfs install --local

  if [ -d "$_pkgname" ]; then
    cd "$_pkgname"
    git pull
    git submodule update --init --recursive
  else
    git clone --recurse-submodules "$_source" "$_pkgname"
  fi

  sed -i 's^${INSTALL_EXEC}^/opt/nexusmods-app/NexusMods.App^g' "$srcdir/$_pkgname/src/NexusMods.App/com.nexusmods.app.desktop"
}

build() (
  cd "$srcdir/$_pkgname"
  export HOME="$SRCDEST/nuget-home"
  export DOTNET_CLI_HOME="$SRCDEST/dotnet-home"

  # Dotnet requires a version string starting with a number, so trim the leading 'r' and replace '.' with '-'
  _dotnetver=$(echo "$pkgver" | sed 's/^r//;s/\./-/g')

  local _args=(
    -c Release
    -o build
    -p:DefineConstants="INSTALLATION_METHOD_PACKAGE_MANAGER"
    -p:Version=${_dotnetver}
    -p:TieredCompilation=true
    -p:PublishReadyToRun=true
    --no-self-contained
  )
  dotnet publish "${_args[@]}" "$srcdir/$_pkgname/src/NexusMods.App/"

  echo "Shutting down dotnet build server in background."
  (timeout -k 45 30 dotnet build-server shutdown) >/dev/null 2>&1 &
)

package() {
  # bin
  install -dm755 "${pkgdir}/opt"
  cp -a "$srcdir/$_pkgname/build" "${pkgdir}/opt/nexusmods-app"

  # desktop
  install -Dm644 "$srcdir/$_pkgname/src/NexusMods.App/com.nexusmods.app.desktop" "${pkgdir}/usr/share/applications/com.nexusmods.app.desktop"
  install -Dm644 "$srcdir/$_pkgname/src/NexusMods.App/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.nexusmods.app.svg"

  # symlinks
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/nexusmods-app/NexusMods.App" "${pkgdir}/usr/bin/nexusmods-app"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
