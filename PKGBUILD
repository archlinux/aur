# Maintainer: X3n0m0rph59 <x3n0m0rph59@gmail.com>
pkgname=precached-git
_pkgname=precached
pkgver=1.7.1
pkgrel=3
pkgdesc="A Linux process monitor and pre-caching daemon"
arch=('i686' 'x86_64')
url="https://x3n0m0rph59.gitlab.io/precached/"
license=('GPL')
groups=()
depends=('zeromq')
makedepends=('rust' 'libcap' 'zeromq' 'systemd')
optdepends=()
provides=()
conflicts=(precached)
replaces=()
backup=()
options=()
install=${_pkgname}.install
changelog=
source=("precached::git+https://gitlab.com/X3n0m0rph59/precached.git/#branch=master")
noextract=()
md5sums=('SKIP') 

build() {
  cd "$_pkgname"

  CARGO_INCREMENTAL=0 cargo build --all --release
}

package() {
  cd "$_pkgname"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/precached"
  mkdir -p "$pkgdir/etc/precached/rules.d"
  mkdir -p "$pkgdir/var/lib/precached"
  mkdir -p "$pkgdir/var/lib/precached/iotrace"
  mkdir -p "$pkgdir/usr/share/doc/precached/examples"
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  mkdir -p "$pkgdir/usr/lib/systemd/user/"
  mkdir -p "$pkgdir/usr/lib/systemd/system-preset/"
  mkdir -p "$pkgdir/usr/lib/systemd/user-preset/"
  mkdir -p "$pkgdir/usr/share/man/man8/"
  mkdir -p "$pkgdir/usr/share/man/man5/"
  mkdir -p "$pkgdir/usr/share/man/man1/"
  mkdir -p "$pkgdir/usr/share/doc/precached/examples/"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
  mkdir -p "$pkgdir/usr/share/precached/i18n/"
  mkdir -p "$pkgdir/etc/xdg/autostart/"

  chown -R precached:precached "$pkgdir/var/lib/precached"
  
  install -m 755 "target/release/precached" "$pkgdir/usr/bin/"
  install -m 755 "target/release/precachedctl" "$pkgdir/usr/bin/"
  install -m 755 "target/release/iotracectl" "$pkgdir/usr/bin/"
  install -m 755 "target/release/precachedtop" "$pkgdir/usr/bin/"
  install -m 755 "target/release/rulesctl" "$pkgdir/usr/bin/"
  install -m 4755 "target/release/precached-trigger" "$pkgdir/usr/bin/"
  install -m 755 "target/release/precached-debug" "$pkgdir/usr/bin/"

  install -m 644 "support/config/precached.conf" "$pkgdir/etc/precached/"
  install -m 644 "support/config/log4rs.yaml" "$pkgdir/etc/precached/"
  install -m 644 "support/rules/README" "$pkgdir/etc/precached/rules.d/"
  install -m 644 "support/rules/00-log-fork-bombs.rules" "$pkgdir/etc/precached/rules.d/"
  install -m 644 "support/rules/10-cache-on-login.rules" "$pkgdir/etc/precached/rules.d/"
  install -m 644 "support/rules/99-ping-logger.rules" "$pkgdir/etc/precached/rules.d/"
  install -m 644 "support/systemd/precached.service" "$pkgdir/usr/lib/systemd/system/"
  install -m 644 "support/systemd/precached-trigger.service" "$pkgdir/usr/lib/systemd/user/"
  install -m 644 "support/systemd/precached-prime-caches.service" "$pkgdir/usr/lib/systemd/system/"
  install -m 644 "support/systemd/precached-prime-caches.timer" "$pkgdir/usr/lib/systemd/system/"
  install -m 644 "support/systemd/precached.preset" "$pkgdir/usr/lib/systemd/system-preset/50-precached.preset"
  install -m 644 "support/systemd/precached-user.preset" "$pkgdir/usr/lib/systemd/user-preset/50-precached.preset"
  install -m 644 "support/desktop/precached-trigger.desktop" "$pkgdir/etc/xdg/autostart/precached-trigger.desktop"
  
  install -m 644 "support/man/precachedtop.1" "$pkgdir/usr/share/man/man1/"
  install -m 644 "support/man/precached-trigger.1" "$pkgdir/usr/share/man/man1/"
  install -m 644 "support/man/precached-debug.8" "$pkgdir/usr/share/man/man8/"
  install -m 644 "support/man/precached.8" "$pkgdir/usr/share/man/man8/"
  install -m 644 "support/man/precachedctl.8" "$pkgdir/usr/share/man/man8/"
  install -m 644 "support/man/iotracectl.8" "$pkgdir/usr/share/man/man8/"
  install -m 644 "support/man/rulesctl.8" "$pkgdir/usr/share/man/man8/"
  install -m 644 "support/man/precached.conf.5" "$pkgdir/usr/share/man/man5/"
  install -m 644 "support/man/precached.rules.5" "$pkgdir/usr/share/man/man5/"

  cp -ra "support/i18n" "$pkgdir/usr/share/precached/"

  install -m 644 -T "support/shell/completions/en_US/iotracectl.bash-completion" "$pkgdir/usr/share/bash-completion/completions/iotracectl"
  install -m 644 -T "support/shell/completions/en_US/precachedctl.bash-completion" "$pkgdir/usr/share/bash-completion/completions/precachedctl"
  install -m 644 -T "support/shell/completions/en_US/precachedtop.bash-completion" "$pkgdir/usr/share/bash-completion/completions/precachedtop"
  install -m 644 -T "support/shell/completions/en_US/rulesctl.bash-completion" "$pkgdir/usr/share/bash-completion/completions/rulesctl"
  install -m 644 -T "support/shell/completions/en_US/precached-trigger.bash-completion" "$pkgdir/usr/share/bash-completion/completions/precached-trigger"
  install -m 644 -T "support/shell/completions/en_US/precached-debug.bash-completion" "$pkgdir/usr/share/bash-completion/completions/precached-debug"
  install -m 644 -T "support/shell/completions/en_US/iotracectl.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_iotracectl"
  install -m 644 -T "support/shell/completions/en_US/precachedctl.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_precachedctl"
  install -m 644 -T "support/shell/completions/en_US/precachedtop.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_precachedtop"
  install -m 644 -T "support/shell/completions/en_US/rulesctl.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_rulesctl"
  install -m 644 -T "support/shell/completions/en_US/precached-trigger.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_precached-trigger"
  install -m 644 -T "support/shell/completions/en_US/precached-debug.zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_precached-debug"
}
