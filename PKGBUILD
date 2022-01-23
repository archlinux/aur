# Maintainer: s7hoang <s7hoang at gmail dot com>
# Contributors: Janne Heß <jannehess at gmail dot com>
pkgname=anki-sync-server-git
pkgver=r425.ef41934
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
backup=(etc/nginx/nginx.conf etc/nginx/sites-available/{anki-sync-server-http,anki-sync-server-https} usr/lib/systemd/system/anki-sync-server.service)

_repo_dir_="$(basename ${source} | cut -f 1 -d '.')"
_anki_dir_="${_repo_dir_}/src"
_install_dir_="/opt/${pkgname%-git}"

pkgver() {
  cd "${_repo_dir_}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # move plugins and systemd file to src package
  local _plugins_="${_anki_dir_}/plugins/"
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
  cp "../nginx_http" "${_plugins_}/nginx/anki-sync-server-http"
  cp "../nginx_https" "${_plugins_}/nginx/anki-sync-server-https"
  cp "../nginx_append_config.awk" "${_plugins_}/nginx/append.awk"

  # set plugins to use current ip address as plugins' target address
  cd "${_anki_dir_}"
  _your_ip_=$(ip route get 1.2.3.4 | awk '{print $7}')
  sed -i "2s/0\.0\.0\.0/${_your_ip_}/" plugins/anki2.0/anki-sync-server.py
  sed -i "3s/0\.0\.0\.0/${_your_ip_})/" plugins/anki2.0/anki-sync-server.py
  sed -i "3s/0\.0\.0\.0/${_your_ip_}/" plugins/anki2.1/anki-sync-server/__init__.py
  sed -i "3s/0\.0\.0\.0/${_your_ip_}/" plugins/anki2.1.28/anki-sync-server/__init__.py

  # change port to 27702 since 27701 will be for nginx
  sed "4s/27701/27702/" ankisyncd.conf -i

  # set user and directory information for systemd service file
  # the user is going to be named the same thing as the package name (minus '-git')
  sed "s/\(User=\)changeme/\1${pkgname%-git}/" plugins/systemd/anki-sync-server.service -i
  sed "s/\(Group=\)changeme/\1${pkgname%-git}/" plugins/systemd/anki-sync-server.service -i
  sed "s|\(WorkingDirectory=\)changeme|\1/opt/${pkgname%-git}|" plugins/systemd/anki-sync-server.service -i

  # build manpage
  local _man_="${_plugins_}/man/man1"
  cd "${srcdir}"
  mkdir -p "${_man_}"
  cat "../anki-sync-server.groff" | gzip > "${_man_}/anki-sync-server.1.gz"
}

package() {
  # anki-sync-server package
  mkdir -p "${pkgdir}${_install_dir_}"
  cp -R "${srcdir}/${_anki_dir_}/." "${pkgdir}${_install_dir_}"

  # manpage
  mkdir -p "${pkgdir}/usr/share/man/man1"
  cp "${srcdir}/${_anki_dir_}/plugins/man/man1/anki-sync-server.1.gz" \
    "${pkgdir}/usr/share/man/man1/anki-sync-server.1.gz"

  # nginx
  mkdir -p "${pkgdir}/etc/nginx/sites-available"
  mkdir -p "${pkgdir}/etc/nginx/sites-enabled"
  cp "${srcdir}/${_anki_dir_}/plugins/nginx/anki-sync-server-http" "${pkgdir}/etc/nginx/sites-available"
  cp "${srcdir}/${_anki_dir_}/plugins/nginx/anki-sync-server-https" "${pkgdir}/etc/nginx/sites-available"

  # systemd service
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp "${srcdir}/${_anki_dir_}/plugins/systemd/anki-sync-server.service" "${pkgdir}/usr/lib/systemd/system/"
}
