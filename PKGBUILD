# Maintainer: too <turecki@gmail.com>
# Maintainer: DoctorZeus(Dan) <contact@techtonicsoftware.com>
# Contributor: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=16.0.4225.2
_remRevision=2
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16"
license=('unknown')
depends=(
	'libatomic_ops'
	'libunwind'
	'numactl' 
	'glibc'
	'libc++'
	'gdb'
	'openssl-1.1'
	'krb5'
	'nss'
	'sssd'
	'gawk'
	'sed'
	'pam'
	'libldap24'
);
optdepends=(
	'python-pyodbc'
	'debugedit'
);

#This is a local azure instance that resolves as an alias of "packages.microsoft.com/rhel/8/mssql-server-2022" as some regions have different dir structures
source=("https://pmc-prod-afd-endpoint-evdhh8f8byhsezfp.b01.azurefd.net/rhel/8/mssql-server-2022/Packages/m/${pkgname}-${_prodver}.x86_64.rpm")

sha256sums=('852f3d2cda6660181ac54e76d6bbac559f9a79a77f42c7f67b103184a81a5ef3')

install=$pkgname.install

package() {

	#Setup
	cd $pkgdir
	mv $srcdir/opt .
	mv $srcdir/usr .

	#Create links to non-breaking libssl and libcrypto libs
	ln -sf /lib/libssl.so.1.1 $pkgdir/opt/mssql/lib/libssl.so
	ln -sf /lib/libcrypto.so.1.1 $pkgdir/opt/mssql/lib/libcrypto.so

	#Set systemd service file perms
	chmod 644 $pkgdir/usr/lib/systemd/system/mssql-server.service
}
