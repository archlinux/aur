# Maintainer:
pkgname=pudu-launcher-git
pkgver=r12.d57587d
pkgrel=2
pkgdesc="Alternative game launcher for Unitystation"
arch=('x86_64')
url="https://github.com/corp-0/PuduLauncher"
license=('MIT')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  'clang'
  'dotnet-sdk-10.0'
  'git'
  'libappindicator-gtk3'
  'librsvg'
  'nodejs'
  'npm'
  'patchelf'
  'rust'
  'zlib'
)
install=pudu-launcher.install
provides=('pudu-launcher')
conflicts=('pudu-launcher')
options=(!lto)  # ring crate's assembly objects break with Arch's system-wide -flto
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd PuduLauncher
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd PuduLauncher
  git submodule update --init --recursive
  # `generate-ts` runs `dotnet build -c Debug`; keep AOT/trim for release publish only.
  sed -i "s|<PublishAot>true</PublishAot>|<PublishAot Condition=\"'\\\$(Configuration)' == 'Release'\">true</PublishAot>|" src-dotnet/PuduLauncher/PuduLauncher.csproj
  sed -i "s|<PublishTrimmed>true</PublishTrimmed>|<PublishTrimmed Condition=\"'\\\$(Configuration)' == 'Release'\">true</PublishTrimmed>|" src-dotnet/PuduLauncher/PuduLauncher.csproj
  # Disable signed updater artifacts - AUR users don't have the private key
  sed -i 's/"createUpdaterArtifacts": true/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json
  npm ci
}

build() {
  cd PuduLauncher
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  export AllowMissingPrunePackageData=true
  npx tauri build -b deb || true  # signing error is expected (no TAURI_SIGNING_PRIVATE_KEY); deb is already built
}

package() {
  cd "${srcdir}/PuduLauncher/src-tauri/target/release/bundle/deb"
  cp -a pudu-launcher_*/data/usr "${pkgdir}/"
}
