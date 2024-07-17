# Maintainer: Dan Habot <dan.habot@gmail.com>

pkgname=backup-brute-git
_pkgname=backup-brute
pkgver=1.0.r6.g35021ec
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/danhab99/backup-brute'
# source=('git+git://github.com/danhab99/backup-brute')
source=('git+https://github.com/danhab99/backup-brute.git#tag=1.0')
depends=('go')
makedepends=('go')
md5sums=('SKIP')
pkgdesc='A simple low-overhead backup utility that uses S3 and E2E encryption'

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  set +x
  cd "$srcdir/$_pkgname"
  GO111MODULE=on go build -o "$srcdir/bin/backup-brute"

  echo "Installing systemd service and timer"
  bash -c 'cat >/etc/systemd/system/backup-brute.service <<EOF
[Unit]
Description=Backup Brute Job

[Service]
ExecStart=/usr/bin/backup-brute --backup
OnCalendar=*-*-* 03:00
WakeSystem=true
Persistent=false

[Install]
WantedBy=multi-user.target
EOF'

    bash -c 'cat >/etc/systemd/system/backup-brute.timer <<EOF
[Unit]
Description=Run Backup Brute Job Daily

[Timer]
OnCalendar=daily
AccuracySec=1m
Persistent=true

[Install]
WantedBy=timers.target
EOF'

  echo "Enabling services"

  systemctl daemon-reload
}

package() {
  set +x
  cd "$srcdir/bin"
  install -Dm755 'backup-brute' "$pkgdir/usr/bin/backup-brute"
}

post_remove() {
  rm /etc/systemd/system/backup*
}
