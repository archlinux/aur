# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=zfs-auto-snapshot
pkgdesc="Implementation of a snapshotting service for ZFS"
pkgver=1.2.1.1
pkgrel=0
arch=('any')
url="https://github.com/zfsonlinux/zfs-auto-snapshot"
license=('GPL2')
depends=('systemd>=212' 'zfs')
makedepends=('git')
source=('git+https://github.com/zfsonlinux/zfs-auto-snapshot#commit=63e4438edb618066e9cc4303df4a7c1331d26654')
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  ### COMMENT the following 4 lines to NOT change the snapshot name to
  ### @PREFIX_DATE_LABEL instead of @PREFIX-LABEL_DATE
  ### (the following makes the snapshots nicely sorted by time)
  sed -r -i \
      -e 's@^(SNAPNAME="\$)(opt_prefix)(.*)-\$DATE@\1{\2}_$DATE\3@' \
      -e 's@^(SNAPGLOB="\$)(opt_prefix)(.*})([?]+)@\1{\2}\4\3@' \
      src/zfs-auto-snapshot.sh

  mkdir -p systemd
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
    cat > systemd/zfs-auto-snapshot-${_label}.service <<EOF
[Unit]
Description=ZFS $_label snapshot service

[Service]
ExecStart=$_PREFIX/bin/zfs-auto-snapshot --skip-scrub $_prefix --label=$_label --keep=$_keep //
EOF

    # write timer files
    cat > systemd/zfs-auto-snapshot-${_label}.timer <<EOF
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
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/systemd/system"
  install -d "$pkgdir/usr/share/man/man8"
  install -m 755 src/zfs-auto-snapshot.sh "$pkgdir/usr/bin/zfs-auto-snapshot"
  install -m 644 src/zfs-auto-snapshot.8 "$pkgdir/usr/share/man/man8"
  install -m 644 systemd/* "$pkgdir/usr/lib/systemd/system"
}
