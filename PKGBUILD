# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Lars Boettcher <lars@newyew.de>
# Contributor: Aaron Ali <t0nedef@causal.ca>

# PKGBUILD is taken from klayout extra package
_pkgname=klayout
pkgname="${_pkgname}-qt6"
pkgver=0.30.3
pkgrel=1
pkgdesc="High Performance Layout Viewer And Editor. Support of GDS and OASIS files - Built with Qt6"
arch=('x86_64')
_git_url="https://github.com/KLayout/klayout"
url="https://www.klayout.de"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
  'libgit2'
  'qt6-base'
  'qt6-tools'
  'qt6-multimedia'
  'qt6-svg'
  'qt6-5compat'
  'python'
  'ruby'
)
makedepends=(
  'git'
)
conflicts=(
  'klayout'
  'klayout-git'
)

source=(
  "${_pkgname}::git+${_git_url}#tag=v${pkgver}"
  klayoutEditor.desktop
  klayoutViewer.desktop
)

b2sums=(
  'd85ef836e9f5c96e96fe8c58f89ff0fd9d3750a95c29c86bb79d07e39ca6590ea5c48f09656e314356a2e42e29e51d784df52ae6370101dfb8ec09cf450c46d7'
  'f98f80e102e5d43f4a68137a62b7846be9ec722621ee0dbcbd05c907c240e287429c29b11a9d4b5752cfd02395e8f67711dec471282a3b2f2f53f10a938ab365'
  'f03147e9c0181cc51b6cabcfd4deb82c50ac145459818ae18c94641d1b459d143aa6f9e80dfb39d2e21345c3eab87850ed5fe8f6ee9251c9b079d98e51e45bc0'
)

options=(
  !debug
)

build() {
  cd "${_pkgname}"

  ./build.sh \
    -qmake /usr/bin/qmake6 \
    -python /usr/bin/python \
    -ruby /usr/bin/ruby
}

package() {
  (
    cd "${_pkgname}"  
    install -Dm 644 etc/logo.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/klayout.png
    install -Dm 755 bin-release/{klayout,strm*} -t "$pkgdir"/usr/bin/
    cp -ar bin-release "$pkgdir"/usr/lib/
    
    # Remove binaries from lib 
    rm "$pkgdir"/usr/lib/{klayout,strm*}
  )
  # Install desktop files
  install -Dm 644 klayoutEditor.desktop "$pkgdir"/usr/share/applications/klayoutEditor.desktop
  install -Dm 644 klayoutViewer.desktop "$pkgdir"/usr/share/applications/klayoutViewer.desktop
}
