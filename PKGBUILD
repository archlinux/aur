# Maintainer: Brody <archfan at brodix dot de>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Dan Ziemba <zman0900@gmail.com>

_pkgname=nut
pkgname=nut-monitor
pkgver=2.8.4
pkgrel=2
pkgdesc='GUI to manage devices connected a NUT server'
arch=(any)
url=http://www.networkupstools.org/
_ghurl=https://github.com/networkupstools/${_pkgname}
license=(GPL-3.0-or-later)
depends=(
  hicolor-icon-theme
  nut
  python
  python-pyqt6
)
makedepends=(
  desktop-file-utils
  git
  jq
)
source=(${_pkgname}::git+${_ghurl}.git#tag=v${pkgver})
sha256sums=('6276aa5ba1a2a7ad3831cac7db090a7bbe9bbbc98c5e8723d57e25f09240e254')

prepare() {
  cd ${_pkgname}

  ./autogen.sh

  sed \
    's|os.path.dirname( sys.argv\[0\] )|"/usr/share/nut-monitor"|' \
    -i scripts/python/app/NUT-Monitor-py3qt6.in
}

build() {
  # configuration adopted from the nut package
  local _configure_args
  _configure_args=(
    --prefix=/usr
    --datadir=/usr/share/nut
    --libexecdir=/usr/lib/nut
    --sbindir=/usr/bin
    --sysconfdir=/etc/nut
    --with-altpidpath=/run/nut
    --with-cgipath=/usr/share/nut/cgi
    --with-drvpath=/usr/lib/nut
    --with-htmlpath=/usr/share/nut/html
    --with-pidpath=/run/nut
    --with-statepath=/var/lib/nut
    --without-python2
  )

  cd ${_pkgname}

  ./configure \
    "${_configure_args[@]}"
}

package() {
  cd ${_pkgname}/scripts/python/app

  install -Dm755 -t "${pkgdir}"/usr/bin \
    NUT-Monitor-py3qt6

  install -Dm644 -t "${pkgdir}"/usr/share/appdata \
    nut-monitor.appdata.xml

  install -Dm644 -t "${pkgdir}"/usr/share/${pkgname}/pixmaps \
    pixmaps/*

  install -Dm644 -t "${pkgdir}"/usr/share/${pkgname}/ui \
    ui/*.ui

  install -Dm644 -t "${pkgdir}"/usr/share/${pkgname}/icons/256x256 \
    icons/256x256/nut-monitor.png

  local _res
  for _res in 48x48 64x64 256x256 scalable; do
    install -Dm644 -t "${pkgdir}"/usr/share/icons/hicolor/${_res}/apps \
      icons/${_res}/*
  done

  desktop-file-install \
    --dir="${pkgdir}"/usr/share/applications \
    nut-monitor-py3qt6.desktop

  ln -sr "${pkgdir}"/usr/bin/NUT-Monitor-py3qt6 \
    "${pkgdir}"/usr/bin/${pkgname}
}

# vim: ts=2 sw=2 et:
