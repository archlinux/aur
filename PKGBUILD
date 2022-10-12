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
source=('git+https://github.com/ankicommunity/anki-sync-server.git#branch=main'
        'anki2.0.py'
        'anki2.1.28.py'
        'anki2.1.py'
        'anki-sync-server.groff'
        'anki-sync-server.install'
        'anki-sync-server.service'
        'nginx_append_config.awk'
        'nginx_http'
        'nginx_https')
sha256sums=('SKIP'
            '5f6c65418841bd638065b7c874a267898f8abb1c5c56dfd47c5908a4f9a83465'
            'df3efb08711b0ef9be3a2e264cd54bd8d50d77576f538f499dcbfce1c4b4d9df'
            'cc2ec96b2ec18d8b161f0c8233c1ddff58cddb59bfd05e1c5910eb7ef0ce9c93'
            '48ed322539cff276909d8eb6d81c17c776e1f2ec6353ce6aef1b8a559271b0ad'
            'c334dc381dc1abf44494ae73b64335e7a3df6151c661657ae0d639f01f9f0fb1'
            'eb6b4f2682290e341a377bee12246c076816789d8f716fdd26c7367a47408e91'
            'e8b0bc5a03fd39423c64fc804199b258d53f2ad5327954d74d3a3be0dfe7924a'
            '9a48034fabdf487502663149d7cfd4a59bdf0e116e681c790e0c39b23267d7cb'
            '7638620d532a55e3423cee9ee7905941ef81fae1b024bf7960bee1b9dcd65efe')

backup=(etc/nginx/sites-available/{anki-sync-server-http,anki-sync-server-https} usr/lib/systemd/system/anki-sync-server.service)

_install_dir_="/opt/${pkgname%-git}"

pkgver() {
  cd "${srcdir}/anki-sync-server"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # move plugins and systemd file to src package
  local _anki_dir_="${srcdir}/anki-sync-server/src"
  local _plugins_="${_anki_dir_}/plugins"
  mkdir -p "${_plugins_}"
  mkdir -p "${_plugins_}/anki2.0/"
  mkdir -p "${_plugins_}/anki2.1/anki-sync-server"
  mkdir -p "${_plugins_}/anki2.1.28/anki-sync-server"
  mkdir -p "${_plugins_}/nginx/"
  mkdir -p "${_plugins_}/systemd/"
  cp "${srcdir}/anki2.0.py" "${_plugins_}/anki2.0/anki-sync-server.py"
  cp "${srcdir}/anki2.1.py" "${_plugins_}/anki2.1/anki-sync-server/__init__.py"
  cp "${srcdir}/anki2.1.28.py" "${_plugins_}/anki2.1.28//anki-sync-server/__init__.py"
  cp "${srcdir}/anki-sync-server.service" "${_plugins_}/systemd/"
  cp "${srcdir}/nginx_http" "${_plugins_}/nginx/anki-sync-server-http"
  cp "${srcdir}/nginx_https" "${_plugins_}/nginx/anki-sync-server-https"
  cp "${srcdir}/nginx_append_config.awk" "${_plugins_}/nginx/append.awk"

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
  local _anki_dir_="${srcdir}/anki-sync-server/src"

  # anki-sync-server package
  mkdir -p "${pkgdir}${_install_dir_}"
  cp -R "${_anki_dir_}/." "${pkgdir}${_install_dir_}"

  # manpage
  mkdir -p "${pkgdir}/usr/share/man/man1"
  cp "${_anki_dir_}/plugins/man/man1/anki-sync-server.1.gz" \
    "${pkgdir}/usr/share/man/man1/anki-sync-server.1.gz"

  # nginx
  mkdir -p "${pkgdir}/etc/nginx/sites-available"
  mkdir -p "${pkgdir}/etc/nginx/sites-enabled"
  cp "${_anki_dir_}/plugins/nginx/anki-sync-server-http" "${pkgdir}/etc/nginx/sites-available"
  cp "${_anki_dir_}/plugins/nginx/anki-sync-server-https" "${pkgdir}/etc/nginx/sites-available"

  # systemd service
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp "${_anki_dir_}/plugins/systemd/anki-sync-server.service" "${pkgdir}/usr/lib/systemd/system/"
}
