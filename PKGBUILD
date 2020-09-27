# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: RonaldMcDaddy <wannes.demeyer@protonmail.com>
# Contributor: Tinh Truong <xuantinh at gmail dot com>
# Contributor: Cedric Sougne <cedric@sougne.name>
# Contributor: untseac
# Contributor: siasia
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: JuliusTZM <julius dot tzm at gmail dot com>

pkgname=oracle-xe
pkgver=18.4.0_1.0
pkgrel=1
pkgdesc="a non free DBMS"
url="http://www.oracle.com/"
license=('custom')
arch=('x86_64')
conflicts=('oracle-xe')
provides=('oracle-xe')
options=('!strip')
depends=('libaio>=0.3.112-2' 'gcc>=9.3.0-1' 'binutils>=2.34-2.1' 'make>=4.3-1' 'glibc>=2.31-2' 'bc' 'net-tools')
install='oracle-xe.install'
source=(
        'manual://download/file/from/oracle/page/oracle-database-xe-18c-1.0-1.x86_64.rpm'
        'oracle_env.csh'
        'oracle_env.sh'
        'oracle-xe-18c'
        'oracle-xe-18c.conf'
        'oracle-xe-18c.ld.so.conf'
        'oracle-xe.service'
)

DLAGENTS+=('manual::/usr/bin/echo The source file for this package needs to be downloaded manually, since it requires a login and is not redistributable. Please visit http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html')

sha256sums=('4df0318d72a0b97f5468b36919a23ec07533f5897b324843108e0376566d50c8'
            '5472f8ea19a2b33780146bc95e5dc9263bb9c05b18150d24d08a85f04ed86b84'
            '9b584b6403ec0a3c8567d1720347769c92ba9f02ee460979506d641a5aa32f8b'
            '5e8296afc2c6402146cec06c3c1f73516e340f3104581c59e0f66af12f80b8e8'
            '2d96e23869665f3648e54c85f004bf1b99f22ca227d7b148727b239135ae0e6b'
            '067e68295e4e2bcefe290ba0b8fcbe6594adc89de66875cc79c5e9f1190f8932'
            'dc59dd2abd55678abd4566af7b0cabfe7837d5c43db6612905c3f8c7b498c992')

build() {
    cd $srcdir
#    bsdtar -xf oracle-xe-18.4.0-1.0.x86_64.rpm
}

package() {
    cd $srcdir

    mkdir -p $pkgdir/etc/rc.d
    cp $srcdir/oracle-xe-18c $pkgdir/etc/rc.d/
    chmod +x $pkgdir/etc/rc.d/oracle-xe-18c

    #Fix for ***[FATAL] [DBT-50000] Unable to check for available memory.****
    corr1="s_-sampleSchema_-J-Doracle.assistants.dbca.validate.ConfigurationParams=false -sampleSchema_g"
    sed -i "${corr1}" $pkgdir/etc/rc.d/oracle-xe-18c

    mkdir -p $pkgdir/etc/sysconfig
    cp $srcdir/oracle-xe-18c.conf $pkgdir/etc/sysconfig

    mkdir -p $pkgdir/opt
    mv $srcdir/opt/oracle $pkgdir/opt

    find $pkgdir -exec chmod 755 {} \;

    # Export environment variables
    mkdir -p $pkgdir/etc/profile.d
    cp $srcdir/oracle_env.* $pkgdir/etc/profile.d/
    chmod +x $pkgdir/etc/profile.d/oracle_env.*

    # Desktop files
    cp -a $srcdir/usr $pkgdir

    # LD_LIBRARY_PATH
    mkdir -p $pkgdir/etc/ld.so.conf.d/
    cp $srcdir/oracle-xe-18c.ld.so.conf $pkgdir/etc/ld.so.conf.d/oracle-xe-18c.conf

    # License
    mkdir -p $pkgdir/usr/share/licenses/custom/$pkgname
    cp $srcdir/usr/share/doc/oracle-xe-18c/LICENSE $pkgdir/usr/share/licenses/custom/$pkgname

    # For systemd
    mkdir -p $pkgdir/etc/systemd/system
    cp $srcdir/oracle-xe.service $pkgdir/etc/systemd/system
}
