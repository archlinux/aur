pkgname=backup-brute-git
_pkgname=backup-brute
pkgver=1.0.r6.g35021ec
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/danhab99/backup-brute'
# source=('git+git://github.com/danhab99/backup-brute')
source=('git+https://github.com/danhab99/backup-brute.git')
depends=('go')
makedepends=('go')
md5sums=('SKIP')

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

read -r -p "Do you want to create the backup-brute service file? (yes/no): " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
echo "Installing systemd service and timer"
sudo bash -c 'cat >/etc/systemd/system/backup-brute.service <<EOF
[Unit]
Description=Backup Brute Job

[Service]
ExecStart=/usr/bin/backup-brute

[Install]
WantedBy=multi-user.target
EOF'


sudo bash -c 'cat >/etc/systemd/system/backup-brute.timer <<EOF
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

  sudo systemctl daemon-reload

  sudo systemctl start backup-brute.service
  sudo systemctl enable backup-brute.service

  sudo systemctl start backup-brute.timer
  sudo systemctl enable backup-brute.timer
fi
}

package() {
  set +x
  cd "$srcdir/bin"
  install -Dm755 'backup-brute' "$pkgdir/usr/bin/backup-brute"
}

post_remove() {
  sudo rm /etc/systemd/system/backup*

  sudo systemctl stop backup-brute.service
  sudo systemctl disable backup-brute.service

  sudo systemctl stop backup-brute.timer
  sudo systemctl disable backup-brute.timer

  sudo systemctl daemon-reload
}
