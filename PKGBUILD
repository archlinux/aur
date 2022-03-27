# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=ryujinx-ava
pkgver=1.1.85
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C# with AvaloniaUI & prime fixes"
arch=(x86_64)
url="https://github.com/emmauss/Ryujinx"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('git' 'dotnet-sdk' 'python' 'jq')
conflicts=('ryujinx-git' 'ryujinx-ldn-bin'  'ryujinx-cn-git' 'ryujinx-cn')
provides=(Ryujinx)
install=ryujinx.install
source=(
	"git+${url}#branch=avalonia"
	"ryujinx.install"
	"ryujinx.desktop"
	"ryujinx.png")
md5sums=(
	'SKIP'
	'2a3637d0d4e7678473a9bd87f6acc8aa'
	'cae4fe3e16763affedd41c3ef9d36992'
	'30138087aab7dcec30bdc4739617f000')
options=(!strip)

pkgver() {
    cd "${srcdir}/Ryujinx"
    pkgver=$(curl -H "Authorization: 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" "https://api.github.com/repos/Ryujinx/release-channel-master/releases/latest" | jq -r .tag_name)
    echo $pkgver
    short_hash=$(git rev-parse --short "$(git log -n1 --format=format:"%H")")
    sed -r --in-place "s/\%\%RYUJINX_BUILD_VERSION\%\%/${pkgver}-dirty/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
    sed -r --in-place "s/\%\%RYUJINX_BUILD_GIT_HASH\%\%/${short_hash}/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
    sed -r --in-place "s/\%\%RYUJINX_TARGET_RELEASE_CHANNEL_NAME\%\%/master/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
    sed -r --in-place "s/\%\%RYUJINX_TARGET_RELEASE_CHANNEL_OWNER\%\%/Ryujinx/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
    sed -r --in-place "s/\%\%RYUJINX_TARGET_RELEASE_CHANNEL_REPO\%\%/release-channel-master/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
}

build() {
	cd "${srcdir}/Ryujinx"
	dotnet publish -c Release -r linux-x64 /p:DebugType=embedded /p:Version="${pkgver}" /p:SourceRevisionId="${short_hash}" /p:ExtraDefineConstants=DISABLE_UPDATER Ryujinx.Ava  --self-contained
}

package() {
	mkdir -p "${pkgdir}/opt/ryujinx/"
	mkdir -p -m 777 "${pkgdir}/opt/ryujinx/Logs"
	mkdir -p "${pkgdir}/usr/bin/"

	install -D ryujinx.desktop "${pkgdir}/usr/share/applications/ryujinx.desktop"
	install -D ryujinx.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ryujinx.png"

	cp -R ${srcdir}/Ryujinx/Ryujinx.Ava/bin/Release/net6.0/linux-x64/publish/* "${pkgdir}/opt/ryujinx/"
	ln -s "/opt/ryujinx/Ryujinx.Ava" "${pkgdir}/usr/bin/ryujinx"
}
