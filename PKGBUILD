# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=bitchat
pkgver=4.6.3
pkgrel=1
pkgdesc="Secure, peer-to-peer instant messenger"
arch=(any)
url="https://bitchat.im/"
license=(GPL3)
depends=(mono)
makedepends=(imagemagick git)
_commit=50d2c949b598e1abaa5088442055f4962f7f0b53
source=("git+https://github.com/TechnitiumSoftware/BitChatClient#commit=$_commit"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'a630f23eb2b9044a1ceab3b2a0db6f18544710e60fa874ff6025eb45aa6795c3'
            '406048fc6b7540c9d23a9ef01685821a4fc437c7b0ed1a9b0cd4be8444c426c2')

prepare() {
	cd BitChatClient
	sed -i '/SocketOptionName.IPv6Only/d' BitChatCore/Network/{LocalPeerDiscovery.cs,Connections/ConnectionManager.cs}
}

build() {
	cd BitChatClient
	xbuild /p:Configuration=Release BitChatClient.sln
	convert BitChatAppMono/logo2.ico[2] ../$pkgname.png
}

package() {
	cd BitChatClient
	install -Dm644 -t "$pkgdir/usr/lib/bitchat" BitChatAppMono/bin/Release/*
	install -Dm755 ../$pkgname.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
