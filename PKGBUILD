# Maintainer: Aaron Miller <aaronm [at] cldtk [dot] com> Contributor: Anthony Boccia <aboccia [at] boccia [dot] me> Contributor: Griffin Smith <wildgriffin [at] gmail [dot] com> Contributor: Bill Durr 
# <billyburly [at] gmail [dot] com>
pkgname=crashplan-pro
_pkgname=crashplan
pkgver=6.9.0
_pkgtimestamp=1525200006690
_pkgbuild=827
pkgrel=2
pkgdesc="An business online/offsite backup solution"
url="http://www.crashplan.com/business"
arch=('x86_64')
license=('custom')
depends=('bash' 'java-runtime-headless=8' 'alsa-lib' 'gconf' 'gtk3' 'libxss')
makedepends=('cpio')
conflicts=('crashplan')
install=crashplan-pro.install
source=(https://www.crashplanpro.com/client/installers/CrashPlanSmb_${pkgver}_${_pkgtimestamp}_${_pkgbuild}_Linux.tgz
        crashplan-pro
        crashplan-pro.service)
sha256sums=('3b6be8fbee83d25af0285b284c099efed7463fb9e7473af6c96662d8637fa5d2'
            'b306d7da0dd41341512ce80ddcfb21bff8a9bb73ab5018696e69d08b89f7f1b6'
            'fd4c80dbd2ea3dcfc9966832a599f1bb310f705f813474d1900c1867ea55155c')

build() {
  cd $srcdir/crashplan-install

  echo ""
  echo "You must review and agree to the EULA before using CrashPlan PRO."
  echo "You can do so at:"
  echo "  - https://support.code42.com/Terms_and_conditions/Legal_terms_and_conditions/CrashPlan_for_Small_Business_EULA"
  echo ""

  echo "" > install.vars
  echo "JAVACOMMON=`which java`" >> install.vars
  echo "APP_BASENAME=CrashPlan" >> install.vars
  echo "TARGETDIR=/opt/$_pkgname" >> install.vars
  echo "BINSDIR=" >> install.vars
  echo "MANIFESTDIR=/opt/$_pkgname/manifest" >> install.vars
  echo "INITDIR=" >> install.vars
  echo "RUNLVLDIR=" >> install.vars
  NOW=`date +%Y%m%d`
  echo "INSTALLDATE=$NOW" >> install.vars

  sed -imod 's|\. $TARGETDIR/bin/run\.conf|:|' scripts/CrashPlanEngine
  sed -imod "s|Exec=.*|Exec=/opt/$_pkgname/bin/CrashPlanDesktop|" scripts/CrashPlan.desktop
  sed -imod "s|Icon=.*|Icon=/opt/$_pkgname/bin/icon_app.png|" scripts/CrashPlan.desktop
  sed -imod "s|Categories=.*|Categories=System;|" scripts/CrashPlan.desktop
}

package() {
  mkdir -p $pkgdir/opt/$_pkgname
  cd $pkgdir/opt/$_pkgname

  cat $srcdir/crashplan-install/CrashPlanSmb_$pkgver.cpi | gzip -d -c - | cpio -i --no-preserve-owner

  chmod 777 log
  chmod 775 electron/crashplan

  mv app.asar electron/resources

  sed -i "s|<backupConfig>|<backupConfig>\n\t\t\t<manifestPath>/opt/$_pkgname/manifest</manifestPath>|g" conf/default.service.xml

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/$_pkgname/bin/CrashPlanDesktop" $pkgdir/usr/bin/CrashPlanDesktop

  # Fix for encoding troubles (CrashPlan ticket 178827)
  # Make sure the daemon is running using the same localization as
  # the (installing) user
  echo "" >> $srcdir/crashplan-install/scripts/run.conf
  echo "LC_ALL=$LANG" >> $srcdir/crashplan-install/scripts/run.conf

  # Prevent crashplan from restarting itself repeatedly..
  echo '#!/bin/sh' > bin/restartLinux.sh
  echo 'exit' >> bin/restartLinux.sh

  install -D -m 644 $srcdir/crashplan-install/install.vars install.vars
  install -D -m 755 $srcdir/crashplan-install/scripts/CrashPlanDesktop bin/CrashPlanDesktop
  install -D -m 644 $srcdir/crashplan-install/scripts/run.conf bin/run.conf
  install -D -m 755 $srcdir/crashplan-install/scripts/CrashPlanEngine bin/CrashPlanEngine
  install -D -m 755 $srcdir/crashplan-install/scripts/CrashPlan.desktop $pkgdir/usr/share/applications/crashplan.desktop

  # rc.d daemon
  install -D -m 755 $srcdir/crashplan-pro $pkgdir/etc/rc.d/crashplan-pro
  # systemd unit
  install -D -m 644 $srcdir/crashplan-pro.service $pkgdir/usr/lib/systemd/system/crashplan-pro.service
}

post_install() {
  INOTIFY_WATCHES=$(cat /proc/sys/fs/inotify/max_user_watches)
  if [[ $INOTIFY_WATCHES -le 8192 ]]; then
    echo ""
    echo "Your Linux system is currently configured to watch $INOTIFY_WATCHES files in real time."
    echo "CrashPlan recommends using a larger value; see the the arch wiki for details:"
    echo "  - https://wiki.archlinux.org/index.php/CrashPlan#Real_time_protection"
    echo ""
  fi
}
