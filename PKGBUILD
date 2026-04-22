# Maintainer: Basem Aljedai <baljedai@gmail.com>
pkgname=omarchy-prayer
pkgver=0.1.1
pkgrel=2
pkgdesc="Muslim prayer-time notifier for Omarchy: mako + adhan, waybar countdown, themed TUI, qibla, hijri, adhan catalog"
arch=('any')
url="https://github.com/mrCode/omarchy-prayer"
license=('MIT')
depends=('ruby' 'ruby-tomlrb' 'ruby-racc' 'libnotify' 'mako' 'waybar' 'mpv' 'curl' 'systemd')
optdepends=('hyprland: reference window manager for bundled waybar integration')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bbd290aa0bc06f2b7bf02a114e0e5ec544e3373856f5f743d78a8aaa75cc0fa2')

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

  # Systemd user units
  install -dm755 "${unitdir}"
  install -m644 share/systemd/omarchy-prayer-schedule.service "${unitdir}/"
  install -m644 share/systemd/omarchy-prayer-schedule.timer   "${unitdir}/"
  install -m644 share/systemd/omarchy-prayer-resume.service   "${unitdir}/"

  # License + docs
  install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
