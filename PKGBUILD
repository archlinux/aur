# Maintainer: Marvin1099
pkgname=smb-mount-controller-git

pkgver() {
  cd "$srcdir/smb-mount-controller"
  local _desc=$(git describe --tags 2>/dev/null)
  if [[ -n "$_desc" ]]; then
    local _tag="${_desc#v}"
    _tag="${_tag%%-*}"
    local _dist="${_desc##*-}"
    _dist="${_dist#g}"
    _tag="${_tag}.${_dist}"
  else
    _tag=$(git rev-parse --short HEAD)
  fi
  echo "$_tag"
}
pkgrel=1
pkgdesc="A state-based SMB/CIFS mount controller written in bash for Linux that (un)mounts network shares based on reachability"
arch=('any')
url="https://codeberg.org/marvin1099/smb-mount-controller"
license=('AGPL3')
depends=('bash' 'cifs-utils' 'netcat')
optdepends=('systemd: for systemd service file support')
source=("git+https://codeberg.org/marvin1099/smb-mount-controller.git")
md5sums=('SKIP')
install=smb-controller.install

prepare() {
  cd "smb-mount-controller"
  git submodule update --init --recursive
}

package() {
  cd "smb-mount-controller"
  install -Dm755 smb-controller.sh "$pkgdir/usr/local/bin/smb-controller"
  install -Dm644 example-smb-controller.conf "$pkgdir/etc/smb-controller-default.conf"
  install -Dm644 default-smb-controller.service "$pkgdir/etc/systemd/system/smb-controller.service"
}
