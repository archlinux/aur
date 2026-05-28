# Maintainer: schuay <jakob@linke.cx>
#
# Based on the ryujinx-git PKGBUILD by username227 <gfrank227@gmail.com>,
# HurricanePootis <hurricanepootis@protonmail.com>, and Marco Rubin
# <marco.rubin@protonmail.com>.
#
# ryujinx-git with a curated patch series. Patches live as text files in the
# AUR package directory; the upstream source is fetched unmodified and patches
# are applied in prepare(). See the patch file headers for individual rationale.

: ${_install_path:=usr/lib}

_pkgname="ryujinx"
pkgname="$_pkgname-git-patched"
pkgver=r0.fa72b5a
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C# (Ryubing, with curated patches)"
url="https://ryujinx.app"
license=('MIT')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-bin")

depends=(
  'alsa-lib'
  'fontconfig'
  'jack'
  'libpulse'
  'libx11'
  'wayland'
)
makedepends=(
  'desktop-file-utils'
  'dotnet-sdk'
  'git'
)

options=('!strip' '!debug')

_patches=(
  '0001-Fix-NRE-in-Vulkan-TextureArray-ImageArray-for-buffer.patch'
  '0002-Suppress-Invalid-texture-format-log-spam-from-uninit.patch'
  '0003-Skip-iteration-past-the-populated-range-of-texture-p.patch'
  '0004-Drop-duplicate-AddShortCache-entries-instead-of-thro.patch'
  '0005-Auto-dismiss-ControllerAppletDialog-when-validation-.patch'
)

_pkgsrc="ryujinx"
_upstream="https://git.ryujinx.app/ryubing/ryujinx"

# Patches only; the upstream repo is cloned shallow in prepare() because
# makepkg's git source handler does a full --mirror clone with no depth
# control (see /usr/share/makepkg/source/git.sh).
source=("${_patches[@]}")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

_fetch_ryujinx() {
  local dest="$srcdir/$_pkgsrc"
  if [ -d "$dest/.git" ] && [ -e "$dest/.git/shallow" ]; then
    git -C "$dest" fetch --depth=1 origin master
    git -C "$dest" reset --hard FETCH_HEAD
  else
    rm -rf "$dest"
    git clone --depth=1 --single-branch "$_upstream" "$dest"
  fi
}

prepare() {
  _fetch_ryujinx
  cd "$srcdir/$_pkgsrc"
  for _patch in "${_patches[@]}"; do
    echo "Applying $_patch"
    git apply -p1 "$srcdir/$_patch"
  done
}

pkgver() {
  cd "$srcdir/$_pkgsrc"
  # Shallow clone, so rev-list --count is meaningless; use just the short sha.
  # The patches in prepare() apply without committing, so HEAD is upstream master.
  printf "r0.%s" "$(git rev-parse --short HEAD)"
}

build() (
  export HOME="$SRCDEST/nuget-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_CLI_HOME=${HOME}

  local _runtime="linux-x64"
  local _args=(
    -c Release
    -r "$_runtime"
    --disable-build-servers
    --nologo
    --self-contained true
    -p:ExtraDefineConstants=DISABLE_UPDATER
    -p:PublishSingleFile=true
    -p:TrimmerSingleWarn=true
    -p:Version="1.0.0-canary.${pkgver#r0.}"
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
  chmod 755 "$pkgdir/$_install_path/$_pkgname/Ryujinx"
  chmod 755 "$pkgdir/$_install_path/$_pkgname/Ryujinx.sh"

  # fix desktop file
  desktop-file-edit --set-key="Exec" --set-value="ryujinx %f" "$pkgdir/usr/share/applications/ryujinx.desktop"
  desktop-file-edit --set-icon="ryujinx" "$pkgdir/usr/share/applications/ryujinx.desktop"
}
