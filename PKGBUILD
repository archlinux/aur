# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=quik
pkgver=12.8.1
pkgrel=1
stratver=3.0.5
trustver=2.10.0
btradever=1.2.1002
pkgdesc="Trading terminal in Wine"
url="https://arqatech.com/ru/products/quik/terminals/user-applications/quik-workstation/"
arch=('x86_64')
noextract=('keygen.zip')
depends=('wine<=10.8' 'unixodbc')
#depends=('wine' 'unixodbc')

source=(
"https://arqatech.com/upload/iblock/413/quik_${pkgver}_upd.zip"
"ftp://ftp.quik.ru/public/updates/10.2/StratVolat_${stratver}_upd.zip"
#"ftp://ftp.quik.ru/public/updates/11.2/TrustManager_${trustver}_upd.zip"
#"ftp://ftp.quik.ru/public/updates/10.2/BTrading_${btradever}_upd.zip"
"keygen.zip::ftp://ftp.quik.ru/public/updates/keygen_1.3.0_upd.zip"
"https://github.com/alain-riedinger/luasocket/releases/download/3.0-5.3.5/luasocket-3.0-5.3.5.zip"
"https://github.com/alain-riedinger/luasocket/releases/download/3.1-5.4.7/luasocket-3.1-5.4.7.zip"
"quik"
"quik-keygen"
"qrypto.cfg"
"ip.cfg"
)
sha256sums=(
'6cc4e108d4e67fc4f68f534623522bbcd14255ac648296f52591e1c365739afa' # quik_12.8.1_upd.zip
'd32095309cd7359f4078a74179d8ae42e013e3fd3ad75837f0fa3941e7091b75' # StratVolat 3.0.5
#'ff4dd52e56fabe8c06730daca770a92312338303bc06b58d417105d44c5a0869' # TrustManager
#'0f6724e6666c379cf9a1f53aa627f4b0c56fded2d7e3fbf3704d6526066fa8e3' # BasketTrading
'bc66665d2209836abe51ae9258c289c0f682dba4ea5261f9319996a60a6a4ae7' # keygen
'b2a3a2e2a895cea35aad5dee97640ef7bcccbb38e61e61b14baff6cecbdd79af' # lua-socket 5.3.5
'f45993d0f5d1d84fe0c084433505d3a84babd6f5686fc2c3c7a7119b9727e927' # lua-socket 5.4.7
'70f46a29703b822ddff8b502c07697a05e478b7de51b9e55d67c4dc37e1bb80f' # quik
'758f427eccd973964ce6fcf8d0dd3064bf694096ee56f6d49e27e165ecab54c4' # quik-keygen
'd981ee4cc35d33a3b37c43fb7343bde5c24e15e003dbb67907b602d22f60a469'
'49aa53c38ceb5c3029398203a68bbb1b3cc9819d01ecb57a6ce13c31b344fe03' # ip.cfg
)

prepare() {
	mkdir -p {keygen,socket-5.3,socket-5.4}
	bsdtar -xzf keygen.zip -C keygen
	bsdtar -xzf luasocket-3.0-5.3.5.zip -C socket-5.3
	bsdtar -xzf luasocket-3.1-5.4.7.zip -C socket-5.4

	# bugfix in luasock 5.4 @url https://gist.github.com/ttys3/31dbf88ee7d708294d8ae5b0a4954424
#	cd ./socket-5.4/x64/socket/
#	cat http.lua | sed 's/receive()/receive("*l")/' > tmp; mv tmp http.lua
#	cat tp.lua   | sed 's/receive()/receive("*l")/' > tmp; mv tmp   tp.lua
}

package() {
	bindir="${pkgdir}/usr/lib/quik/bin"
	# quik
	install -Dm755 quik "${pkgdir}/usr/bin/quik"
	for fname in ./*.exe; do install -Dm755 $fname "$bindir/$fname"; done
	for fname in ./*.dll; do install -Dm644 $fname "$bindir/$fname"; done
	for fname in ./*.chm; do install -Dm644 $fname "$bindir/$fname"; done
	for fname in ./*.cfg; do install -Dm644 $fname "$bindir/$fname"; done

	# keygen
	install -Dm755 quik-keygen "${pkgdir}/usr/bin/"
	for fname in ./keygen/*.exe; do install -Dm755 $fname "$bindir/$fname"; done
	for fname in ./keygen/*.dll; do install -Dm644 $fname "$bindir/$fname"; done
	for fname in ./keygen/*.chm; do install -Dm644 $fname "$bindir/$fname"; done

	# libs
	cd "${srcdir}/socket-5.3/x64/"
	for fname in {mime/core.dll,socket/core.dll}; do install -Dm644 $fname "$bindir/../lib/lua/5.3/$fname"; done
	for fname in {*.lua,socket/*.lua};            do install -Dm644 $fname "$bindir/../share/lua/5.3/$fname"; done
	cd "${srcdir}/socket-5.4/x64/"
	for fname in {mime/core.dll,socket/core.dll}; do install -Dm644 $fname "$bindir/../lib/lua/5.4/$fname"; done
	for fname in {*.lua,socket/*.lua};            do install -Dm644 $fname "$bindir/../share/lua/5.4/$fname"; done
}
