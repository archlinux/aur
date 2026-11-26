# Maintainer: Aererus

pkgname=lancommander-launcher-git
_pkgname=lancommander-launcher
_repo=LANCommander
pkgver=2.2.1.r2.gc5ff9ce
pkgrel=1
pkgdesc='Desktop launcher for LANCommander, a self-hosted game distribution platform (latest git main)'
arch=('x86_64')
url='https://lancommander.app'
license=('MIT')
depends=(
  'dotnet-runtime-10.0'
  'fontconfig'
  'hicolor-icon-theme'
  'libice'
  'libsm'
  'libvlc'
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
  'vlc-plugins-base'
)
makedepends=('dotnet-sdk-10.0' 'git')
optdepends=(
  'vlc-plugin-ffmpeg: H.264/AAC game trailers and video covers'
  'vlc-plugin-dav1d: AV1 game trailers'
  'vlc-plugin-vpx: VP8/VP9 game trailers'
  'xdg-utils: open install folders and links from the launcher'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=(
  "git+https://github.com/LANCommander/LANCommander.git#branch=main"
  'package-managed-install.patch'
  'lancommander-launcher.sh'
  'lancommander-launcher.desktop'
)
sha256sums=('SKIP'
            'f9599f39c8e046f2e8790fa44c29b00391aad6bb889a231948e01d79b7df11a5'
            '381f49f47548421c814952a4a4492719fa28bdf06ca2ecf480738778eb1501f3'
            '6a0c101286f425af23c34b4bf5837d26177b84972d81b1fb3083ed674ef28445')

pkgver() {
  cd "${_repo}"
  # v2.2.1-2-gc5ff9ce -> 2.2.1.r2.gc5ff9ce ; v2.3.0-rc.1-5-gabc1234 -> 2.3.0.rc.1.r5.gabc1234
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_repo}"
  # Pacman owns /usr/lib/lancommander-launcher: turn off the in-app updater, and stop the launcher
  # writing a per-user lancommander:// handler that would bypass the wrapper (and its data dir).
  # If upstream reworks these files the patch fails here, loudly, instead of shipping without it.
  patch -Np1 -i "${srcdir}/package-managed-install.patch"
}

build() {
  cd "${_repo}"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  # Kept beside the PKGBUILD, not in $srcdir: paru wipes $srcdir before every devel rebuild,
  # and the restore is ~2.6 GB. Delete nuget-cache/ any time to reclaim space.
  export NUGET_PACKAGES="${startdir}/nuget-cache"

  local _rid=linux-x64

  # Version from the nearest release tag, as upstream CI does; .NET appends +<commit> itself.
  local _tag _ver _num
  _tag=$(git describe --tags --abbrev=0 --match 'v[0-9]*')
  _ver=${_tag#v}
  _num=${_ver%%-*}

  rm -rf "${srcdir}/publish"
  dotnet publish LANCommander.Launcher/LANCommander.Launcher.csproj \
    --configuration Release \
    --runtime "${_rid}" \
    --no-self-contained \
    --output "${srcdir}/publish" \
    -p:Version="${_ver}" \
    -p:AssemblyVersion="${_num}.0" \
    -p:FileVersion="${_num}.0" \
    -p:InformationalVersion="${_ver}" \
    -p:BuildPackagingWorkers=false \
    -p:DebugType=none \
    -p:ContinuousIntegrationBuild=true
}

package() {
  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a --no-preserve=ownership "${srcdir}/publish/." "${pkgdir}/usr/lib/${_pkgname}/"
  chmod 755 "${pkgdir}/usr/lib/${_pkgname}/LANCommander.Launcher"

  install -Dm755 "${srcdir}/lancommander-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/lancommander-launcher.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_repo}/LANCommander.Launcher/Assets/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_repo}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_repo}/THIRD-PARTY-NOTICES.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.md"
}
