# Maintainer: too <turecki@gmail.com>
# Maintainer: DoctorZeus(Dan) <contact@techtonicsoftware.com>
# Contributor: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=17.0.4085.5
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Microsoft SQL Server 2025 for Linux"
arch=('x86_64')
# Prebuilt Microsoft binaries: never strip them (it breaks crash-dump
# symbolication) and do not try to split a debug package out of them.
options=('!strip' '!debug')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver17"
license=('LicenseRef-Microsoft-SQL-Server-EULA')

# Upstream ships identical payloads for every distro; only the build's link-time
# dependencies differ. The Ubuntu 24.04 build is the one that matches Arch:
#   - RHEL 8/9/10 builds need EVP_md2, which Arch's openssl does not provide
#     (MD2 is a RHEL-only patch), so sqlservr dies at startup with
#     "undefined symbol: EVP_md2, version OPENSSL_3.0.0".
#   - The Ubuntu 22.04 build needs libldap-2.5.so.0 / liblber-2.5.so.0.
#   - The Ubuntu 24.04 build links libssl.so.3, libcrypto.so.3, libldap.so.2 and
#     liblber.so.2 exactly as Arch ships them, so no bundled or legacy TLS/LDAP
#     libraries and no AUR-only dependencies are needed.
_debfile="${pkgname}_${_prodver}_amd64.deb"
source=("https://packages.microsoft.com/ubuntu/24.04/mssql-server-2025/pool/main/m/${pkgname}/${_debfile}"
        "${pkgname}.sysusers")
noextract=("${_debfile}")
sha256sums=('ed3c98104b67a331b8a12dad713f64bb0cbff4aa719584d5459ae728032c2223'
            '92e34c7fbbb1fd9860fae32a54f4374b660e7834fca85b0afc626bc19157d71f')

# Everything below is linked directly by /opt/mssql/bin/sqlservr, except python
# (mssql-conf) and tzdata (AT TIME ZONE). libc++, libc++abi, libunwind and
# liburing are bundled by upstream in /opt/mssql/lib and are intentionally not
# listed. No dependency here lives outside the official repositories.
depends=(
	'glibc'
	'libgcc'
	'libstdc++'
	'libatomic'
	'openssl'
	'krb5'
	'e2fsprogs'
	'libldap'
	'numactl'
	'pam'
	'sssd'
	'systemd-libs'
	'util-linux-libs'
	'python'
	'tzdata'
)

optdepends=(
	'gdb: capture core dumps when the engine crashes'
	'lsof: extra diagnostics in the crash handler'
	'cyrus-sasl-gssapi: SASL/GSSAPI (Active Directory) authentication'
	'python-pyodbc: external script / extensibility features'
	'debugedit: symbol handling for crash dumps'
)

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
	cp -a "$srcdir/usr" "$pkgdir/usr"

	# Debian ships these gzipped; drop the Debian-only changelog.
	rm -f "$pkgdir/usr/share/doc/$pkgname/changelog.Debian.gz"
	find "$pkgdir/usr/share/doc/$pkgname" -name '*.gz' -exec gunzip {} +

	install -Dm644 "$srcdir/$pkgname.sysusers" \
		"$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	install -Dm644 "$pkgdir/usr/share/doc/$pkgname/license/1033/license.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	chmod 644 "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
