# Maintainer: s7hoang <s7hoang at gmail dot com>
pkgname=anki-sync-server-git
pkgver=r295.0c6a86d
pkgrel=1
pkgdesc="A sync server for anki using a forked version from github.com/ankicommunity (orig:dsnopek)"
arch=('any')
url="https://github.com/ankicommunity/anki-sync-server"
license=('GPL')
provides=('anki-sync-server')
conflicts=('anki-sync-server')
depends=('python' 'python-pip')
makedepends=('portaudio' 'git')
optdepends=('python-pyqt5: dependency of bundled anki client'
'python-pyqtwebengine: dependency of bundled anki client'
'python-beautifulsoup4: dependency of bundled anki client'
'python-send2trash: dependency of bundled anki client'
'python-pyaudio: dependency of bundled anki client'
'python-requests: dependency of bundled anki client'
'python-decorator: dependency of bundled anki client'
'python-markdown: dependency of bundled anki client'
'python-psutil: dependency of bundled anki client'
'mplayer: optional dependency of bundled anki client'
'python-webob: if you want to run the server as a user other than the supplied anki-sync-server user'
'python-decorator: if you want to run the server as a user other than the supplied anki-sync-server user'
)
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

build(){
  #initialize anki-bundled (needed for the server to work)
  cd "${_anki_dir}/anki-bundled" && git submodule update --init
}

prepare() {
  # move plugins and systemd file to src package
  mkdir -p "${_anki_dir}/plugins/anki2.0"
  mkdir -p "${_anki_dir}/plugins/anki2.1/ankisyncd"
  mkdir -p "${_anki_dir}/plugins/systemd"
  cp ../anki-sync-server.py "${_anki_dir}/plugins/anki2.0"
  cp ../__init__.py "${_anki_dir}/plugins/anki2.1/ankisyncd"
  cp ../anki-sync-server.service "${_anki_dir}/plugins/systemd"

  cd "${_anki_dir}"
  # set plugins to use current ip address as plugins' target address
  sed -i "2s/0\.0\.0\.0/$(ip route get 1.2.3.4 | awk '{print $7}')/" \
  plugins/anki2.0/anki-sync-server.py
  sed -i "3s/0\.0\.0\.0/$(ip route get 1.2.3.4 | awk '{print $7}')/" \
  plugins/anki2.0/anki-sync-server.py
  sed -i "3s/0\.0\.0\.0/$(ip route get 1.2.3.4 | awk '{print $7}')/" \
  plugins/anki2.1/ankisyncd/__init__.py

  # set current ip address as the server's ip address
  sed "3s/0\.0\.0\.0/$(ip route get 1.2.3.4 | awk '{print $7}')/" ankisyncd.conf -i

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
