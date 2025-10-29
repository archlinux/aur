# Maintainer: Damglador <damglador@gmail.com>

pkgname=ue4localizationstool-zenity
_pkgname=ue4localizationstool

pkgver=2.7
pkgrel=2
arch=('any')

pkgdesc="Simple tool to edit Unreal Engine 4 text files (patched to use native filepicker)"
url="https://github.com/amrshaheen61/UE4LocalizationsTool"
license=("MIT")

depends=("mono" "zenity")
makedepends=("git" "mono-msbuild" "nuget")
provides=("$_pkgname")
options=("!strip" "!debug")

source=(
	"git+${url}.git#tag=v${pkgver}"
	"${_pkgname}.desktop"
	"${_pkgname}.sh"
	"0001-Use-zenity-for-file-dialogs.patch"
	"0002-Fix-console-usage.patch"
	)
sha256sums=('80f64c65c346ae577a7329f7ddf30a417ed67ea9e24923a5cad896a07aa87056'
            '648b7b6aaacb9bc966e830098f177c3ae6cc4dfdc327d9f50a78e3bb6c4d1ab7'
            '37bde904ad38840bd1f500d6dcef84eea8526db683b2895c910ed294c6fc144c'
            'be7c9a25534eefd9dc80b9a2928d296395759a21ca8552b332429a7e88f79271'
            '678d1b77ee44fe43e47ac5911cd76c1ed1575aae5fe4eca94953d03339472b9a')

build() {
    cd UE4LocalizationsTool
    git apply ../*.patch
    nuget restore UE4localizationsTool.sln
    MSBUILD="/usr/lib/mono/msbuild/Current/bin/MSBuild.dll"
    mono \
        "$MSBUILD" \
        UE4localizationsTool/UE4localizationsTool.csproj \
        /p:Configuration=Release
}

package() {
	install -d "$pkgdir/usr/lib/${_pkgname}"

	install -m644 "UE4LocalizationsTool/UE4localizationsTool/bin/Release/Csv.dll" \
	    -t "$pkgdir/usr/lib/${_pkgname}"
	install -m644 "UE4LocalizationsTool/UE4localizationsTool/bin/Release/UE4localizationsTool.exe" \
	    -t "$pkgdir/usr/lib/${_pkgname}"
	install -Dm755 ${_pkgname}.sh "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "UE4LocalizationsTool/LICENSE" -t "$pkgdir/usr/share/licenses/${_pkgname}"
}
