# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=quik
pkgver=11.0.1
pkgrel=1
stratver=3.0.5
pkgdesc="Trading terminal in Wine"
url="https://arqatech.com/ru/"
arch=('x86_64')
depends=('wine')
noextract=('keygen.zip')

source=(
"ftp://ftp.quik.ru/public/updates/11.0/quik_${pkgver}_upd.zip"
"ftp://ftp.quik.ru/public/updates/10.2/StratVolat_${stratver}_upd.zip"
"keygen.zip::ftp://ftp.quik.ru/public/updates/keygen_1.3.0_upd.zip"
"https://github.com/alain-riedinger/luasocket/releases/download/3.0-5.3.5/luasocket-3.0-5.3.5.zip"
"https://github.com/alain-riedinger/luasocket/releases/download/3.0-5.4.3/luasocket-3.0-5.4.3.zip"
"quik"
"quik-keygen"
"qrypto.cfg"
"ip.cfg"
)
sha256sums=(
'b1e72332d632d162c5761c1d0a293e12f38a8422b424a1b4af7e48e00c879944'
'd32095309cd7359f4078a74179d8ae42e013e3fd3ad75837f0fa3941e7091b75'
'bc66665d2209836abe51ae9258c289c0f682dba4ea5261f9319996a60a6a4ae7'
'b2a3a2e2a895cea35aad5dee97640ef7bcccbb38e61e61b14baff6cecbdd79af'
'2e69ea49e9b6a9d7c84bcf37653f4a1e15e8b73d7b21302e7cd40d29af6104aa'
'e4ddfc7a2a12bba0fdc880dcb05757fff2c035b2625f721ea1a0383bdc6ad1bf'
'92563c563a9781592d1e119117e3b7a899addfabd733648986b97db999386821'
'd981ee4cc35d33a3b37c43fb7343bde5c24e15e003dbb67907b602d22f60a469'
'88c54d4593542f02794b8433a8458d585d8e15b7ddad6530229c156b086765ed'
)

prepare() {
	mkdir -p {keygen,socket-5.3,socket-5.4}
	bsdtar -xzf keygen.zip -C keygen
	bsdtar -xzf luasocket-3.0-5.3.5.zip -C socket-5.3
	bsdtar -xzf luasocket-3.0-5.4.3.zip -C socket-5.4

	# bugfix in luasock 5.4 @url https://gist.github.com/ttys3/31dbf88ee7d708294d8ae5b0a4954424
	cd ./socket-5.4/x64/socket/
	cat http.lua | sed 's/receive()/receive("*l")/' > tmp; mv tmp http.lua
	cat tp.lua   | sed 's/receive()/receive("*l")/' > tmp; mv tmp   tp.lua
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
