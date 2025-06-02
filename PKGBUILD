# Maintainer: Yajat Rangnekar <yajatrangnekar@gmail.com>
pkgname=cli-reminder
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI reminder application with TUI and notification support"
arch=('x86_64')
url="https://github.com/Skeleton-Hacker/CLI_Reminder"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
optdepends=('libnotify: for desktop notifications')
source=("git+https://github.com/Skeleton-Hacker/CLI_Reminder.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/CLI_Reminder/remindme/"
  cargo build --release
}

package() {
  cd "$srcdir/CLI_Reminder"
  
  # Install binary
  install -Dm755 "remindme/target/release/remindme" "$pkgdir/usr/bin/remindme"
  
  # Create systemd service files
  mkdir -p "$pkgdir/usr/lib/systemd/user"
  
  # Create service file with proper environment variables
  cat > "$pkgdir/usr/lib/systemd/user/remindme-check.service" << EOF
[Unit]
Description=Check for due reminders

[Service]
Type=oneshot
ExecStart=/usr/bin/remindme notify --desktop
# Using %t expands to the user's runtime directory: /run/user/\$UID
Environment=DBUS_SESSION_BUS_ADDRESS=unix:path=%t/bus
# Inherit DISPLAY from user environment instead of hardcoding
EOF
  
  # Create timer file
  cat > "$pkgdir/usr/lib/systemd/user/remindme-check.timer" << EOF
[Unit]
Description=Periodically check for due reminders

[Timer]
OnBootSec=1s
OnUnitActiveSec=1s
AccuracySec=1s

[Install]
WantedBy=timers.target
EOF

  # Install desktop entry
  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/remindme.desktop" << EOF
[Desktop Entry]
Name=RemindMe
Comment=CLI Reminder Application
Exec=/usr/bin/remindme
Icon=appointment-soon
Terminal=true
Type=Application
Categories=Utility;
EOF

  # Create documentation directory and files
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  if [ -f "setup.sh" ]; then
    install -Dm644 "setup.sh" "$pkgdir/usr/share/doc/$pkgname/setup.sh"
  fi
  
  # Create configuration directory
  mkdir -p "$pkgdir/etc/remindme"
  echo '[]' > "$pkgdir/etc/remindme/reminders.json.example"
}