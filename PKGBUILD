# Maintainer: Basem Aljedai <baljedai@gmail.com>
pkgname=omarchy-prayer
pkgver=0.4.2
pkgrel=1
pkgdesc="Muslim prayer-time notifier for Omarchy: notifications + adhan, Quickshell/waybar countdown widget, themed TUI, qibla, hijri, adhan catalog"
arch=('any')
url="https://github.com/mrCode/omarchy-prayer"
license=('MIT')
depends=('ruby' 'ruby-tomlrb' 'ruby-racc' 'libnotify' 'mpv' 'curl' 'systemd')
optdepends=('waybar: bar widget on Omarchy 3 and other Hyprland setups'
            'mako: notification daemon on Omarchy 3 and other Hyprland setups'
            'hyprland: reference window manager')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6938ede65d2fbafde63da28e3940ab08566ea95781cd09b04b2dd704fc82b322')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Run the test suite if Ruby + tomlrb are available during makepkg build.
  # minitest/webrick ship with Ruby 3.x; no Gemfile install needed at check time.
  if ruby -e 'require "tomlrb"' 2>/dev/null; then
    ruby -Ilib -Itest -e 'Dir["test/test_*.rb"].each { |f| require File.expand_path(f) }'
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local libdir="${pkgdir}/usr/share/${pkgname}/lib"
  local bindir="${pkgdir}/usr/bin"
  local unitdir="${pkgdir}/usr/lib/systemd/user"

  # Library
  install -dm755 "${libdir}/omarchy_prayer"
  cp -r lib/omarchy_prayer/. "${libdir}/omarchy_prayer/"

  # Entry scripts — pin shebang to /usr/bin/ruby so user-managed Rubies
  # (mise/rbenv/asdf/chruby) don't shadow the system Ruby that owns the
  # ruby-tomlrb / ruby-racc gems pacman installed as deps. Also rewrite
  # $LOAD_PATH to point at the installed lib.
  install -dm755 "${bindir}"
  for s in omarchy-prayer omarchy-prayer-schedule omarchy-prayer-notify \
           omarchy-prayer-waybar omarchy-prayer-stop; do
    sed -e '1s|^#!/usr/bin/env ruby$|#!/usr/bin/ruby|' \
        -e "s|\$LOAD_PATH.unshift File.expand_path('../lib', __dir__)|\$LOAD_PATH.unshift '/usr/share/${pkgname}/lib'|" \
        "bin/${s}" > "${bindir}/${s}"
    chmod 755 "${bindir}/${s}"
  done

  # Omarchy 4 Quickshell bar widget. The shell only scans
  # ~/.config/omarchy/plugins/, so `omarchy-prayer setup` copies this into
  # $HOME; pacman just ships the canonical source.
  install -dm755 "${pkgdir}/usr/share/${pkgname}/shell-plugin"
  cp -r share/omarchy-shell-plugin/. "${pkgdir}/usr/share/${pkgname}/shell-plugin/"

  # Systemd user units — rewrite ExecStart from the manual-install path
  # (%h/.local/bin/, used by ./install.sh) to the system path so the daily
  # rebuild timer + resume hook can find the binaries pacman installed.
  install -dm755 "${unitdir}"
  install -m644 share/systemd/omarchy-prayer-schedule.service "${unitdir}/"
  install -m644 share/systemd/omarchy-prayer-schedule.timer   "${unitdir}/"
  install -m644 share/systemd/omarchy-prayer-resume.service   "${unitdir}/"
  sed -i 's|%h/\.local/bin/|/usr/bin/|g' \
    "${unitdir}/omarchy-prayer-schedule.service" \
    "${unitdir}/omarchy-prayer-resume.service"

  # NetworkManager dispatcher — fires omarchy-prayer-schedule.service on every
  # connection-up event so auto-relocate runs as soon as the user joins a new
  # network. Falls back to the daily/startup/resume triggers if NM is absent.
  install -Dm755 share/networkmanager/90-omarchy-prayer \
    "${pkgdir}/etc/NetworkManager/dispatcher.d/90-omarchy-prayer"

  # License + docs
  install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
