# Maintainer: s7hoang <s7hoang at gmail dot com>
pkgname=anki-sync-server-git
pkgver=r259.7ef3d4f
pkgrel=1
pkgdesc="A sync server for anki using a forked version from github.com/tsudoko (orig:dsnopek)"
arch=('any')
url="https://github.com/tsudoko/anki-sync-server"
license=('GPL')
provides=('anki-sync-server')
conflicts=('anki-sync-server')
depends=('python' 'python-pip')
makedepends=('portaudio')
optdepends=('python-pyqt5: dependency of bundled anki client' 
'python-pyqtwebengine: dependency of bundled anki client'
'libvpx>=1.8.0-1: dependency of bundled anki client'
'double-conversion>=3.1.4-1: dependency of bundled anki client'
'qt5-base>=5.12.2-1.1: dependency of bundled anki client'
'qt5ct>=0.38-1: dependency of bundled anki client'
'qt5-svg>=5.12.2-1: dependency of bundled anki client'
'portaudio: dependency of pyaudio which is a dependency of bundled anki'
'mpv: optional dependency of bundled anki client'
'python2-webob: if you want to run the server as a user other than the supplied anki-sync-server user'
'python2-decorator: if you want to run the server as a user other than the supplied anki-sync-server user'
)
install=anki-sync-server.install
source=('git+https://github.com/tsudoko/anki-sync-server')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # move plugins and systemd file to src package
  mkdir -p "${pkgname%-git}/plugins/anki2.0"
  mkdir -p "${pkgname%-git}/plugins/anki2.1/ankisyncd"
  mkdir -p "${pkgname%-git}/plugins/systemd"
  cp ../anki-sync-server.py "${pkgname%-git}/plugins/anki2.0"
  cp ../__init__.py "${pkgname%-git}/plugins/anki2.1/ankisyncd"
  cp ../anki-sync-server.service "${pkgname%-git}/plugins/systemd"

  cd "${pkgname%-git}"
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
  # the user is going to be named the same thing as the package name
  sed "10s/changeme/${pkgname%-git}/" plugins/systemd/anki-sync-server.service -i
  sed "11s/changeme/${pkgname%-git}/" plugins/systemd/anki-sync-server.service -i
  sed "12s|changeme|/opt/${pkgname%-git}|" plugins/systemd/anki-sync-server.service -i
}

build() {
  cd "${pkgname%-git}"/anki-bundled

  #initialize anki-bundled
  git submodule update --init

  # get anki-bundled working
  if [ -z "$(echo 'python-pyqt5 python-pyqtwebengine qt5-base>=5.12.2-1.1 libvpx>=1.8.0-1
    double-conversion>=3.1.4-1 qt5ct>=0.38-1 qt5-svg>=5.12.2-1' | xargs pacman -T)" ]; then
    echo "found prerequisites to use bundled anki, setting up bundled anki"
    pip install --upgrade setuptools --user
    pip install -r requirements.txt --user
    bash tools/build_ui.sh
  fi
}

package() {
  cd "${pkgname%-git}"
  mkdir "${pkgdir}"/opt
  cp -R "${srcdir}/${pkgname%-git}" "${pkgdir}"/opt
}
