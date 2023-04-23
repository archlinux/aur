# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=Ryujinx
pkgname=ryujinx
pkgver=1.1.726
_commit=8d9d508dc78eb5225c99cb425fa484999f3c4305
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=('dotnet-runtime-bin')
makedepends=('dotnet-sdk-bin' 'git')
conflicts=(ryujinx-git)
options=(!strip)
source=("git+$url#commit=$_commit")
b2sums=('SKIP')

# pkgver() {
# 	cd $_name
# 	# changelog is $url/wiki/Changelog, needs python-html2text
# 	_commit_msg=$(git log -1 --pretty=%B | awk '{$NF=""}1') # remove PR number in parentheses
# 	html2text ../Changelog | grep -B 4 "${_commit_msg::length - 1}" | head -n 1 | awk '{print $2}'
# }

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

	mkdir -p $pkgdir/opt/ryujinx
	cp -R Ryujinx/bin/Release/net7.0/linux-x64/publish/*     "$pkgdir/opt/ryujinx/"
	cp -R Ryujinx.Ava/bin/Release/net7.0/linux-x64/publish/* "$pkgdir/opt/ryujinx/"
	chmod 755 "$pkgdir/opt/ryujinx/Ryujinx"
	chmod 755 "$pkgdir/opt/ryujinx/Ryujinx.Ava"

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/ryujinx/Ryujinx"     "$pkgdir/usr/bin/Ryujinx"
	ln -s "/opt/ryujinx/Ryujinx.Ava" "$pkgdir/usr/bin/Ryujinx.Ava"

	install -Dm644 distribution/linux/Ryujinx.desktop  "$pkgdir/usr/share/applications/ryujinx.desktop"
	install -Dm644 distribution/misc/Logo.svg          "$pkgdir/usr/share/icons/hicolor/scalable/apps/ryujinx.svg"
	install -Dm644 distribution/linux/mime/Ryujinx.xml "$pkgdir/usr/share/mime/packages/ryujinx.xml"

	install -dm777 "$pkgdir/opt/ryujinx/Logs" # create writable logs directory
}
