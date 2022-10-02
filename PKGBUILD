# Maintainer: Geoff Hudson <geoff [at] sadcomputer [dot] co [dot] uk> Contributor: Aaron Miller <aaronm [at] cldtk [dot] com> Contributor: Anthony Boccia <aboccia [at] boccia [dot] me> Contributor: Griffin Smith <wildgriffin [at] gmail [dot] com> Contributor: Bill Durr
# <billyburly [at] gmail [dot] com>
pkgname=crashplan-pro
_pkgname=crashplan
pkgver=10.2.0
_pkgtimestamp=15252000061020
_pkgbuild=14
pkgrel=1
pkgdesc="An business online/offsite backup solution"
url="http://www.crashplan.com/business"
arch=('x86_64')
license=('custom')
depends=('bash' 'java-runtime-headless=8' 'alsa-lib' 'gtk3' 'libxss' 'inetutils' 'slf4j')
# We are trying without gconf or gtk3
makedepends=('cpio')
conflicts=('crashplan')
# install=crashplan-pro.install
source=(https://download.code42.com/installs/agent/cloud/${pkgver}/${_pkgbuild}/install/CrashPlanSmb_${pkgver}_${_pkgtimestamp}_${_pkgbuild}_Linux.tgz
        crashplan-pro.service
        upgrade.sh
        crashplan-pro_upgrade.service
        crashplan-pro_upgrade.path)
sha1sums=('7fa6dc6c5338501bc4f63f2915f0d5420de25197'
          'f73e2b1155744594303d81b394031159e248654c'
          'a3a5ead8b8fd867f47782b12bc27b1fb145565ac'
          'c24e2ba2b2d6831246ea4af072305ddf5d1fd774'
          '0dfbf0ef3df2ad386419def132c28d63560f6e4e')
options=(!strip)
build() {
  cd $srcdir/code42-install

  echo ""
  echo "You must review and agree to the EULA before using CrashPlan PRO."
  echo "You can do so at:"
  echo "  - https://support.code42.com/Terms_and_conditions/Legal_terms_and_conditions/CrashPlan_for_Small_Business_EULA"
  echo ""



  cat <<EOF > install.vars
TARGETDIR=/opt/$_pkgname
BINSDIR=/opt/$_pkgname/bin
MANIFESTDIR=/opt/$_pkgname/manifest
INITDIR=/etc/init.d
INSTALLDATE=`date +%Y%m%d`
JAVACOMMON=/opt/$_pkgname/jre/bin/java
APP_BASENAME=Code42
DIR_BASENAME=$_pkgname
APP_DATA_BASE_NAME_LOWER=crashplan
EOF

  sed -i '/^resolve_native_libraries/ s/./#&/' install.sh
  sed -i '/^install_service_script/ s/./#&/' install.sh
  sed -i '/^install_launcher/ s/./#&/' install.sh
  sed -i '/^start_service/ s/./#&/' install.sh
  sed -i '/^prompt_to_start_desktop/ s/./#&/' install.sh
}

package() {
  mkdir -p $pkgdir/opt/$_pkgname
  cd $pkgdir/opt/$_pkgname

  $srcdir/code42-install/install.sh -q -x $pkgdir/opt/ -u $USER

  # As arch isnt a recognised flavour we manually extract the so files
  cp nlib/common/* nlib/
  cp nlib/ubuntu20/libuaw.so nlib/
  rm -rf nlib/{rhel7,rhel8,ubuntu18,ubuntu20,common}

  sed -i "s|<manifestPath.*</manifestPath>|<manifestPath>/opt/$_pkgname/manifest</manifestPath>|g" $pkgdir/opt/$_pkgname/conf/default.service.xml

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/$_pkgname/bin/CrashPlanDesktop" $pkgdir/usr/bin/CrashPlanDesktop

  # Fix for encoding troubles (CrashPlan ticket 178827)
  # Make sure the daemon is running using the same localization as
  # the (installing) user
  echo "LC_ALL=$LANG" > $srcdir/code42-install/scripts/run.conf

  install -D -m 644 $srcdir/code42-install/install.vars install.vars
  install -D -m 644 $srcdir/code42-install/scripts/run.conf bin/run.conf
  install -D -m 755 $srcdir/code42-install/scripts/code42.desktop $pkgdir/usr/share/applications/crashplan.desktop
  install -D -m 755 $srcdir/code42-install/scripts/service.sh bin/service.sh
  install -D -m 755 $srcdir/upgrade.sh bin/upgrade.sh

  # We need to change the name for now
  ln -sf "/opt/$_pkgname/bin/Code42Service" $pkgdir/opt/crashplan/bin/CrashPlanService
  ln -sf "/opt/$_pkgname/bin/desktop.sh" $pkgdir/opt/crashplan/bin/CrashPlanDesktop
  ln -sf "/opt/$_pkgname/bin/service.sh" $pkgdir/opt/crashplan/bin/CrashPlanEngine

  # systemd unit
  install -D -m 644 $srcdir/crashplan-pro.service $pkgdir/usr/lib/systemd/system/crashplan-pro.service
  install -D -m 644 $srcdir/crashplan-pro_upgrade.service $pkgdir/usr/lib/systemd/system/crashplan-pro_upgrade.service
  install -D -m 644 $srcdir/crashplan-pro_upgrade.path $pkgdir/usr/lib/systemd/system/crashplan-pro_upgrade.path
}

pre_upgrade() {
  rm -rf /opt/crashplan/upgrade/*
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
