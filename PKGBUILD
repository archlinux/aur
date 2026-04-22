# Maintainer: Basem Aljedai <baljedai@gmail.com>
pkgname=omarchy-prayer
pkgver=0.1.0
pkgrel=1
pkgdesc="Muslim prayer-time notifier for Omarchy: mako + adhan, waybar countdown, themed TUI, qibla, hijri, adhan catalog"
arch=('any')
url="https://github.com/mrCode/omarchy-prayer"
license=('MIT')
depends=('ruby' 'ruby-tomlrb' 'libnotify' 'mako' 'waybar' 'mpv' 'curl' 'systemd')
optdepends=('hyprland: reference window manager for bundled waybar integration')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fbce46ccac8c7d1f51e61013a4510b1928ae123e0c1b00ed8c5e493ea9a1ec9f')

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

  # Entry scripts — rewrite $LOAD_PATH to point at the installed lib.
  install -dm755 "${bindir}"
  for s in omarchy-prayer omarchy-prayer-schedule omarchy-prayer-notify \
           omarchy-prayer-waybar omarchy-prayer-stop; do
    sed "s|\$LOAD_PATH.unshift File.expand_path('../lib', __dir__)|\$LOAD_PATH.unshift '/usr/share/${pkgname}/lib'|" \
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
