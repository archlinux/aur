# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=artemisrgb-git
pkgver=1.2023.1130.0
pkgrel=1
url="https://artemis-rgb.com/"
pkgdesc="A universal RGB control software"
arch=("x86_64")
provides=("artemisrgb")
conflicts=("artemisrgb")
license=("custom:PolyForm Noncommercial License 1.0.0")
depends=("dotnet-runtime" "hicolor-icon-theme" "glibc" "bash" "zlib" "fontconfig" "gcc-libs")
makedepends=("dotnet-sdk" "git" "zip")
options=("staticlibs")
source=("git+https://github.com/Artemis-RGB/Artemis"
		"git+https://github.com/Artemis-RGB/Artemis.Plugins"
		"artemis.desktop"
		"artemis.png"
		"disable-update.patch")
sha256sums=('SKIP'
            'SKIP'
            '1f29c3b3794b0c3a527c61dfcb99402f187187218c880c71d216a1eed2a1c4d9'
            '35fbb5e33591ba6f845b7d852b3b32d8bca81f55ecd3bb4bf94814aecf0d0b7f'
            'de0f3769d528303ac57618b285d0472f3fc0d30f57dcb82f5e28990a12d6515d')

_nowarn="/nowarn:cs1591,cs8602,cs8604,cs8618,cs8622,cs8601,cs8603,cs0618,cs8605,cs0169"
pkgver() {
	cd "$srcdir/Artemis"
	CoreProjFile="$(find "src" -type f -name "Artemis.Core.csproj")"
	ApiVersion="$(grep -o -P '(?<=<PluginApiVersion>).*(?=</PluginApiVersion>)' "$CoreProjFile")"

    BuildDate="$(date --utc +"%Y-%m-%d")"
    NumberOfCommitsToday="$(git rev-list --count --after="$BuildDate 00:00" --before="$BuildDate 00:00" HEAD)"
    printf '%s' "$ApiVersion.$(date +"%Y.%m%d").$NumberOfCommitsToday"
}

prepare() {
  cd "$srcdir/Artemis"
  patch -p1 -i "$srcdir/disable-update.patch"
}

build() {
  dotnet publish --configuration Release --runtime linux-x64 -p:Version="$pkgver" --output build --self-contained ${_nowarn} "$srcdir/Artemis/src/Artemis.UI.Linux/Artemis.UI.Linux.csproj"
  mkdir -p "$srcdir/build/Plugins"
  for PluginProjFile in $(find "$srcdir/Artemis.Plugins/src" -type f -name "*.csproj"); do
	# Build each of the found project files.
    Name=$(basename -s .csproj "$PluginProjFile")
    echo "Building Plugin $Name"
    dotnet publish --configuration Release --runtime linux-x64 --output "$srcdir/build-plugins/$Name" --no-self-contained "$PluginProjFile";
    # Zip the output and place it inside of the staging directory for app deployment
    pushd "$srcdir/build-plugins/$Name"
	# echo $(pwd)
        zip -r "$Name.zip" .
    popd
    mv "$srcdir/build-plugins/$Name/$Name.zip" "$srcdir/build/Plugins/$Name.zip"
  done
}

package() { 
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/share/"
  cp -r --preserve=mode,timestamps "$srcdir/build/" "$pkgdir/opt/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/Artemis.UI.Linux" "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm644 "$srcdir/Artemis/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

   # Icon for .desktop
  install -Dm644 "${srcdir}/artemis.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  # .desktop
  install -Dm644 "${srcdir}/artemis.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}
