pkgname='pmcenter-bin'
pkgver='2.0.2.0'
pkgrel=1
epoch=
pkgdesc='A Telegram bot helping you process private messages.'
arch=('x86_64')
url='https://pmcenter.itsmy.app'
license=('APACHE')
depends=('dotnet-runtime')
makedepends=('unzip')
source=("https://github.com/Elepover/pmcenter/releases/download/$pkgver/pmcenter-linux-x64-r2r.zip"
    "https://raw.githubusercontent.com/Elepover/pmcenter/$pkgver/locales/pmcenter_locale_en.json"
    "https://raw.githubusercontent.com/Elepover/pmcenter/$pkgver/pmcenter.json"
	"pmcenter.service"
    "pmcenter_sysuser.conf"
    "pmcenter_tmpfile.conf")
noextract=("pmcenter-linux-x64-r2r.zip")
options=(staticlibs)
md5sums=('aa5f485d745485546c0cbcaa20ae2e48'
         'cbfe1b615300e23d39dfaf1906f5d606'
         'b25c9763082de5e7071db8d0aea2b3f9'
         '15dad546ed1b187cbde34214954065a9'
         'bc00968280c8190810de24fe45ec1ec3'
         '52488093764b9de2807f161e18611335')
backup=('etc/pmcenter/pmcenter.json'
'etc/pmcenter/pmcenter_locale.json')

install=$pkgname.install

prepare() {
	cd $srcdir
    mkdir -p sources
    rm -rf sources/*
    cd sources
    unzip ../pmcenter-linux-x64-r2r.zip
}

package() {
	cd $srcdir

    mkdir -p $pkgdir/etc/pmcenter/
    # Because we want pmcenter to generate the configuration, but it only supports
    # generating to the default location, which is in the same folder with the dll.
    # ln -s /usr/share/dotnet/pmcenter/pmcenter.dll $pkgdir/etc/pmcenter/pmcenter.dll
    install -Dm664 pmcenter_locale_en.json $pkgdir/etc/pmcenter/pmcenter_locale.json
    install -Dm664 pmcenter.json $pkgdir/etc/pmcenter/pmcenter.json

	mkdir -p $pkgdir/usr/share/dotnet/pmcenter/
    install -Dm644 -v ./sources/* $pkgdir/usr/share/dotnet/pmcenter/
    ln -s /etc/pmcenter/pmcenter.json $pkgdir/usr/share/dotnet/pmcenter/pmcenter.json
    ln -s /etc/pmcenter/pmcenter_locale.json $pkgdir/usr/share/dotnet/pmcenter/pmcenter_locale.json

	mkdir -p $pkgdir/usr/lib/systemd/system
	install -Dm644 $srcdir/pmcenter.service $pkgdir/usr/lib/systemd/system/

    mkdir -p $pkgdir/usr/lib/sysusers.d/
    install -Dm644 $srcdir/pmcenter_sysuser.conf $pkgdir/usr/lib/sysusers.d/pmcenter.conf

	mkdir -p $pkgdir/usr/lib/tmpfiles.d/
    install -Dm644 $srcdir/pmcenter_tmpfile.conf $pkgdir/usr/lib/tmpfiles.d/pmcenter.conf
}
