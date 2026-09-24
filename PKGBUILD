# Maintainer: KenwoodFox <joe@kitsunehosting.net>

pkgname=borea-git
pkgver=0.2.1.r98.gf2e7e12
pkgrel=1
pkgdesc="Content manager for Kitten Space Agency"
arch=('x86_64')
url="https://github.com/KSAModding/Borea"
license=('MIT')
depends=(
  'fontconfig'
  'icu'
  'libice'
  'libsm'
  'libx11'
  'openssl'
  'zlib'
)
makedepends=(
  'dotnet-sdk-10.0'
  'git'
  'python'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip' '!debug')
source=("git+https://github.com/KSAModding/Borea.git"
        "borea.desktop")
sha256sums=('SKIP'
            'c099ce257878862a6bc1ee2b2130da9dacdf1cb9b18b91321fa9a4ee27505fb5')

pkgver() {
  cd Borea
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd Borea

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  export NUGET_PACKAGES="${srcdir}/nuget"
  # global.json pins SDK 10.0.401 and wouldn't roll back arch native
  rm -f global.json
  export DOTNET_CLI_HOME="${srcdir}/dotnet-home"

  local version rid=linux-x64
  version="$(git describe --tags --abbrev=0 | sed 's/^v//')"

  # Restore every RuntimeIdentifier in the lock file
  dotnet restore src/Borea.App/Borea.App.csproj \
    --locked-mode \
    -p:Configuration=Release \
    -p:Version="$version" \
    -p:InformationalVersion="$pkgver"

  dotnet publish src/Borea.App/Borea.App.csproj \
    --configuration Release \
    --runtime "$rid" \
    --self-contained true \
    --no-restore \
    -p:Version="$version" \
    -p:InformationalVersion="$pkgver" \
    --output "${srcdir}/publish"

  local app_obj packages
  app_obj="$(dotnet msbuild src/Borea.App/Borea.App.csproj \
    -getProperty:IntermediateOutputPath \
    -p:Configuration=Release \
    -p:RuntimeIdentifier="$rid")"
  app_obj="${app_obj//\\//}"
  packages="$(dotnet nuget locals global-packages --list --force-english-output)"
  packages="${packages##*global-packages: }"

  dotnet tool restore
  dotnet CycloneDX src/Borea.App/Borea.App.csproj \
    --output "${srcdir}/sbom" \
    --filename "Borea.cdx.json" \
    --output-format Json \
    --set-name Borea \
    --set-version "$version" \
    --set-type Application \
    --exclude-dev \
    --disable-package-restore

  python .github/scripts/write_third_party_notices.py \
    --sbom "${srcdir}/sbom/Borea.cdx.json" \
    --packages "$packages" \
    --deps "src/Borea.App/${app_obj}Borea.App.deps.json" \
    --config .github/notices/notices.json \
    --product App \
    --version "$version" \
    --output "${srcdir}/publish/THIRD-PARTY-NOTICES.txt"
}

package() {
  install -Dm755 "${srcdir}/publish/borea" "${pkgdir}/usr/lib/borea/borea"
  install -Dm644 "${srcdir}/publish/THIRD-PARTY-NOTICES.txt" \
    "${pkgdir}/usr/lib/borea/THIRD-PARTY-NOTICES.txt"
  printf '%s\n' pacman > "${pkgdir}/usr/lib/borea/borea-package.txt"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/borea/borea "${pkgdir}/usr/bin/borea"

  install -Dm644 Borea/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 Borea/assets/borea.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/borea.png"
  # The App writes its own NoDisplay borea.desktop for borea:// links. A different
  # file id keeps this launcher in the menu.
  install -Dm644 borea.desktop \
    "${pkgdir}/usr/share/applications/io.github.ksamodding.borea.desktop"
}
