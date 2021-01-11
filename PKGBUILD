# Maintainer: DuckSoft <realducksoft at gmail dot com> 
pkgname=shadowsocks-uri-generator-git
pkgver=20210110.r54.ca29e5e
pkgrel=2
pkgdesc="Command line tool for multi-user ss:// URL generation, SIP008 online configuration delivery, and Outline server deployment and management"
arch=(x86_64)
url="https://github.com/database64128/shadowsocks-uri-generator"
license=('GPL')
makedepends=('git' 'dotnet-sdk>=5.0')
provides=('shadowsocks-uri-generator')
conflicts=('shadowsocks-uri-generator')
source=("$pkgname::git+$url")
options=(!strip)
b2sums=(SKIP)

pkgver() {
	cd $srcdir/$pkgname
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.r${count}.$commit"
}

build() {
	cd $pkgname
	dotnet publish ShadowsocksUriGenerator -c Release -p:PublishTrimmed=true -p:PublishSingleFile=true -r linux-x64 --self-contained
}

package() {
	install -Dm755 -t $pkgdir/usr/bin/ $srcdir/$pkgname/ShadowsocksUriGenerator/bin/Release/net5.0/linux-x64/publish/ss-uri-gen
}
