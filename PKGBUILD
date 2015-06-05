# Maintainer: Anthony DeStefano <adx [at] fastmail [dot] fm>
# Contributor: Maarten de Boer <info [at] maartendeboer [dot] net>
# Contributor: Egon Geerardyn <egon [dot] geerardyn [at] gmail [dot] com>
# Contributor: Bill Durr <billyburly [at] gmail [dot] com>
pkgname=crashplan-pro-e
pkgver=3.6.4
pkgrel=1
pkgdesc="An enterprise online/offsite backup solution"
url="http://www.crashplan.com/enterprise"
arch=('i686' 'x86_64')
license=('custom')
depends=('java-runtime') 
makedepends=('grep' 'cpio' 'gzip')
optdepends=('swt: needed by some to open the GUI')
backup=()
install=crashplan-pro-e.install
source=(http://download.crashplan.com/installs/linux/install/CrashPlanPROe/CrashPlanPROe_${pkgver}_Linux.tgz
        crashplan-pro-e.service
		CrashPlanDesktop-run.conf.patch)
sha256sums=('eac1742a554e4410f4877b506effbd577a491ccbc70c173915d9293077329ee3'
            '1ca45875025fcf8a4ec6e6f9588807453f65da38b6a0e06c7bb94feb66edda9c'
            '1ec0c53ab7bd942e24b9691e178afa397755742a04718ccb88e2bd8af8a009ac')

build() {
  cd $srcdir/CrashPlanPROe-install

  echo ""
  echo "You must review and agree to the EULA before using Crashplan PROe."
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

  patch -p1 -i $srcdir/CrashPlanDesktop-run.conf.patch
}

package() {
  mkdir -p $pkgdir/opt/$pkgname
  cd $pkgdir/opt/$pkgname

  cat $srcdir/CrashPlanPROe-install/CrashPlanPROe_$pkgver.cpi | gzip -d -c - | cpio -i --no-preserve-owner
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
  echo "" >> $srcdir/CrashPlanPROe-install/scripts/run.conf
  echo "export LC_ALL=$LANG" >> $srcdir/CrashPlanPROe-install/scripts/run.conf

  install -D -m 644 $srcdir/CrashPlanPROe-install/install.vars $pkgdir/opt/$pkgname/install.vars
  install -D -m 644 $srcdir/CrashPlanPROe-install/EULA.txt $pkgdir/opt/$pkgname/EULA.txt
  install -D -m 644 $srcdir/CrashPlanPROe-install/EULA.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 $srcdir/CrashPlanPROe-install/scripts/CrashPlanDesktop $pkgdir/opt/$pkgname/bin/CrashPlanDesktop
  install -D -m 644 $srcdir/CrashPlanPROe-install/scripts/run.conf $pkgdir/opt/$pkgname/bin/run.conf
  install -D -m 755 $srcdir/CrashPlanPROe-install/scripts/CrashPlanEngine $pkgdir/opt/$pkgname/bin/CrashPlanEngine
  install -D -m 755 $srcdir/CrashPlanPROe-install/scripts/CrashPlan.desktop $pkgdir/usr/share/applications/crashplan.desktop

  # systemd unit
  install -D -m 644 $srcdir/crashplan-pro-e.service $pkgdir/usr/lib/systemd/system/crashplan-pro-e.service
}
