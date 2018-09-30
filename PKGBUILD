# Mantainer: RonaldMcDaddy <wannes.demeyer@protonmail.com>
# Contributor:  Tinh Truong <xuantinh at gmail dot com>
# Contributor: Cedric Sougne <cedric@sougne.name>
# Contributor: untseac
# Contributor: siasia
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=oracle-xe
pkgver=11.2.0_1.0
pkgrel=4
pkgdesc="a non free DBMS"
url="http://www.oracle.com/"
license=('custom')
arch=('x86_64')
conflicts=('oracle-xe')
provides=('oracle-xe')
options=('!strip')
depends=('libaio>=0.3.104' 'gcc>=4.1.2' 'binutils>=2.16.91.0.5' 'make>=3.80' 'glibc>=2.3.4-2.41' 'bc' 'net-tools')
makedepends=('')
install='oracle.install'
source=('manual://download/file/from/oracle/page/oracle-xe-11.2.0-1.0.x86_64.rpm.zip'
        'oracle_env.csh'
        'oracle_env.sh'
        'oracle-xe'
        'oracle-xe.conf'
        'listener.ora'
        'oracle-xe.service'
       )
DLAGENTS+=('manual::/usr/bin/echo The source file for this package needs to be downloaded manually, since it requires a login and is not redistributable.;/usr/bin/echo Please visit http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html.; exit 1;')
md5sums=('dd7881a55569d890241f11cd0eeb7d48'
         'cff2a6dbbbbf4d3454c05970183cc1b8'
         '6dd1d97571b823e8f682f290edeb9e7b'
         'e558d7dcb9e455f8cb03db8638832774'
         '5a3eaff3cb867d97cd250f04fe372ae7'
         '4d4a2e1bcc29b9c1fd197b42ccc4e0ac'
         '3dd923ac2df9fd38827fc9fc0048273a'
        )

build() {
    cd $srcdir
    bsdtar -xf Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm
}

package() {
    cd $srcdir

    mkdir -p $pkgdir/etc/rc.d
    cp $srcdir/oracle-xe $pkgdir/etc/rc.d/
    chmod +x $pkgdir/etc/rc.d/oracle-xe

    mkdir -p $pkgdir/usr/lib
    mv $srcdir/u01/app/oracle $pkgdir/usr/lib/

    # Fix the listener.ora
    cp -f $srcdir/listener.ora $pkgdir/usr/lib/oracle/product/11.2.0/xe/network/admin/

    find $pkgdir -exec chmod 755 {} \;

    # Export environment variables
    mkdir -p $pkgdir/etc/profile.d
    cp $srcdir/oracle_env.* $pkgdir/etc/profile.d/
    chmod +x $pkgdir/etc/profile.d/oracle_env.*

    # Desktop files
    cp -a $srcdir/usr $pkgdir

    # LD_LIBRARY_PATH
    mkdir -p $pkgdir/etc/ld.so.conf.d/
    cp $srcdir/oracle-xe.conf $pkgdir/etc/ld.so.conf.d/

    # License
    mkdir -p $pkgdir/usr/share/licenses/custom/$pkgname
    cp $srcdir/usr/share/doc/oracle_xe/LICENSE $pkgdir/usr/share/licenses/custom/$pkgname

    # Directory corrections
    corr1="s_/u01/app/_/usr/lib/_g"
    corr2="s_/usr/bin/groups_/bin/groups_g"
    sed -i "${corr1}" $pkgdir/usr/lib/oracle/product/11.2.0/xe/config/scripts/*
    sed -i "${corr2}" $pkgdir/usr/lib/oracle/product/11.2.0/xe/config/scripts/*
    sed -i "${corr1}" $pkgdir/usr/lib/oracle/product/11.2.0/xe/odbc/lib/env_odbc.mk
    sed -i "${corr1}" $pkgdir/usr/share/applications/*
    sed -i "${corr1}" $pkgdir/usr/lib/oracle/product/11.2.0/xe/bin/oracle_env.*

    # For systemd
    mkdir -p $pkgdir/etc/systemd/system
    cp $srcdir/oracle-xe.service $pkgdir/etc/systemd/system
}
