# Maintainer: Justin dray <justin@dray.be>
# Contributor: Egon Geerardyn <egon [dot] geerardyn [at] gmail [dot] com>
# Contributor: Bill Durr <billyburly [at] gmail [dot] com>
pkgname=crashplan
pkgver=4.2.0
pkgrel=2
pkgdesc="An online/offsite backup solution"
url="http://www.crashplan.com"
arch=('i686' 'x86_64')
license=('custom')
depends=('bash' 'java-runtime-headless') 
makedepends=('cpio')
optdepents=('java-runtime - For Crashplan GUI')
install=crashplan.install
source=("http://download.crashplan.com/installs/linux/install/CrashPlan/CrashPlan_${pkgver}_Linux.tgz"
        'crashplan.service'
	'install.vars'
	'sysctl-crashplan.conf')
sha256sums=('634b651042be9e403cc687490ca66b3ff69ae88d9a3be1ea00b2db7931bed67c'
            'e5600d9d102fa8668183895fbe208d00cc353706f5b4a78302eca00f70b60800'
            'c6dc626a180671d6b01f46f22158857c3fa86cd3eec79e3388284a2ab2682617'
            '2ec3d9cea180e92f1410ff89ece85c01f79d454cfc2e814f583c0e2b3ff8ce30')

build() {
	sed -i "s|Exec=.*|Exec=/opt/$pkgname/bin/CrashPlanDesktop|" "$srcdir/CrashPlan-install/scripts/CrashPlan.desktop"
	sed -i "s|Icon=.*|Icon=crashplan|" "$srcdir/CrashPlan-install/scripts/CrashPlan.desktop"
	sed -i "s|Categories=.*|Categories=System;|" "$srcdir/CrashPlan-install/scripts/CrashPlan.desktop"

	# Fix for encoding troubles (CrashPlan ticket 178827)
	# Make sure the daemon is running using a sane locale
	echo "" >> "$srcdir/CrashPlan-install/scripts/run.conf"
	echo "LC_ALL=${LANG-en_US.utf8}" >> "$srcdir/CrashPlan-install/scripts/run.conf"

	# Fix for GUI crashing with libsoup errors
	sed -i '/GUI_JAVA_OPTS/s/"$/ -Dorg.eclipse.swt.browser.DefaultType=mozilla"/' "$srcdir/CrashPlan-install/scripts/run.conf"
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	cd "$pkgdir/opt/$pkgname"

	zcat "$srcdir/CrashPlan-install/CrashPlan_${pkgver}.cpi" | cpio -i --no-preserve-owner

	# All users need write permissions or the GUI will fail to open
	chmod 777 "$pkgdir/opt/$pkgname/log"
	sed -i "s|<manifestPath>manifest</manifestPath>|<manifestPath>/opt/$pkgname/manifest</manifestPath>|g" "$pkgdir/opt/$pkgname/conf/default.service.xml"

	# Fix for 32 bit: 64 bit libs cannot be stripped from symbols
	# so we just remove those libs
	if [ "$CARCH" = "i686" ]; then
		rm "$pkgdir/opt/$pkgname/"*64.so
	fi

	for size in 16x16 32x32 64x64 128x128
	do
		install -Dm 644 "$pkgdir/opt/$pkgname/skin/icon_app_${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/crashplan.png"
	done

	install -dm 755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/bin/CrashPlanDesktop" "$pkgdir/usr/bin/CrashPlanDesktop"
	install -Dm 644 "$srcdir/sysctl-crashplan.conf" "$pkgdir/etc/sysctl.d/99-crashplan.conf"
	install -Dm 644 "$srcdir/crashplan.service" "$pkgdir/usr/lib/systemd/system/crashplan.service"
	install -Dm 644 "$srcdir/install.vars" "$pkgdir/opt/$pkgname/install.vars"
	install -Dm 644 "$srcdir/CrashPlan-install/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 755 "$srcdir/CrashPlan-install/scripts/CrashPlanDesktop" "$pkgdir/opt/$pkgname/bin/CrashPlanDesktop"
	install -Dm 644 "$srcdir/CrashPlan-install/scripts/run.conf" "$pkgdir/opt/$pkgname/bin/run.conf"
	install -Dm 755 "$srcdir/CrashPlan-install/scripts/CrashPlanEngine" "$pkgdir/opt/$pkgname/bin/CrashPlanEngine"
	install -Dm 755 "$srcdir/CrashPlan-install/scripts/CrashPlan.desktop" "$pkgdir/usr/share/applications/crashplan.desktop"
}
