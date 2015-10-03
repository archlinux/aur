# Maintainer: Justin dray <justin@dray.be>
# Contributor: Egon Geerardyn <egon [dot] geerardyn [at] gmail [dot] com>
# Contributor: Bill Durr <billyburly [at] gmail [dot] com>
pkgname=crashplan
pkgver=4.4.1
pkgrel=1
pkgdesc="An online/offsite backup solution"
url="http://www.crashplan.com"
arch=('i686' 'x86_64')
license=('custom')
depends=('bash' 'java-runtime-headless') 
makedepends=('cpio')
optdepents=('java-runtime - For Crashplan GUI')
backup=('opt/crashplan/bin/run.conf'
	'opt/crashplan/conf/my.service.xml'
	'opt/crashplan/conf/service.model')
install=crashplan.install
source=("http://download.crashplan.com/installs/linux/install/CrashPlan/CrashPlan_${pkgver}_Linux.tgz"
	'https://raw.githubusercontent.com/pdemonaco/init/master/crashplan/crashplan'
	'crashplan.service'
	'install.vars'
	'sysctl-crashplan.conf')
sha256sums=('41547af4db8417e0841e24f9fb3d546a81a3dda59ec7909a41984ce8fc7f5e79'
            '259d38afa8fc34246ac0ecfeefc701d47501c552eb0ffcd1bd4b8e9a2751c3c8'
            'e5600d9d102fa8668183895fbe208d00cc353706f5b4a78302eca00f70b60800'
            'c6dc626a180671d6b01f46f22158857c3fa86cd3eec79e3388284a2ab2682617'
            '2ec3d9cea180e92f1410ff89ece85c01f79d454cfc2e814f583c0e2b3ff8ce30')

build() {
	sed -i "s|Exec=.*|Exec=/opt/$pkgname/bin/CrashPlanDesktop|" "$srcdir/crashplan-install/scripts/CrashPlan.desktop"
	sed -i "s|Icon=.*|Icon=crashplan|" "$srcdir/crashplan-install/scripts/CrashPlan.desktop"
	sed -i "s|Categories=.*|Categories=System;|" "$srcdir/crashplan-install/scripts/CrashPlan.desktop"

	# Fix for encoding troubles (CrashPlan ticket 178827)
	# Make sure the daemon is running using a sane locale
	echo "" >> "$srcdir/crashplan-install/scripts/run.conf"
	echo "LC_ALL=${LANG-en_US.utf8}" >> "$srcdir/crashplan-install/scripts/run.conf"

	# Fix for GUI crashing with libsoup errors
	sed -i '/GUI_JAVA_OPTS/s/"$/ -Dorg.eclipse.swt.browser.DefaultType=mozilla"/' "$srcdir/crashplan-install/scripts/run.conf"
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	cd "$pkgdir/opt/$pkgname"

	zcat "$srcdir/crashplan-install/CrashPlan_${pkgver}.cpi" | cpio -i --no-preserve-owner

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
	install -dm 755 "$pkgdir/etc/init.d"
	install -Dm 644 "$srcdir/crashplan" "$pkgdir/etc/init.d/crashplan"
	install -Dm 644 "$srcdir/sysctl-crashplan.conf" "$pkgdir/etc/sysctl.d/99-crashplan.conf"
	install -Dm 644 "$srcdir/crashplan.service" "$pkgdir/usr/lib/systemd/system/crashplan.service"
	install -Dm 644 "$srcdir/install.vars" "$pkgdir/opt/$pkgname/install.vars"
	install -Dm 644 "$srcdir/crashplan-install/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 755 "$srcdir/crashplan-install/scripts/CrashPlanDesktop" "$pkgdir/opt/$pkgname/bin/CrashPlanDesktop"
	install -Dm 644 "$srcdir/crashplan-install/scripts/run.conf" "$pkgdir/opt/$pkgname/bin/run.conf"
	install -Dm 755 "$srcdir/crashplan-install/scripts/CrashPlanEngine" "$pkgdir/opt/$pkgname/bin/CrashPlanEngine"
	install -Dm 755 "$srcdir/crashplan-install/scripts/CrashPlan.desktop" "$pkgdir/usr/share/applications/crashplan.desktop"
}
