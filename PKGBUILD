# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=zfs-auto-snapshot-git
pkgdesc="Implementation of a snapshotting service for ZFS"
pkgver=1.2.4.r31.92db087
pkgrel=1
epoch=1
arch=('any')
url="https://github.com/zfsonlinux/zfs-auto-snapshot"
license=('GPL2')
depends=('systemd>=212' 'zfs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url" "prefix_label_order.patch")
sha512sums=('SKIP'
            '178d60a1fa234d89314eae72d82079ca41d886505fd92af79050e1fe04f1cbb172900151911e37b4e5f3ba50c5cc741b6d1a71bdfd99f0003fad0df77f547af4')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "%s\n" "$(git describe --tags --long | sed 's|upstream/||g' | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${pkgname%-git}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
        break;
    else
      patch -p1 -i "$patch"
    fi
  done

  mkdir "../systemd"
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
  cd "$srcdir/${pkgname%-git}"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/systemd/system"
  install -d "$pkgdir/usr/share/man/man8"
  install -m 755 src/zfs-auto-snapshot.sh "$pkgdir/usr/bin/zfs-auto-snapshot"
  install -m 644 src/zfs-auto-snapshot.8 "$pkgdir/usr/share/man/man8"
  install -m 644 ../systemd/* "$pkgdir/usr/lib/systemd/system"
}
