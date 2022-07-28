# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=ryujinx-ava
pkgver=1.1.194
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C# with new AvaloniaUI"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=('dotnet-runtime-bin')
makedepends=('curl' 'git' 'dotnet-sdk-bin' 'jq')
conflicts=('ryujinx-git' 'ryujinx-ldn-bin'  'ryujinx-cn-git' 'ryujinx-cn')
provides=(Ryujinx)
install=ryujinx.install
source=(
	"git+${url}"
	"ryujinx.desktop"
	"ryujinx.png")
md5sums=(
	'SKIP'
	'1904390e155a0029122fe51252d9494d'
	'30138087aab7dcec30bdc4739617f000')
options=(!strip)

prepare() {
    short_hash=$(git rev-parse --short "$(git log -n1 --format=format:"%H")")
    sed -r --in-place "s/\%\%RYUJINX_BUILD_VERSION\%\%/${pkgver}-dirty/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
    sed -r --in-place "s/\%\%RYUJINX_BUILD_GIT_HASH\%\%/${short_hash}/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
    sed -r --in-place "s/\%\%RYUJINX_TARGET_RELEASE_CHANNEL_NAME\%\%/master/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
    sed -r --in-place "s/\%\%RYUJINX_TARGET_RELEASE_CHANNEL_OWNER\%\%/Ryujinx/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
    sed -r --in-place "s/\%\%RYUJINX_TARGET_RELEASE_CHANNEL_REPO\%\%/release-channel-master/g;" "${srcdir}/Ryujinx/Ryujinx.Common/ReleaseInformations.cs"
}

pkgver() {
    cd "${srcdir}/Ryujinx"
    curl "https://api.github.com/repos/Ryujinx/release-channel-master/releases/latest" | jq -r .tag_name
}

build() {
	cd "${srcdir}/Ryujinx"
	#dotnet clean
	#dotnet nuget locals all --clear
	#dotnet build -c Release /p:Version="${pkgver}" /p:SourceRevisionId="${short_hash}" /p:ExtraDefineConstants=DISABLE_UPDATER
	#dotnet test -c Release
	dotnet publish -c Release -r linux-x64 -o ./publish_ava /p:Version="${pkgver}" /p:DebugType=embedded /p:SourceRevisionId="${short_hash}" /p:ExtraDefineConstants=DISABLE_UPDATER Ryujinx.Ava
}

package() {
	mkdir -p "${pkgdir}/opt/ryujinx/"
	mkdir -p -m 777 "${pkgdir}/opt/ryujinx/Logs"
	mkdir -p "${pkgdir}/usr/bin/"

	install -D ryujinx.desktop "${pkgdir}/usr/share/applications/ryujinx.desktop"
	install -D ryujinx.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ryujinx.png"

	cp -R "${srcdir}/Ryujinx/publish_ava/"* "${pkgdir}/opt/ryujinx/"
	chmod +x "${pkgdir}/opt/ryujinx/Ryujinx.Ava"
	ln -s "/opt/ryujinx/Ryujinx.Ava" "${pkgdir}/usr/bin/ryujinx"
}
