# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=Ryujinx
pkgname=ryujinx
pkgver=1.1.458
_commit=459c4caebac0bc16c04467d9dcd2ef7a9fc0bd92
pkgrel=2
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk' 'git' 'html2text')
provides=($_name)
conflicts=($_name)
options=(!strip)
source=("git+$url#commit=$_commit"
		"$url/wiki/Changelog")
b2sums=('SKIP'
        'SKIP')

pkgver() {
	cd $_name
	_commit_msg=$(git log -1 --pretty=%B | awk '{$NF=""}1') # remove PR number in parentheses
	html2text ../Changelog | grep -B 4 "${_commit_msg::length - 1}" | head -n 1 | awk '{print $2}'
}

build() {
	cd $_name
	_args="-c Release                           \
		--nologo                                \
		-p:DebugType=embedded                   \
		-p:ExtraDefineConstants=DISABLE_UPDATER \
		-p:Version=$pkgver                      \
		-r linux-x64                            \
		--self-contained true"
	dotnet publish $_args Ryujinx
	dotnet publish $_args Ryujinx.Ava
}

package() {
	cd $_name

	install -Dm644 -t "$pkgdir/opt/ryujinx/" Ryujinx/bin/Release/net7.0/linux-x64/publish/*
	install -Dm644 -t "$pkgdir/opt/ryujinx/" Ryujinx.Ava/bin/Release/net7.0/linux-x64/publish/*
	chmod 755 "$pkgdir/opt/ryujinx/Ryujinx"
	chmod 755 "$pkgdir/opt/ryujinx/Ryujinx.Ava"

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/ryujinx/Ryujinx"     "$pkgdir/usr/bin/Ryujinx"
	ln -s "/opt/ryujinx/Ryujinx.Ava" "$pkgdir/usr/bin/Ryujinx.Ava"

	install -Dm644 distribution/linux/ryujinx.desktop  "$pkgdir/usr/share/applications/ryujinx.desktop"
	install -Dm644 distribution/linux/ryujinx-logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ryujinx.svg"
	install -Dm644 distribution/linux/ryujinx-mime.xml "$pkgdir/usr/share/mime/packages/ryujinx-mime.xml"

	install -dm777 "$pkgdir/opt/ryujinx/Logs" # create writable logs directory
}
