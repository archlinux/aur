# Maintainer: Alex Tharp <toastercup@gmail.com>
# Contributor: Bennett Goble <nivardus@gmail.com>
# Upstream URL: https://github.com/highfidelity/hifi
# Issues: https://github.com/toastercup/aur-packages/issues

pkgname=hifi-interface-git
pkgver=r40509.9e0d9f5
pkgrel=1
pkgdesc="High Fidelity is an open, decentralized virtual world using sensors to control avatars and dynamically assigned devices as servers (git - master)"
arch=('i686' 'x86_64')
url="https://github.com/highfidelity/hifi"
license=('Apache2')
makedepends=('git' 'cmake>=2.8.12.2')
_qt5version=5.5.1
depends=("qt5-base>=$_qt5version"
         "qt5-script>=$_qt5version"
         "qt5-tools>=$_qt5version"
         "qt5-multimedia>=$_qt5version"
         "qt5-svg>=$_qt5version"
         "qt5-websockets>=$_qt5version"
         "qt5-webengine>=$_qt5version"
         "qt5-graphicaleffects>=$_qt5version"
         "qt5-quickcontrols>=$_qt5version"

         'glm>=0.9.5.4'
         'openssl>=1.0.1m'
         'intel-tbb>=4.3'
         'freeglut>=2.8.0'
         'oglplus>=0.63'
         'glew'
         'alsa-lib'
         'libxmu'
         'jack'
         'polyvox-git'
         'sdl2>=2.0.3'
         'bullet>=2.82'
         'libsoxr>=0.1.1'
         'qxmpp-qt5'
)
conflicts=('hifi-interface')
provides=('hifi-interface')
_githifi=hifi
_gitgverb=gverb
source=("$_githifi::git+https://github.com/highfidelity/hifi.git"
        "$_gitgverb::git+https://github.com/highfidelity/gverb.git"
        'hifi-interface.desktop'
        'hifi-interface.png')
md5sums=('SKIP'
         'SKIP'
         '2cc1b0cbdc7b044d76fce091117d09cb'
         'a261965ec09a8dfd93175fdabb7cafbe')

pkgver() {
  cd "$srcdir/$_githifi"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Symlink required gverb sources
  mkdir -p "$srcdir/$_githifi/interface/external/gverb" && mkdir -p "$srcdir/$_githifi/libraries/audio-client/external/gverb"
  ln -s -f "$srcdir/$_gitgverb/include" "$srcdir/$_githifi/interface/external/gverb/"
  ln -s -f "$srcdir/$_gitgverb/src" "$srcdir/$_githifi/interface/external/gverb/"
  ln -s -f "$srcdir/$_gitgverb/include" "$srcdir/$_githifi/libraries/audio-client/external/gverb/"
  ln -s -f "$srcdir/$_gitgverb/src" "$srcdir/$_githifi/libraries/audio-client/external/gverb/"

  cd $srcdir && mkdir -p build && cd $_
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/opt/interface" -DCMAKE_BUILD_TYPE:STRING=Release "../$_githifi"
  make
}

package() {
  install -Dm644 hifi-interface.png "$pkgdir/usr/share/pixmaps/hifi-interface.png"
  xdg-desktop-menu install --mode system hifi-interface.desktop

  mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir/build"

  #TODO: create patched CMAKE with make install target

  install -Dm755 assignment-client/assignment-client "$pkgdir/opt/hifi/assignment-client"
  ln -s "$pkgdir/opt/hifi/assignment-client" "$pkgdir/usr/bin/assignment-client"

  install -Dm755 domain-server/domain-server "$pkgdir/opt/hifi/domain-server/domain-server"
  cp -R domain-server/resources "$pkgdir/opt/hifi/domain-server/"
  ln -s "$pkgdir/opt/hifi/domain-server/domain-server" "$pkgdir/usr/bin/domain-server"

  install -Dm755 ice-server/ice-server "$pkgdir/opt/hifi/ice-server"
  ln -s "$pkgdir/opt/hifi/ice-server" "$pkgdir/usr/bin/ice-server"

  install -Dm755 interface/interface "$pkgdir/opt/hifi/interface/interface"
  cp -R interface/resources "$pkgdir/opt/hifi/interface/"
  ln -s "$pkgdir/opt/hifi/interface/interface" "$pkgdir/usr/bin/interface"

  install -Dm755 tools/mtc/mtc "$pkgdir/opt/hifi/tools/mtc"
  ln -s "$pkgdir/opt/hifi/tools/mtc" "$pkgdir/usr/bin/mtc"

  install -Dm755 tools/scribe/scribe "$pkgdir/opt/hifi/tools/scribe"
  ln -s "$pkgdir/opt/hifi/tools/scribe" "$pkgdir/usr/bin/scribe"
}
