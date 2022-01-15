# Maintainer: s7hoang <s7hoang at gmail dot com>
# Contributors: Janne Heß <jannehess at gmail dot com>
pkgname=anki-sync-server-git
pkgver=r379.44ab07f
pkgrel=1
pkgdesc="A sync server for anki using a forked version from github.com/ankicommunity (orig:dsnopek)"
arch=('any')
url="https://github.com/ankicommunity/anki-sync-server"
license=('GPL')
provides=('anki-sync-server')
conflicts=('anki-sync-server')
depends=('python' 'python-pip' 'nginx')
makedepends=('git' 'portaudio')
optdepends=()
install=anki-sync-server.install
source=('git+https://github.com/ankicommunity/anki-sync-server.git')
md5sums=('SKIP')

_repo_dir="$(basename ${source} | cut -f 1 -d '.')"
_anki_dir="${_repo_dir}/src"
_install_dir="/opt/${pkgname%-git}"

pkgver() {
  cd "${_repo_dir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # move plugins and systemd file to src package
  local _plugins_="${_anki_dir}/plugins/"
  mkdir -p "${_plugins_}"
  mkdir -p "${_plugins_}/anki2.0/"
  mkdir -p "${_plugins_}/anki2.1/anki-sync-server"
  mkdir -p "${_plugins_}/anki2.1.28/anki-sync-server"
  mkdir -p "${_plugins_}/nginx/"
  mkdir -p "${_plugins_}/systemd/"
  cp "../anki2.0.py" "${_plugins_}/anki2.0/anki-sync-server.py"
  cp "../anki2.1.py" "${_plugins_}/anki2.1/anki-sync-server/__init__.py"
  cp "../anki2.1.28.py" "${_plugins_}/anki2.1.28//anki-sync-server/__init__.py"
  cp "../anki-sync-server.service" "${_plugins_}/systemd/"
  cp "../nginx_config" "${_plugins_}/nginx/config"
  cp "../nginx_append_config.awk" "${_plugins_}/nginx/append.awk"

  # set plugins to use current ip address as plugins' target address
  cd "${_anki_dir}"
  _your_ip_=$(ip route get 1.2.3.4 | awk '{print $7}')
  sed -i "2s/0\.0\.0\.0/${_your_ip_}/" plugins/anki2.0/anki-sync-server.py
  sed -i "3s/0\.0\.0\.0/${_your_ip_})/" plugins/anki2.0/anki-sync-server.py
  sed -i "3s/0\.0\.0\.0/${_your_ip_}/" plugins/anki2.1/anki-sync-server/__init__.py
  sed -i "3s/0\.0\.0\.0/${_your_ip_}/" plugins/anki2.1.28/anki-sync-server/__init__.py
  sed -i "7s/0\.0\.0\.0/${_your_ip_}/" plugins/nginx/config

  # set current ip address as the server's ip address and change port
  sed "3s/0\.0\.0\.0/${_your_ip_}/" ankisyncd.conf -i
  sed "4s/27701/27702/" ankisyncd.conf -i

  # set user and directory information for systemd service file
  # the user is going to be named the same thing as the package name (minus '-git')
  sed "8s/changeme/${pkgname%-git}/" plugins/systemd/anki-sync-server.service -i
  sed "9s/changeme/${pkgname%-git}/" plugins/systemd/anki-sync-server.service -i
  sed "10s|changeme|/opt/${pkgname%-git}|" plugins/systemd/anki-sync-server.service -i
}

package() {
  mkdir -p "${pkgdir}${_install_dir}"
  cp -R "${srcdir}/${_anki_dir}/." "${pkgdir}${_install_dir}"
}
