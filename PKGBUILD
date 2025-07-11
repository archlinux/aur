# Maintainer: Peter Marheine <peter [at] taricorp [dot] net>
# Contributor: Geoff Hudson <geoff [at] sadcomputer [dot] co [dot] uk>
# Contributor: Aaron Miller <aaronm [at] cldtk [dot] com>
# Contributor: Anthony Boccia <aboccia [at] boccia [dot] me>
# Contributor: Griffin Smith <wildgriffin [at] gmail [dot] com>
# Contributor: Bill Durr <billyburly [at] gmail [dot] com>
# Achilleas Koutsou <achilleas@koutsou.net>

pkgname=crashplan-pro
_pkgname=crashplan
pkgver=11.6.0
_pkgbuild=758
pkgrel=1
pkgdesc="A business online/offsite backup solution"
url="https://www.crashplan.com/en-us/small-business/"
arch=('x86_64')
license=('custom')
depends=('bash' 'java-runtime-headless=8' 'alsa-lib' 'gtk3' 'libxss' 'inetutils' 'slf4j')
makedepends=('cpio')
conflicts=('crashplan')
source=(https://download.crashplan.com/installs/agent/cloud/${pkgver}/${_pkgbuild}/install/CrashPlan_${pkgver}_${_pkgbuild}_Linux.tgz
        crashplan-pro.service
        upgrade.sh
        crashplan-pro_upgrade.service
        crashplan-pro_upgrade.path)
sha1sums=('f391ade98265823c8a6e461f2e9487a5299c7862'
          '194c2022af9809ba9a4694c747db01124c550ffb'
          '8135b6e0fca07b5e3793faa8064ec480efda0063'
          'c24e2ba2b2d6831246ea4af072305ddf5d1fd774'
          '0dfbf0ef3df2ad386419def132c28d63560f6e4e')
options=(!strip)
build() {
  cd $srcdir/crashplan-install

  echo ""
  echo "You must review and agree to the CrashPlan Terms and Conditions of Service before using CrashPlan Pro."
  echo "You can do so at:"
  echo "  - https://www.crashplan.com/terms-conditions/"
  echo ""

  echo "Preparing install.vars"
  cat <<EOF > install.vars
TARGETDIR=/opt/$_pkgname
BINSDIR=/opt/$_pkgname/bin
MANIFESTDIR=/opt/$_pkgname/manifest
INITDIR=/etc/init.d
INSTALLDATE=`date +%Y%m%d`
JAVACOMMON=/opt/$_pkgname/jre/bin/java
APP_BASENAME=CrashPlan
DIR_BASENAME=$_pkgname
APP_DATA_BASE_NAME_LOWER=crashplan
EOF

  echo "Modifying install.sh"
  # skip some functions that don't work for us
  sed -i '/^install_service_script/ s/./#&/' install.sh
  sed -i '/^install_launcher/ s/./#&/' install.sh
  sed -i '/^start_service/ s/./#&/' install.sh

  mkdir -vp $srcdir/CrashPlan

  echo "Extracting CrashPlan.tgz"
  tar xf $srcdir/crashplan-install/CrashPlan.tgz -C $srcdir/CrashPlan

  # do the necessary bits from install_launcher here:
  #  - Set Exec path
  #  - Set Icon path
  sed -i "s|Exec=|Exec=/opt/${_pkgname}/bin/desktop.sh|" "${srcdir}/CrashPlan/bin/crashplan.desktop"
  sed -i "s|Icon=|Icon=/opt/${_pkgname}/bin/icon_app3.png|" "${srcdir}/CrashPlan/bin/crashplan.desktop"
}

package() {
  mkdir -p $pkgdir/opt/$_pkgname

  cd ${srcdir}/crashplan-install
  ./install.sh -v -q -x $pkgdir/opt/

  # remove unused crashplan.service created by install.sh
  # TODO: use it instead of ours, modify the Exec paths, and install it at the proper location
  rm $pkgdir/opt/crashplan/etc/crashplan.service

  cd $pkgdir/opt/$_pkgname

  sed -i "s|<manifestPath.*</manifestPath>|<manifestPath>/opt/$_pkgname/manifest</manifestPath>|g" $pkgdir/opt/$_pkgname/conf/default.service.xml

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/$_pkgname/bin/desktop.sh" $pkgdir/usr/bin/CrashPlanDesktop

  # Fix for encoding troubles (CrashPlan ticket 178827)
  # Make sure the daemon is running using the same localization as
  # the (installing) user
  echo "LC_ALL=$LANG" > $srcdir/CrashPlan/bin/run.conf

  install -D -m 644 $srcdir/crashplan-install/install.vars install.vars
  install -D -m 644 $srcdir/CrashPlan/bin/run.conf bin/run.conf
  install -D -m 755 $srcdir/CrashPlan/bin/crashplan.desktop $pkgdir/usr/share/applications/crashplan.desktop
  install -D -m 755 $srcdir/CrashPlan/bin/service.sh bin/service.sh
  install -D -m 755 $srcdir/upgrade.sh bin/upgrade.sh

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
