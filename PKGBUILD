# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: (divansantana) Divan Santana <divan (a) santanas  co za>

pkgname=raid-check
_pkgver=4.1
_centosver=6.el7
pkgver=${_pkgver}.${_centosver}
pkgrel=1
pkgdesc="Raid-check script, config and cronjob for data scrubbing to be used with mdadm."
arch=('x86_64')
url="https://wiki.archlinux.org/index.php/RAID#Scrubbing"
license=('GPL')
depends=('mdadm' 'cron')
install="raid-check.install"
source=(http://mirror.centos.org/centos/7/os/x86_64/Packages/mdadm-${_pkgver}-${_centosver}.x86_64.rpm)
md5sums=('707301aa677c579524535ff3a5bb9963')
backup=(etc/cron.d/raid-check
        etc/conf.d/raid-check)

build() {
        cd $srcdir
        sed -i 's/sysconfig/conf.d/g' usr/sbin/raid-check
        # by default it shouldn't do anything until configured
        sed -i 's/\/usr\/sbin/\/usr\/bin/g' etc/sysconfig/raid-check
        sed -i 's/ENABLED=yes/ENABLED=no/g' etc/sysconfig/raid-check
        sed -i 's/\/usr\/sbin/\/usr\/bin/g' etc/cron.d/raid-check
        sed -i 's/ by default//g' etc/cron.d/raid-check
        sed -i 's/^0/#0/g' etc/cron.d/raid-check
}

package() {
  install -Dm755 "$srcdir"/usr/sbin/raid-check "$pkgdir"/usr/bin/raid-check
  install -Dm644 "$srcdir"/etc/sysconfig/raid-check "$pkgdir"/etc/conf.d/raid-check
  install -Dm644 "$srcdir"/etc/cron.d/raid-check "$pkgdir"/etc/cron.d/raid-check
}

post_install() {
  echo ":: You need to edit /etc/conf.d/raid-check and /etc/cron.d/raid-check"
  echo "   See https://wiki.archlinux.org/index.php/Software_RAID_and_LVM#Data_Scrubbing for more info"
}

