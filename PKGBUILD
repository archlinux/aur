# Maintainer: database64128 <free122448@hotmail.com>

pkgname=cubic-bot-telegram-git
pkgver=1.0.r42.g9bb3bd2
pkgrel=1
pkgdesc="A stupid and annoying chatbot for your group chats"
arch=(x86_64)
url="https://github.com/database64128/CubicBot"
license=('GPL3')
makedepends=('git' 'dotnet-sdk>=5.0.0')
provides=("cubic-bot-telegram")
conflicts=("cubic-bot-telegram")
options=(!strip)
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    dotnet publish CubicBot.Telegram -c Release \
        -p:DefineConstants=PACKAGED \
        -p:PublishReadyToRun=true \
        -p:PublishSingleFile=true \
        -p:PublishTrimmed=true \
        -p:TrimMode=link \
        -p:DebuggerSupport=false \
        -p:EnableUnsafeBinaryFormatterSerialization=false \
        -p:EnableUnsafeUTF7Encoding=false \
        -p:InvariantGlobalization=true \
        -r linux-x64 --self-contained
}

package() {
    cd $pkgname
    install -Dm755 CubicBot.Telegram/bin/Release/net5.0/linux-x64/publish/cubic-bot-telegram $pkgdir/usr/bin/cubic-bot-telegram
    install -Dm644 systemd/user/cubic-bot-telegram.service $pkgdir/usr/lib/systemd/user/cubic-bot-telegram.service
}
