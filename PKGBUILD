# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=artemisrgb-git
pkgver=1.2026.0101.2913
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
            '9ee8184f5794a687e64cc092f6c20eb4063f0ee79366460aec2dc096df8d8fe8'
            '35fbb5e33591ba6f845b7d852b3b32d8bca81f55ecd3bb4bf94814aecf0d0b7f'
            '8cef43259279f1f79e8ecab894c3bcd68698f094a9acbf548f3b20d03c2a5455')

_nowarn="/nowarn:cs1591,cs8602,cs8604,cs8618,cs8622,cs8601,cs8603,cs0618,cs8605,cs0169"
pkgver() {
	cd "$srcdir/Artemis"
	local date rev
	date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
	rev="$(git rev-list --count HEAD)"
	printf '1.%s.%s.%s' "${date:0:4}" "${date:4:4}" "$rev"
}

prepare() {
  cd "$srcdir/Artemis"
  patch -p1 -i "$srcdir/disable-update.patch"
}

build() {
  local infover
  pushd "$srcdir/Artemis" >/dev/null
  BuildDate="$(date --utc +"%Y-%m-%d")"
  NumberOfCommitsToday="$(git rev-list --count --after="$BuildDate 00:00" --before="$BuildDate 00:00" HEAD)"
  if [[ "$NumberOfCommitsToday" -eq 0 ]]; then
    infover="1.$(date --utc +"%Y.%m%d")"
  else
    infover="1.$(date --utc +"%Y.%m%d").$NumberOfCommitsToday"
  fi
  popd >/dev/null
  dotnet publish --configuration Release --runtime linux-x64 -p:Version="$pkgver" -p:InformationalVersion="$infover" --output build --self-contained ${_nowarn} "$srcdir/Artemis/src/Artemis.UI.Linux/Artemis.UI.Linux.csproj"
  mkdir -p "$srcdir/build/Plugins"
  for PluginProjFile in $(find "$srcdir/Artemis.Plugins/src" -type f -name "*.csproj"); do
	# Build each of the found project files.
    Name=$(basename -s .csproj "$PluginProjFile")
    echo "Building Plugin $Name"
    dotnet publish --configuration Release --runtime linux-x64 -p:Version="$pkgver" -p:InformationalVersion="$infover" --output "$srcdir/build-plugins/$Name" --no-self-contained "$PluginProjFile";
    # Copy the plugin directory into the staging directory for app deployment
    rm -rf "$srcdir/build/Plugins/$Name"
    mkdir -p "$srcdir/build/Plugins/$Name"
    cp -a "$srcdir/build-plugins/$Name/." "$srcdir/build/Plugins/$Name/"
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
  install -Dm644 "${srcdir}/artemis.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"

  # .desktop
  install -Dm644 "${srcdir}/artemis.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}
