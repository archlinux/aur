# Maintainer: too <turecki@gmail.com>
# Contributor: Kai Korla <kai@korla.cloud>
# Contributor: MrHacker <kmunoz@condorbs.net>

pkgname=mssql-server-fts
pkgver=17.0.5005.3
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Microsoft SQL Server 2025 Full Text Search"
arch=('x86_64')
# Prebuilt Microsoft payloads: nothing to strip, no debug package to split.
options=('!strip' '!debug')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver17"
license=('LicenseRef-Microsoft-SQL-Server-EULA')

# Taken from the same Ubuntu 24.04 pool as mssql-server so the engine and the
# full-text module always come from one upstream build. Unlike the engine this
# package contains no ELF binaries at all - only sqlservr.fts.sfp and
# semanticsdb.bak - so it has no link-time dependency on the host distribution.
_debfile="${pkgname}_${_prodver}_amd64.deb"
source=("https://packages.microsoft.com/ubuntu/24.04/mssql-server-2025/pool/main/m/${pkgname}/${_debfile}")
noextract=("${_debfile}")
sha256sums=('5d46c644c35013f2a28f23caa43400a89d06b0ea310d42a9e909da2ed18dfeb8')

# The .sfp is loaded into the engine process, so it has to match the engine
# build exactly. Declared at the top level, not inside package(), so that
# .SRCINFO and the AUR dependency graph actually see it.
depends=("mssql-server=${pkgver}")

install=$pkgname.install

prepare() {
	# makepkg unpacks the ar archive but will not recurse into the payload
	# member, so do that by hand. Do not hardcode the compression suffix.
	local _payload
	_payload=$(bsdtar -tf "$srcdir/$_debfile" | grep -m1 '^data\.tar\.')
	[ -n "$_payload" ] || { echo "no data.tar.* member in $_debfile" >&2; return 1; }
	bsdtar -xOf "$srcdir/$_debfile" "$_payload" | bsdtar -xf - -C "$srcdir"
}

package() {
	cp -a "$srcdir/opt" "$pkgdir/opt"

	# Upstream ships only a copyright stub in this package. The licence that
	# actually governs it is the engine EULA, which arrives with the exact
	# mssql-server build this package depends on, so link to it rather than
	# duplicating a megabyte of text.
	install -Dm644 "$srcdir/usr/share/doc/$pkgname/copyright" \
		"$pkgdir/usr/share/licenses/$pkgname/copyright"
	ln -s ../mssql-server/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
