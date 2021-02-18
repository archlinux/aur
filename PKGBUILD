# Maintainer: DuckSoft <realducksoft@gmail.com>
# Maintainer: database64128 <free122448@hotmail.com>

pkgbase=shadowsocks-uri-generator-git
pkgname=(ss-uri-gen-git ss-uri-gen-chatbot-telegram-git)
pkgver=20210218.r83.b0d6a43
pkgrel=1
arch=(x86_64)
url="https://github.com/database64128/shadowsocks-uri-generator"
license=('GPL3')
makedepends=('git' 'dotnet-sdk>=5.0')
source=("$pkgbase::git+$url")
options=(!strip)
b2sums=(SKIP)

pkgver() {
	cd $srcdir/$pkgbase
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.r${count}.$commit"
}

build() {
    _build ShadowsocksUriGenerator
    _build ShadowsocksUriGenerator.Chatbot.Telegram
}

_build() {
	pushd $pkgbase
	dotnet publish $1 -c Release \
		-p:DefineConstants=PACKAGED \
		-p:PublishSingleFile=true \
		-p:PublishTrimmed=true \
		-p:TrimMode=link \
		-p:DebuggerSupport=false \
		-p:EnableUnsafeBinaryFormatterSerialization=false \
		-p:EnableUnsafeUTF7Encoding=false \
		-p:InvariantGlobalization=true \
		-r linux-x64 --self-contained
	popd
}

package_ss-uri-gen-git() {
	pkgdesc="CLI for multi-user Shadowsocks SIP003, SIP008 and Outline server deployment and management"
	provides=(ss-uri-gen)
	conflicts=(ss-uri-gen)
	install -Dm755 -t $pkgdir/usr/bin/ $srcdir/$pkgbase/ShadowsocksUriGenerator/bin/Release/net5.0/linux-x64/publish/ss-uri-gen
}

package_ss-uri-gen-chatbot-telegram-git() {
	pkgdesc="Telegram bot allowing easy user interactions with Shadowsocks URI Generator"
	provides=(ss-uri-gen-chatbot-telegram)
	conflicts=(ss-uri-gen-chatbot-telegram)
	install -Dm755 -t $pkgdir/usr/bin/ $srcdir/$pkgbase/ShadowsocksUriGenerator.Chatbot.Telegram/bin/Release/net5.0/linux-x64/publish/ss-uri-gen-chatbot-telegram
}
