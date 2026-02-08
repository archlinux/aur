# Maintainer : Lucas Vincent - Brumaire <brumaire at entalpi dot net>

_pkgname=immuarch
pkgbase=immuarch-git
pkgname=("${_pkgname}-core-git" "${_pkgname}-utils-git" "${_pkgname}-verity-git")
pkgver=0.2.0.r271.6a4a7d0
pkgrel=1
pkgdesc="Immutable Archlinux setup with transactional & atomic updates"
url="https://framagit.org/Brumaire/immuarch"
arch=(any)
license=(GPL-3.0-or-later)
makedepends=(git)

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
  optdepends=(
    'gzip: for immuarch-backup'
    'openssh: for immuarch-backup'
    'podman: import OCI images as immuarch root filesystem'
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

package_immuarch-verity-git() {
  provides=("${_pkgname}-verity")
  depends+=("${_pkgname}-core")
  depends+=("aide")
  desc+=" - verity check at boot"
  install="$_pkgname-verity.install"
  options=(emptydirs) 
   backup=(
  "etc/aide-immuarch-root.conf"
  "etc/aide-immuarch-base.conf"
  )

  mkdir -p "$pkgdir/var/log/aide-immuarch-base" ; chmod 700 "$pkgdir/var/log/aide-immuarch-base" 
  mkdir -p "$pkgdir/immuarch/immuarch-verity" ; chmod 700 "$pkgdir/immuarch/immuarch-verity"   
  mkdir -p "$pkgdir/var/log/aide-immuarch-root" ; chmod 700 "$pkgdir/var/log/aide-immuarch-root"
  mkdir -p "$pkgdir/var/lib/aide-immuarch-root" ; chmod 700 "$pkgdir/var/lib/aide-immuarch-root"
  ln -s "/immuarch/immuarch-verity" "$pkgdir/var/lib/aide-immuarch-base"

  install -Dm700 "$srcdir/$_pkgname/src/verity/etc/aide-immuarch-base.conf" "$pkgdir/etc/aide-immuarch-base.conf"
  install -Dm700 "$srcdir/$_pkgname/src/verity/etc/aide-immuarch-root.conf" "$pkgdir/etc/aide-immuarch-root.conf"

  install -Dm744 "$srcdir/$_pkgname/src/verity/systemd/immuarch-base-verity-check.service" "$pkgdir/usr/lib/systemd/system/immuarch-base-verity-check.service"
  install -Dm744 "$srcdir/$_pkgname/src/verity/systemd/immuarch-root-verity-check.service" "$pkgdir/usr/lib/systemd/system/immuarch-root-verity-check.service"
  install -Dm744 "$srcdir/$_pkgname/src/verity/systemd/immuarch-verity.target" "$pkgdir/usr/lib/systemd/system/immuarch-verity.target"
  mkdir -p "$pkgdir/usr/lib/systemd/system/immuarch-verity.target.wants" ; chmod 744 "$pkgdir/usr/lib/systemd/system/immuarch-verity.target.wants"
  ln -s '../immuarch-base-verity-check.service' "$pkgdir/usr/lib/systemd/system/immuarch-verity.target.wants/immuarch-base-verity-check.service"
  ln -s '../immuarch-root-verity-check.service' "$pkgdir/usr/lib/systemd/system/immuarch-verity.target.wants/immuarch-root-verity-check.service"
  mkdir -p "$pkgdir/usr/lib/systemd/system/multi-user.target.wants" ; chmod 744 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s '../immuarch-verity.target' "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/immuarch-verity.target"

  install -Dm700 "$srcdir/$_pkgname/src/verity/hooks/post.d/90-aide-immuarch-init.sh" "$pkgdir/immuarch/immuarch-etc/hooks/post.d/90-aide-immuarch-init.sh"
  install -Dm700 "$srcdir/$_pkgname/src/verity/hooks/post-overlay.d/99-aide-immuarch-init.sh" "$pkgdir/immuarch/immuarch-etc/hooks/post-overlay.d/99-aide-immuarch-init.sh"
}
