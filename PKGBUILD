# Maintainer : Lucas Vincent - Brumaire <brumaire at entalpi dot net>

_pkgname=immuarch
pkgbase=immuarch-git
pkgname=("${_pkgname}-core-git" "${_pkgname}-utils-git")
pkgver=0.1.2.r227.a10a589
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
  'gzip: for immuarch-backup'
  'openssh: for immuarch-backup'
  'podman: import OCI images as immuarch root filesystem'
)

source=(git+https://framagit.org/Brumaire/immuarch)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(cat "$srcdir/$_pkgname/VERSION" 2>/dev/null || echo "0.0.0" ).$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")"
}

package_immuarch-core-git() {
  depends+=("${_pkgname}-utils-git=$pkgver")
  provides=("${_pkgname}-core")
  replaces=("${_pkgname}-git")
  desc+=" - part outside of FHS"
  install="$_pkgname.install"
  options=(emptydirs) 
  backup=(
  "immuarch/immuarch-etc/env.conf"
  "immuarch/immuarch-etc/subvolumes.conf"
  "immuarch/immuarch-etc/add-bind-mount-runtime.conf"
  "immuarch/immuarch-etc/add-fstab.conf"
  )
  
  local _DIR_PREFIX="immuarch-"
  local _BASE_DIR="immuarch"
  local _SV_DIR="${_BASE_DIR:?}/${_DIR_PREFIX:?}subvolumes"
  local _CONTROL_DIR="${_BASE_DIR:?}/${_DIR_PREFIX:?}bin"
  local _UTILS_DIR="${_BASE_DIR:?}/${_DIR_PREFIX:?}lib"
  local _JOURNAL_DIR="${_BASE_DIR:?}/${_DIR_PREFIX:?}journal"
  local _CONF_DIR="${_BASE_DIR:?}/${_DIR_PREFIX:?}etc"
  local _BACKUP_DIR="${_BASE_DIR:?}/.${_DIR_PREFIX:?}backup-workspace"
  local _HOOKS_DIR="${_BASE_DIR:?}/${_DIR_PREFIX:?}etc/hooks"
  
  cd "$pkgdir"

  mkdir "$pkgdir/${_BASE_DIR:?}" ; chmod 744 "$pkgdir/${_BASE_DIR:?}"
  mkdir "$pkgdir/${_SV_DIR:?}" ; chmod 700 "$pkgdir/${_SV_DIR:?}"
  mkdir "$pkgdir/${_CONTROL_DIR:?}" ; chmod 700 "$pkgdir/${_CONTROL_DIR:?}"
  mkdir "$pkgdir/${_UTILS_DIR:?}"; chmod 700 "$pkgdir/${_UTILS_DIR:?}"
  mkdir "$pkgdir/${_JOURNAL_DIR:?}" ; chmod 700 "$pkgdir/${_JOURNAL_DIR:?}"
  mkdir "$pkgdir/${_CONF_DIR:?}" ; chmod 700 "$pkgdir/${_CONF_DIR:?}"
  mkdir "$pkgdir/${_BACKUP_DIR:?}" ; chmod 700 "$pkgdir/${_BACKUP_DIR:?}"
  mkdir "$pkgdir/${_UTILS_DIR:?}/evolve" ; chmod 700 "$pkgdir/${_UTILS_DIR:?}/evolve"
  mkdir "$pkgdir/${_HOOKS_DIR:?}" ; chmod 700 "$pkgdir/${_HOOKS_DIR:?}"
  mkdir "$pkgdir/${_HOOKS_DIR:?}/pre.d" ; chmod 700 "$pkgdir/${_HOOKS_DIR:?}/pre.d"
  mkdir "$pkgdir/${_HOOKS_DIR:?}/post.d" ; chmod 700 "$pkgdir/${_HOOKS_DIR:?}/post.d"
  mkdir "$pkgdir/${_HOOKS_DIR:?}/pre-overlay.d" ; chmod 700 "$pkgdir/${_HOOKS_DIR:?}/pre-overlay.d"
  mkdir "$pkgdir/${_HOOKS_DIR:?}/post-overlay.d" ; chmod 700 "$pkgdir/${_HOOKS_DIR:?}/post-overlay.d"

  install -Dm700 "$srcdir/$_pkgname/src/evolve.sh" "$pkgdir/${_CONTROL_DIR:?}"
  install -Dm700 "$srcdir/$_pkgname/src/backup.sh" "$pkgdir/${_CONTROL_DIR:?}"

  install -Dm600 "$srcdir/$_pkgname/config/env.conf" "$pkgdir/${_CONF_DIR:?}/env.conf"
  install -Dm600 "$srcdir/$_pkgname/config/subvolumes.conf" "$pkgdir/${_CONF_DIR:?}/subvolumes.conf"
  install -Dm600 "$srcdir/$_pkgname/config/add-bind-mount-runtime.conf" "$pkgdir/${_CONF_DIR:?}/add-bind-mount-runtime.conf"
  install -Dm600 "$srcdir/$_pkgname/config/add-fstab.conf" "$pkgdir/${_CONF_DIR:?}/add-fstab.conf"

  install -Dm700 "$srcdir/$_pkgname/src/utils/evolve/"*.sh "$pkgdir/${_UTILS_DIR:?}/evolve"
  install -Dm700 "$srcdir/$_pkgname/src/utils/"*.sh "$pkgdir/${_UTILS_DIR:?}"
}

package_immuarch-utils-git() {
  provides=("${_pkgname}-utils")
  desc+=" - part inside the FHS"
  cd "$pkgdir"

  install -Dm700 "$srcdir/$_pkgname/src/boot/immuarch-make-overlay.sh" "$pkgdir/usr/bin/immuarch-make-overlay.sh" 
  install -Dm600 "$srcdir/$_pkgname/src/boot/initcpio/install/sd-immuarch" "$pkgdir/usr/lib/initcpio/install/sd-immuarch"
  install -Dm600 "$srcdir/$_pkgname/src/boot/systemd/initrd-immuarch-switch-root.service" "$pkgdir/usr/lib/systemd/system/initrd-immuarch-switch-root.service"

  #bin
  install -Dm755 "$srcdir/$_pkgname/src/bin/immuarch-evolve.sh" "$pkgdir/usr/bin/immuarch-evolve"
  install -Dm755 "$srcdir/$_pkgname/src/bin/immuarch-backup.sh" "$pkgdir/usr/bin/immuarch-backup"
}
