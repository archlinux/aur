# Maintainer: Anthony Boccia <aboccia [at] boccia [dot] me>
# Contributer: Griffin Smith <wildgriffin [at] gmail [dot] com>
# Contributor: Bill Durr <billyburly [at] gmail [dot] com>
pkgname=crashplan-pro
pkgver=4.3.0
pkgrel=0
pkgdesc="An business online/offsite backup solution"
url="http://www.crashplan.com/business"
arch=('i686' 'x86_64')
license=('custom')
depends=('java-runtime') 
makedepends=('grep' 'cpio' 'gzip')
optdepends=('swt: needed by some to open the GUI')
backup=()
install=crashplan-pro.install
source=(http://download1.us.code42.com/installs/linux/install/CrashPlanPRO/CrashPlanPRO_${pkgver}_Linux.tgz
        crashplan-pro
        crashplan-pro.service)
sha256sums=('b8010fa3b33c9535bdff385216e383629b510dc24916b0ec7bc7a89aa0c60b4a'
            'b306d7da0dd41341512ce80ddcfb21bff8a9bb73ab5018696e69d08b89f7f1b6'
            'd8667e149439e4c6f35779a6d04ce5215530049579011eb1db5feb2d6976420e')

build() {
  cd $srcdir/CrashPlanPRO-install

  echo ""
  echo "You must review and agree to the EULA before using Crashplan PRO."
  echo "You can do so at:"
  echo "  - http://support.crashplan.com/doku.php/eula"
  echo "  - /usr/share/licenses/${pkgname}/LICENSE"
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
  sed -imod "s|Icon=.*|Icon=/opt/$pkgname/skin/icon_app_64x64.png|" scripts/CrashPlan.desktop
  sed -imod "s|Categories=.*|Categories=System;|" scripts/CrashPlan.desktop
}

package() {
  mkdir -p $pkgdir/opt/$pkgname
  cd $pkgdir/opt/$pkgname

  cat $srcdir/CrashPlanPRO-install/CrashPlanPRO_$pkgver.cpi | gzip -d -c - | cpio -i --no-preserve-owner
  chmod 777 $pkgdir/opt/$pkgname/log
  sed -i "s|<manifestPath>manifest</manifestPath>|<manifestPath>/opt/$pkgname/manifest</manifestPath>|g" $pkgdir/opt/$pkgname/conf/default.service.xml

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/$pkgname/bin/CrashPlanDesktop" $pkgdir/usr/bin/CrashPlanDesktop

  # Fix for 32 bit: 64 bit libs cannot be stripped from symbols
  # so we just remove those libs
  if [ "$CARCH" = "i686" ]; then
    rm $pkgdir/opt/$pkgname/*64.so
  fi

  # Fix for encoding troubles (CrashPlan ticket 178827)
  # Make sure the daemon is running using the same localization as
  # the (installing) user
  echo "" >> $srcdir/CrashPlanPRO-install/scripts/run.conf
  echo "export LC_ALL=$LANG" >> $srcdir/CrashPlanPRO-install/scripts/run.conf

  install -D -m 644 $srcdir/CrashPlanPRO-install/install.vars $pkgdir/opt/$pkgname/install.vars
  install -D -m 644 $srcdir/CrashPlanPRO-install/EULA.txt $pkgdir/opt/$pkgname/EULA.txt
  install -D -m 644 $srcdir/CrashPlanPRO-install/EULA.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 $srcdir/CrashPlanPRO-install/scripts/CrashPlanDesktop $pkgdir/opt/$pkgname/bin/CrashPlanDesktop
  install -D -m 644 $srcdir/CrashPlanPRO-install/scripts/run.conf $pkgdir/opt/$pkgname/bin/run.conf
  install -D -m 755 $srcdir/CrashPlanPRO-install/scripts/CrashPlanEngine $pkgdir/opt/$pkgname/bin/CrashPlanEngine
  install -D -m 755 $srcdir/CrashPlanPRO-install/scripts/CrashPlan.desktop $pkgdir/usr/share/applications/crashplan.desktop

  # rc.d daemon
  install -D -m 755 $srcdir/crashplan-pro $pkgdir/etc/rc.d/crashplan-pro
  # systemd unit
  install -D -m 644 $srcdir/crashplan-pro.service $pkgdir/usr/lib/systemd/system/crashplan-pro.service
}
