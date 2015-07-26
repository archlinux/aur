# Maintainer: David Runge <dave@sleepmap.de>
pkgname=uenv-git
pkgver=0.1.r0.g82b0907
_basename=uenv
pkgrel=3
pkgdesc="Useful scripts, systemd timer/service units and their configuration"
arch=('any')
url="https://sleepmap.de/projects/uenv"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
optdepends=(
  'autossh: For autotunnel (SSH tunnel)'\
  'compton: For compton user service'\
  'cpupower: For cpupower settings on linux-rt'\
  'glances: For monitoring user service (running in separate tmux environment)'\
  'htop: For monitoring user service (running in separate tmux environment)'\
  'irssi: For irssi in a separate tmux environment'\
  'jack2: For profile based JACK user service'\
  'linux-rt: For cpupower and JACK services'\
  'mpd: For mpd user service connecting to server profiles'\
  'rtorrent: For rtorrent user and system service'\
  'tmux: For monitoring, rtorrent and tmux user services'\
  'update-mirrorlist: For timed pacman mirrorlist updates'\
  'weechat: For weechat in a separate tmux environment'
)
provides=('uenv' 'postpone-screensaver')
conflicts=('uenv' 'postpone-screensaver')
replaces=()
backup=(
  'etc/conf.d/fw1'\
  'etc/conf.d/postpone-screensaver'\
  'etc/default/cpupower-rt'\
  'etc/default/rtorrent@.conf'
)
options=()
install=
source=('bare/uenv::git://sleepmap.de/uenv.git')
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir"
}

pkgver() {
  cd "$srcdir/$_basename"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_basename"
  install -d ${pkgdir}/usr/lib/systemd/scripts/
  install -Dm 755 scripts/* ${pkgdir}/usr/lib/systemd/scripts/
  install -d ${pkgdir}/usr/lib/systemd/system/user@.service.d/
  install -Dm 644 system/user@.service.d/dbus.conf ${pkgdir}/usr/lib/systemd/system/user@.service.d/
  install -d ${pkgdir}/usr/lib/systemd/system/
  install -Dm 644 system/{autotunnel@,cpupower-rt,rtorrent@,update-mirrorlist}.* ${pkgdir}/usr/lib/systemd/system/
  install -d ${pkgdir}/usr/lib/systemd/user/
  install -Dm 644 user/* ${pkgdir}/usr/lib/systemd/user/
  install -Dm 644 config/cpupower-rt ${pkgdir}/etc/default/cpupower-rt
  install -Dm 644 config/fw1 ${pkgdir}/etc/conf.d/fw1
  install -Dm 644 config/plot.conf ${pkgdir}/etc/skel/.plot.conf
  install -Dm 644 config/postpone-screensaver ${pkgdir}/etc/conf.d/postpone-screensaver
  install -Dm 644 config/rtorrent@.conf ${pkgdir}/etc/default/rtorrent@.conf
  install -Dm 644 config/autotunnel/example.conf ${pkgdir}/etc/autotunnel/example.conf
  install -Dm 644 README.md ${pkgdir}/usr/share/doc/${_basename}/README.md
}

# vim:set ts=2 sw=2 et:
