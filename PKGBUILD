# Maintainer : Lucas Vincent - Brumaire <lucas dot vincent at entalpi dot net>

_pkgname=immuarch
pkgname=${_pkgname}-git
pkgver=0.0.1.r156.94ccd0e
pkgrel=1
pkgdesc="Immutable Archlinux setup with transactional & atomic updates"
url="https://framagit.org/Brumaire/immuarch"
arch=(any)
license=(GPL-3.0-or-later)
makedepends=(
  git
)
depends=(
  util-linux
  btrfs-progs
  grub
  bash
  grep
  sed
  mkinitcpio
)

optdepends=(
  'gzip: for backup utility'
  'openssh: for backup utility'
)

options=(
 emptydirs
)

source=(git+https://framagit.org/Brumaire/immuarch)
md5sums=('SKIP')

install="$_pkgname.install"

backup=(
  immuarch/immuarch-etc/env.conf
  immuarch/immuarch-etc/rw-subvolumes.conf
  immuarch/immuarch-etc/user-bind-mount-runtime.conf
  immuarch/immuarch-etc/user-fstab.conf
)

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(cat "$srcdir/$_pkgname/VERSION" 2>/dev/null || echo "0.0.0" ).$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")"
}

package() {
  cd "$pkgdir"
  
  local _DIR_PREFIX="immuarch-"
  local _BASE_DIR="immuarch"
  local _SV_DIR="$_BASE_DIR/${_DIR_PREFIX}subvolumes"
  local _CONTROL_DIR="$_BASE_DIR/${_DIR_PREFIX}bin"
  local _UTILS_DIR="$_BASE_DIR/${_DIR_PREFIX}lib"
  local _HIST_DIR="$_BASE_DIR/${_DIR_PREFIX}history"
  local _CONF_DIR="$_BASE_DIR/${_DIR_PREFIX}etc"
  local _BACKUP_DIR="$_BASE_DIR/.${_DIR_PREFIX}backup-workspace"

  mkdir "$pkgdir/$_BASE_DIR" ; chmod 744 "$pkgdir/$_BASE_DIR"
  mkdir "$pkgdir/$_SV_DIR" ; chmod 700 "$pkgdir/$_SV_DIR"
  mkdir "$pkgdir/$_CONTROL_DIR" ; chmod 700 "$pkgdir/$_CONTROL_DIR"
  mkdir "$pkgdir/$_UTILS_DIR"; chmod 700 "$pkgdir/$_UTILS_DIR"
  mkdir "$pkgdir/$_HIST_DIR" ; chmod 700 "$pkgdir/$_HIST_DIR"
  mkdir "$pkgdir/$_CONF_DIR" ; chmod 700 "$pkgdir/$_CONF_DIR"
  mkdir "$pkgdir/$_BACKUP_DIR" ; chmod 700 "$pkgdir/$_BACKUP_DIR"
  mkdir "$pkgdir/$_UTILS_DIR/evolve" ; chmod 700 "$pkgdir/$_UTILS_DIR/evolve"

  install -Dm700 "$srcdir/$_pkgname/src/evolve.sh" "$pkgdir/$_CONTROL_DIR"
  install -Dm700 "$srcdir/$_pkgname/src/backup.sh" "$pkgdir/$_CONTROL_DIR"

  install -Dm600 "$srcdir/$_pkgname/config/env.conf" "$pkgdir/$_CONF_DIR/env.conf"
  install -Dm600 "$srcdir/$_pkgname/config/rw-subvolumes.conf" "$pkgdir/$_CONF_DIR/rw-subvolumes.conf"
  install -Dm600 "$srcdir/$_pkgname/config/user-bind-mount-runtime.conf" "$pkgdir/$_CONF_DIR/user-bind-mount-runtime.conf"
  install -Dm600 "$srcdir/$_pkgname/config/user-fstab.conf" "$pkgdir/$_CONF_DIR/user-fstab.conf"

  install -Dm700 "$srcdir/$_pkgname/src/utils/evolve/"*.sh "$pkgdir/$_UTILS_DIR/evolve"
  install -Dm700 "$srcdir/$_pkgname/src/utils/"*.sh "$pkgdir/$_UTILS_DIR"

  install -Dm700 "$srcdir/$_pkgname/src/boot/immuarch-make-overlay.sh" "$pkgdir/usr/bin/immuarch-make-overlay.sh" 
  install -Dm600 "$srcdir/$_pkgname/src/boot/initcpio/install/sd-immuarch" "$pkgdir/usr/lib/initcpio/install/sd-immuarch"
  install -Dm600 "$srcdir/$_pkgname/src/boot/systemd/initrd-immuarch-switch-root.service" "$pkgdir/usr/lib/systemd/system/initrd-immuarch-switch-root.service"

  #useful symlinks
  ln -s /immuarch/immuarch-bin/evolve.sh "$pkgdir/usr/bin/immuarch-evolve"
  ln -s /immuarch/immuarch-bin/backup.sh "$pkgdir/usr/bin/immuarch-backup"

}
