# Maintainer: Jon Gjengset <jon@tsp.io>
# Contributor: Justin dray <justin@dray.be>
# Contributor: Egon Geerardyn <egon [dot] geerardyn [at] gmail [dot] com>
# Contributor: Bill Durr <billyburly [at] gmail [dot] com>

# Strongly inspired by the crashplan PKGBUILD
# If you want to install a site-specific version of CrashPlanPROe (for example
# the MIT-supported one, simply download that file to this directory, rename it
# to CrashPlanPROe_$pkgver_Linux.tgz and run makepkg.
pkgname=crashplan-proe
pkgver=3.7.0
pkgrel=1
pkgdesc="An online/offsite backup solution (enterprise edition)"
url="http://www.crashplan.com"
arch=('i686' 'x86_64')
license=('custom')
depends=('bash' 'java-runtime-headless') 
makedepends=('cpio')
optdepents=('java-runtime - For Crashplan GUI')
install=crashplan-proe.install
source=("http://download.crashplan.com/installs/linux/install/CrashPlanPROe/CrashPlanPROe_${pkgver}_Linux.tgz"
        'crashplan-proe.service'
	'install.vars'
	'sysctl-crashplan-proe.conf')
sha256sums=('SKIP' # To allow custom versions
            '42fa959e102c353403230ba035b4f97cd4603925444d7326d6928c8e12896600'
            '0312ca31d1612cca459dfa9db81373c2a5562c9d93807aea3752e880479999ec'
            '2ec3d9cea180e92f1410ff89ece85c01f79d454cfc2e814f583c0e2b3ff8ce30')

build() {
	sed -i "s|Exec=.*|Exec=/opt/$pkgname/bin/CrashPlanDesktop|" "$srcdir/CrashPlanPROe-install/scripts/CrashPlan.desktop"
	sed -i "s|Icon=.*|Icon=/opt/$pkgname/skin/icon_app_128x128.png|" "$srcdir/CrashPlanPROe-install/scripts/CrashPlan.desktop"
	sed -i "s|Name=.*|Name=CrashPlan PROe|" "$srcdir/CrashPlanPROe-install/scripts/CrashPlan.desktop"
	sed -i "s|Categories=.*|Categories=System;|" "$srcdir/CrashPlanPROe-install/scripts/CrashPlan.desktop"

	# Fix for encoding troubles (CrashPlan ticket 178827)
	# Make sure the daemon is running using a sane locale
	echo "" >> "$srcdir/CrashPlanPROe-install/scripts/run.conf"
	echo "LC_ALL=C" >> "$srcdir/CrashPlanPROe-install/scripts/run.conf"

	# Fix for GUI crashing with libsoup errors
	sed -i '/GUI_JAVA_OPTS/s/"$/ -Dorg.eclipse.swt.browser.DefaultType=mozilla"/' "$srcdir/CrashPlanPROe-install/scripts/run.conf"
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	cd "$pkgdir/opt/$pkgname"

	zcat "$srcdir/CrashPlanPROe-install/CrashPlanPROe_$pkgver.cpi" | cpio -i --no-preserve-owner 2>/dev/null

	# All users need write permissions or the GUI will fail to open
	chmod 777 "$pkgdir/opt/$pkgname/log"
	sed -i "s|<manifestPath>manifest</manifestPath>|<manifestPath>/opt/$pkgname/manifest</manifestPath>|g" "$pkgdir/opt/$pkgname/conf/default.service.xml"

	# Fix for 32 bit: 64 bit libs cannot be stripped from symbols
	# so we just remove those libs
	if [ "$CARCH" = "i686" ]; then
		rm "$pkgdir/opt/$pkgname/"*64.so
	fi

	install -dm 755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/bin/CrashPlanDesktop" "$pkgdir/usr/bin/CrashPlanPROeDesktop"
	install -Dm 644 "$srcdir/sysctl-crashplan-proe.conf" "$pkgdir/etc/sysctl.d/99-crashplan-proe.conf"
	install -Dm 644 "$srcdir/crashplan-proe.service" "$pkgdir/usr/lib/systemd/system/crashplan-proe.service"
	install -Dm 644 "$srcdir/install.vars" "$pkgdir/opt/$pkgname/install.vars"
	install -Dm 644 "$srcdir/CrashPlanPROe-install/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 755 "$srcdir/CrashPlanPROe-install/scripts/CrashPlanDesktop" "$pkgdir/opt/$pkgname/bin/CrashPlanDesktop"
	install -Dm 644 "$srcdir/CrashPlanPROe-install/scripts/run.conf" "$pkgdir/opt/$pkgname/bin/run.conf"
	install -Dm 755 "$srcdir/CrashPlanPROe-install/scripts/CrashPlanEngine" "$pkgdir/opt/$pkgname/bin/CrashPlanEngine"
	install -Dm 755 "$srcdir/CrashPlanPROe-install/scripts/CrashPlan.desktop" "$pkgdir/usr/share/applications/crashplan-proe.desktop"
	if [[ -e "$srcdir/CrashPlanPROe-install/custom" ]]; then
		msg2 "Enabling site-specific customizations"
		cp -Rp "$srcdir/CrashPlanPROe-install/custom" "$pkgdir/opt/$pkgname/"
	fi
}
