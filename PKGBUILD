# Maintainer: Damglador <damglador@gmail.com>

pkgname=uabea
_pkgname=uabea

pkgver=8
pkgrel=1
arch=('x86_64')
_dotnetver="6.0"

pkgdesc="C# UABE for newer versions of Unity engine"
url="https://github.com/nesrak1/UABEA"
license=("MIT")

depends=("dotnet-runtime-$_dotnetver")
makedepends=("git" "dotnet-sdk-$_dotnetver")
provides=("$_pkgname")
options=("!strip" "!debug")

source=(
	"${_pkgname}::git+${url}#tag=v${pkgver}"
	"${_pkgname}.desktop"
	"0001-Fix-config-path.patch"
    )
sha256sums=(
	"fb09aeb5de361a9796c898ce9006293c4d155a2f85d651da1f2b6daefc9ab172"
	"7afa3e87b1a41aed1f0faea890f436183f9b7edf70482ae847ab0c3adb889537"
	"397e0ca90127963c7097b7084bbd9cc94c7ccaf68c5c05b57403921f5f9d0011"
	)

prepare(){
    cd "$_pkgname"
    git apply ../*.patch
}

build(){
    cd "$_pkgname"
    dotnet sln UABEAvalonia.sln remove TexToolWrap/TexToolWrap.vcxproj
    dotnet restore
    dotnet build --configuration Release --no-restore
    cp UABEAvalonia/bin/Release/net$_dotnetver/runtimes/linux/native/libonigwrap.so UABEAvalonia/bin/Release/net$_dotnetver/runtimes/linux-x64/native/libonigwrap.so
    find UABEAvalonia/bin/Release/net$_dotnetver/runtimes/* -maxdepth 0 ! -name linux-x64 -type d -exec rm -r {} +
}

package(){
    # Install program files
    install -d "$pkgdir/opt/"
	cp -r --preserve=mode "$pkgname/UABEAvalonia/bin/Release/net$_dotnetver" "$pkgdir/opt/$_pkgname"
	# Symlink binary
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${_pkgname}/UABEAvalonia" "$pkgdir/usr/bin/${_pkgname}"
	# Install destkop file
	install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	# Install icons
	install -Dm644 "$pkgname/UABEAvalonia/Assets/uabeavalonia16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"
	install -Dm644 "$pkgname/UABEAvalonia/Assets/uabeavalonia24.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/$_pkgname.png"
	install -Dm644 "$pkgname/UABEAvalonia/Assets/uabeavalonia32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
	install -Dm644 "$pkgname/UABEAvalonia/Assets/uabeavalonia64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"
}
