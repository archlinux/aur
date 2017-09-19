# Maintainer: Kyle McNally <kyle@kmcnally.net>
# Contributor: Robert Holak <rholak@gmail.com>
# Contributor: Christopher Krooß <didi2002@web.de>

pkgname=greyhole
pkgver=0.10.13
pkgrel=1
pkgdesc='Application that uses Samba to create a storage pool of all your available hard drives and allows you to create redundant copies of the files you store, in order to prevent data loss when part of your hardware fails.'
arch=('x86_64')
url="https://www.greyhole.net/"
license=('GPL3')
depends=('php-intl>=5' 'samba>3.4.3' 'mysql' 'rsync' 'lsof' 'sysstat')
backup=('etc/greyhole.conf')
install='greyhole.install'
source=("https://greyhole.net/releases/$pkgname-$pkgver.tar.gz"
        "greyhole.service")
sha256sums=('73f1510c9f97f5cd94f477cdd773cc3f1cc94ff0bb2e59a9bd0503f65c3882dd'
            '04b57cd86a092032e3b323d18b5380bfbc22ea7334832574a2e536887554ffc4')

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/var/spool/greyhole"
  chmod 777 "$pkgdir/var/spool/greyhole"
  mkdir -p "$pkgdir/usr/share/greyhole"
  mkdir -p "$pkgdir/usr/share/greyhole/scripts-examples"
  mkdir -p "$pkgdir/usr/share/webapps/greyhole"

  install -m 0755 -D -p greyhole "$pkgdir/usr/bin/greyhole"
  install -m 0755 -D -p greyhole-dfree "$pkgdir/usr/bin/greyhole-dfree"
  install -m 0755 -D -p greyhole-php "$pkgdir/usr/bin/greyhole-php"
  install -m 0755 -D -p greyhole-dfree.php "$pkgdir/usr/share/greyhole"
  install -m 0755 -D -p greyhole-custom-cp.sh "$pkgdir/usr/share/greyhole"

  install -m 0644 -D -p schema-mysql.sql "$pkgdir/usr/share/greyhole/schema-mysql.sql"
  install -m 0644 -D -p greyhole.example.conf "$pkgdir/usr/share/greyhole/greyhole.example.conf"

  install -m 0644 -D -p greyhole.example.conf "$pkgdir/etc/greyhole.conf"
  install -m 0644 -D -p "$srcdir/greyhole.service" "$pkgdir/usr/lib/systemd/system/greyhole.service"
  install -m 0644 -D -p logrotate.greyhole "$pkgdir/etc/logrotate.d/greyhole"
  install -m 0644 -D -p greyhole.cron.d "$pkgdir/etc/cron.d/greyhole"
  install -m 0755 -D -p greyhole.cron.weekly "$pkgdir/etc/cron.weekly/greyhole"
  install -m 0755 -D -p greyhole.cron.daily "$pkgdir/etc/cron.daily/greyhole"

  install -m 0644 -D -p web-app/index.php "$pkgdir/usr/share/webapps/greyhole/index.php"
  install -m 0644 -D -p web-app/README "$pkgdir/usr/share/webapps/greyhole/README"

  install -m 0755 -D -p scripts-examples/greyhole_file_changed.sh "$pkgdir/usr/share/greyhole/scripts-examples/greyhole_file_changed.sh"
  install -m 0755 -D -p scripts-examples/greyhole_idle.sh "$pkgdir/usr/share/greyhole/scripts-examples/greyhole_idle.sh"
  install -m 0755 -D -p scripts-examples/greyhole_notify_error.sh "$pkgdir/usr/share/greyhole/scripts-examples/greyhole_notify_error.sh"
  install -m 0755 -D -p scripts-examples/greyhole_send_fsck_report.sh "$pkgdir/usr/share/greyhole/scripts-examples/greyhole_send_fsck_report.sh"

  install -m 0644 -D -p USAGE "$pkgdir/usr/share/greyhole/USAGE"

  install -m 0644 -D -p docs/greyhole.1.gz "$pkgdir/usr/share/man/man1/greyhole.1.gz"
  install -m 0644 -D -p docs/greyhole-dfree.1.gz "$pkgdir/usr/share/man/man1/greyhole-dfree.1.gz"
  install -m 0644 -D -p docs/greyhole.conf.5.gz "$pkgdir/usr/share/man/man5/greyhole.conf.5.gz"

  _vfs_file=greyhole-x86_64.so

  _smb_ver="`smbd --version | awk '{print $2}' | awk -F'-' '{print $1}' | awk -F'.' '{print $1$2}'`"

  mkdir -p "$pkgdir/usr/lib/greyhole"
  mkdir -p "$pkgdir/usr/lib/samba/vfs"

  case $_smb_ver in
    34 )
        install -m 644 "samba-module/bin/3.4/$_vfs_file" "$pkgdir/usr/lib/greyhole/greyhole-samba34.so"
        ln -s "/usr/lib/greyhole/greyhole-samba34.so" "$pkgdir/usr/lib/samba/vfs/greyhole.so"
        ;;
    35 )
        install -m 644 "samba-module/bin/3.5/$_vfs_file" $pkgdir/usr/lib/greyhole/greyhole-samba35.so"
        ln -s "/usr/lib/greyhole/greyhole-samba35.so" $pkgdir/usr/lib/samba/vfs/greyhole.so"
        ;;
    36 )
        install -m 644 "samba-module/bin/3.6/$_vfs_file" $pkgdir/usr/lib/greyhole/greyhole-samba36.so"
        ln -s "/usr/lib/greyhole/greyhole-samba36.so" $pkgdir/usr/lib/samba/vfs/greyhole.so"
        ;;
    40 )
        install -m 644 "samba-module/bin/4.0/$_vfs_file" $pkgdir/usr/lib/greyhole/greyhole-samba40.so"
        ln -s "/usr/lib/greyhole/greyhole-samba40.so" $pkgdir/usr/lib/samba/vfs/greyhole.so"
        ;;
    41 )
        install -m 644 "samba-module/bin/4.1/$_vfs_file" $pkgdir/usr/lib/greyhole/greyhole-samba41.so"
        ln -s "/usr/lib/greyhole/greyhole-samba41.so" $pkgdir/usr/lib/samba/vfs/greyhole.so"
        ;;
    42 )
        install -m 644 "samba-module/bin/4.2/$_vfs_file" $pkgdir/usr/lib/greyhole/greyhole-samba42.so"
        ln -s "/usr/lib/greyhole/greyhole-samba42.so" $pkgdir/usr/lib/samba/vfs/greyhole.so"
        ;;
    43 )
        install -m 644 "samba-module/bin/4.3/$_vfs_file" $pkgdir/usr/lib/greyhole/greyhole-samba43.so"
        ln -s "/usr/lib/greyhole/greyhole-samba43.so" $pkgdir/usr/lib/samba/vfs/greyhole.so"
        ;;
    44 )
        install -m 644 "samba-module/bin/4.4/$_vfs_file" "$pkgdir/usr/lib/greyhole/greyhole-samba44.so"
        ln -s "/usr/lib/greyhole/greyhole-samba44.so" "$pkgdir/usr/lib/samba/vfs/greyhole.so"
        ;;
    45 )
        install -m 644 "samba-module/bin/4.5/$_vfs_file" "$pkgdir/usr/lib/greyhole/greyhole-samba45.so"
        ln -s "/usr/lib/greyhole/greyhole-samba45.so" "$pkgdir/usr/lib/samba/vfs/greyhole.so"
        ;;
    46 )
	install -m 644 "samba-module/bin/4.6/$_vfs_file" "$pkgdir/usr/lib/greyhole/greyhole-samba46.so"
	ln -s "/usr/lib/greyhole/greyhole-samba46.so" "$pkgdir/usr/lib/samba/vfs/greyhole.so"
	;;
    * )
        echo 'Incompatible Samba version: Please see https://github.com/gboudreau/Greyhole/blob/master/INSTALL for manual build directions'
        echo 'You can still install this package, but it will not work until you add a greyhole-samba.so file to /usr/lib/greyhole/'
        ;;
  esac

}
