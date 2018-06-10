# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=zfs-auto-snapshot
pkgdesc="Implementation of a snapshotting service for ZFS"
pkgver=1.2.4
pkgrel=1
arch=('any')
url="https://github.com/zfsonlinux/zfs-auto-snapshot"
license=('GPL2')
depends=('systemd>=212' 'zfs')
source=("$url/archive/upstream/$pkgver.tar.gz" "prefix_label_order.patch")
sha512sums=('26382303fce8b90dfb40f69fcab92308e88c17c147b4a566c5d32f2e9aa241d64f5da56ad82b4becb824ba01a470037a724460d35676a1d46de9c578c02a57d9'
            'f0dc350f17bac8b1569e088c7b8c4d097b810eeab1addbf84f79aa5294c96a6353ceaaeb212feb85136f5a190d5ae54ff9a2e5b9441a0cb0960d43518aedfa47')

prepare() {
  cd "$pkgname-upstream-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
	break;
    else
      patch -p1 -i "$patch"
    fi
  done

  mkdir -p "../systemd"
  cd "../systemd"

  ### "Label|NumberOfKeptSnapshots|systemd-timer-spec" of snapshots,
  ### eg. timer and service files, being created adjust/extend if required

  declare -a arr=(
    "frequent|4|*:0/15"
    "hourly|24|hourly"
    "daily|31|daily"
    "weekly|8|weekly"
    "monthly|12|monthly")

  for i in "${arr[@]}"
  do
    _label="$(echo $i | cut -d'|' -f1)"
    _keep="$(echo $i | cut -d'|' -f2)"
    _OnCalendarSpec="$(echo $i | cut -d'|' -f3)"
    _prefix="--prefix=znap"
    cat > zfs-auto-snapshot-${_label}.service <<EOF
[Unit]
Description=ZFS $_label snapshot service

[Service]
ExecStart=$_PREFIX/bin/zfs-auto-snapshot --skip-scrub $_prefix --label=$_label --keep=$_keep //
EOF

    # write timer files
    cat > zfs-auto-snapshot-${_label}.timer <<EOF
# See systemd.timers and systemd.time manpages for details
[Unit]
Description=ZFS $_label snapshot timer

[Timer]
OnCalendar=$_OnCalendarSpec
Persistent=true

[Install]
WantedBy=timers.target
EOF
  done
}

package() {
  cd "$pkgname-upstream-$pkgver"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/systemd/system"
  install -d "$pkgdir/usr/share/man/man8"
  install -m 755 src/zfs-auto-snapshot.sh "$pkgdir/usr/bin/zfs-auto-snapshot"
  install -m 644 src/zfs-auto-snapshot.8 "$pkgdir/usr/share/man/man8"
  install -m 644 ../systemd/* "$pkgdir/usr/lib/systemd/system"
}
