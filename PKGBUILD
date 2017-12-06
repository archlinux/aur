# Maintainer: Aaron Miller <aaronm [at] cldtk [dot] com>
# Contributor: Anthony Boccia <aboccia [at] boccia [dot] me>
# Contributor: Griffin Smith <wildgriffin [at] gmail [dot] com>
# Contributor: Bill Durr <billyburly [at] gmail [dot] com>
pkgname=crashplan-pro
pkgver=6.6.0
pkgrel=1
_pkgbuild=4347
_pkgtimestamp=1506661200660
pkgdesc="An business online/offsite backup solution"
url="http://www.crashplan.com/business"
arch=('x86_64')
license=('custom')
depends=('bash' 'java-runtime=8' 'alsa-lib' 'gconf' 'gtk2')
makedepends=('cpio')
install=crashplan-pro.install
source=(https://web-ebm-msp.crashplanpro.com/client/installers/CrashPlanSmb_${pkgver}_${_pkgtimestamp}_${_pkgbuild}_Linux.tgz
        crashplan-pro
        crashplan-pro.service)
sha256sums=('3345e13e06b9f39006376c33c7fc692febab9f83a40384efa756c47a1d30fdff'
            'b306d7da0dd41341512ce80ddcfb21bff8a9bb73ab5018696e69d08b89f7f1b6'
            'c631a971f300bfbfe52e3ec8faa4d7b735eaa069d73e11d6021567e29d053dc3')

build() {
  cd $srcdir/crashplan-install

  echo ""
  echo "You must review and agree to the EULA before using Crashplan PRO."
  echo "You can do so at:"
  echo "  - https://support.code42.com/Terms_and_conditions/Legal_terms_and_conditions/CrashPlan_for_Small_Business_EULA"
  echo ""

  echo "" > install.vars
  echo "JAVACOMMON=`which java`" >> install.vars
  echo "#APP_BASENAME=CrashPlan" >> install.vars
  echo "TARGETDIR=/opt/$pkgname" >> install.vars
  echo "BINSDIR=" >> install.vars
  echo "MANIFESTDIR=/opt/$pkgname/manifest" >> install.vars
  echo "INITDIR=" >> install.vars
  echo "RUNLVLDIR=" >> install.vars
  NOW=`date +%Y%m%d`
  echo "INSTALLDATE=$NOW" >> install.vars

  sed -imod "s|Exec=.*|Exec=/opt/$pkgname/bin/CrashPlanDesktop|" scripts/CrashPlan.desktop
  sed -imod "s|Icon=.*|Icon=/opt/$pkgname/skin/icon_app_64.74.png|" scripts/CrashPlan.desktop
  sed -imod "s|Categories=.*|Categories=System;|" scripts/CrashPlan.desktop
}

package() {
  mkdir -p $pkgdir/opt/$pkgname
  cd $pkgdir/opt/$pkgname

  cat $srcdir/crashplan-install/CrashPlanSmb_$pkgver.cpi | gzip -d -c - | cpio -i --no-preserve-owner
  chmod 777 $pkgdir/opt/$pkgname/log
  sed -i "s|<manifestPath>manifest</manifestPath>|<manifestPath>/opt/$pkgname/manifest</manifestPath>|g" $pkgdir/opt/$pkgname/conf/default.service.xml

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/$pkgname/bin/CrashPlanDesktop" $pkgdir/usr/bin/CrashPlanDesktop

  # Fix for encoding troubles (CrashPlan ticket 178827)
  # Make sure the daemon is running using the same localization as
  # the (installing) user
  echo "" >> $srcdir/crashplan-install/scripts/run.conf
  echo "export LC_ALL=$LANG" >> $srcdir/crashplan-install/scripts/run.conf

  # Use systemctl start/stop commands when it attempts to auto-update
  sed -i 's/^$ENGINE_SCRIPT stop.*/systemctl stop crashplan-pro >> $logfile 2>\&1/g' "$pkgdir/opt/${pkgname}/bin/restartLinux.sh"
  sed -i 's/^$ENGINE_SCRIPT start.*/systemctl start crashplan-pro >> $logfile 2>\&1/g' "$pkgdir/opt/${pkgname}/bin/restartLinux.sh"

  install -D -m 644 $srcdir/crashplan-install/install.vars $pkgdir/opt/$pkgname/install.vars

  #Removed as of Version 4.8.0 as the EULA is no longer included in the source
  #install -D -m 644 $srcdir/crashplan-install/EULA.txt $pkgdir/opt/$pkgname/EULA.txt
  #install -D -m 644 $srcdir/crashplan-install/EULA.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m 755 $srcdir/crashplan-install/scripts/CrashPlanDesktop $pkgdir/opt/$pkgname/bin/CrashPlanDesktop
  install -D -m 644 $srcdir/crashplan-install/scripts/run.conf $pkgdir/opt/$pkgname/bin/run.conf
  install -D -m 755 $srcdir/crashplan-install/scripts/CrashPlanEngine $pkgdir/opt/$pkgname/bin/CrashPlanEngine
  install -D -m 755 $srcdir/crashplan-install/scripts/CrashPlan.desktop $pkgdir/usr/share/applications/crashplan.desktop

  # rc.d daemon
  install -D -m 755 $srcdir/crashplan-pro $pkgdir/etc/rc.d/crashplan-pro
  # systemd unit
  install -D -m 644 $srcdir/crashplan-pro.service $pkgdir/usr/lib/systemd/system/crashplan-pro.service
}

post_install() {
  echo ""
  echo "Consider raising fs.inotify_max_user_watches as described on the wiki: "
  echo "  - https://wiki.archlinux.org/index.php/CrashPlan#Real_time_protection"
  echo ""
}
