# Maintainer: Snry Shell <snry@shell.dev>
pkgname=snry-shell-qs
pkgver=1.0.0
pkgrel=1
pkgdesc='Snry Shell - Hyprland dotfiles managed by Ansible'
arch=('any')
url='https://github.com/sonroyaalmerol/dots-hyprland'
license=('MIT')
depends=('ansible-core' 'git' 'rsync' 'python' 'uv' 'sudo' 'findutils' 'which')
makedepends=('git' 'go')
source=("git+https://github.com/sonroyaalmerol/dots-hyprland.git")
sha256sums=('SKIP')
backup=()
install=snry-shell-qs.install

package() {
  cd "$srcdir/dots-hyprland"
  install -dm755 "$pkgdir/usr/share/snry-shell"
  cp -a ansible.cfg inventory.ini requirements.yml setup.yml uninstall.yml diagnose.yml checkdeps.yml group_vars roles data files files-extra "$pkgdir/usr/share/snry-shell/"

  # Build and ship osk-watcher
  cd "$srcdir/dots-hyprland/scripts/osk-watcher"
  go build -o osk-watcher .
  install -dm755 "$pkgdir/usr/share/snry-shell/scripts/osk-watcher"
  install -Dm755 osk-watcher "$pkgdir/usr/share/snry-shell/scripts/osk-watcher/osk-watcher"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/snry-shell" <<'SCRIPT'
#!/bin/bash
BASE=/usr/share/snry-shell
ansible-galaxy collection install -r $BASE/requirements.yml "$@"

case "${1:-}" in
  uninstall)  exec ansible-playbook --ask-become-pass $BASE/uninstall.yml "${@:2}" ;;
  diagnose)   exec ansible-playbook --ask-become-pass $BASE/diagnose.yml "${@:2}" ;;
  checkdeps)  exec ansible-playbook --ask-become-pass $BASE/checkdeps.yml "${@:2}" ;;
  *)          exec ansible-playbook --ask-become-pass $BASE/setup.yml "$@" ;;
esac
SCRIPT
}