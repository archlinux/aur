# Maintainer: Alex Tharp <toastercup@gmail.com>
# Upstream URL: https://github.com/highfidelity/hifi

pkgname=hifi-git
pkgver=r44635.e893b17
pkgrel=1
pkgdesc="High Fidelity is an open, decentralized virtual world using sensors to control avatars and dynamically assigned devices as servers. This provides the client, servers and dev tools. (git - master)"
arch=('i686' 'x86_64')
url="https://github.com/highfidelity/hifi"
license=('Apache2')
install="${pkgname}.install"
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
_githifi=hifi
_gitgverb=gverb
source=("$_githifi::git+https://github.com/highfidelity/hifi.git"
        "$_gitgverb::git+https://github.com/highfidelity/gverb.git"
        'hifi-interface.desktop'
        'hifi-interface.png'
        'hifi-assignment-client.launcher'
        'hifi-domain-server.launcher'
        'hifi-ice-server.launcher'
        'hifi-interface.launcher')
md5sums=('SKIP'
         'SKIP'
         '2cc1b0cbdc7b044d76fce091117d09cb'
         'a261965ec09a8dfd93175fdabb7cafbe'
         '1eac79a3bc2179a4026ea1c6765fd44a'
         'ebb90bc133cb39d9d53b22fe8a954126'
         '8405ec1a861b25e92c9640cdae8a3776'
         'ff5de09932f33f6e4f4e4093a4b5e1d8')

pkgver() {
  cd "$srcdir/$_githifi"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Symlink required gverb sources
  mkdir -p "$srcdir/$_githifi/interface/external/gverb" && mkdir -p "$srcdir/$_githifi/libraries/audio-client/external/gverb"
  ln -s -f "$srcdir/$_gitgverb/include" "$srcdir/$_githifi/interface/external/gverb/"
  ln -s -f "$srcdir/$_gitgverb/src" "$srcdir/$_githifi/interface/external/gverb/"
  ln -s -f "$srcdir/$_gitgverb/include" "$srcdir/$_githifi/libraries/audio-client/external/gverb/"
  ln -s -f "$srcdir/$_gitgverb/src" "$srcdir/$_githifi/libraries/audio-client/external/gverb/"
}

build() {
  cd $srcdir && mkdir -p build && cd $_
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/opt/interface" -DCMAKE_BUILD_TYPE:STRING=Release "../$_githifi"
  make
}

package() {
  install -Dm644 "$srcdir/hifi-interface.png" "$pkgdir/usr/share/pixmaps/hifi-interface.png"
  install -Dm644 "$srcdir/hifi-interface.desktop" "$pkgdir/usr/share/applications/hifi-interface.desktop"

  mkdir -p "$pkgdir/usr/bin"

  #TODO: create patched CMAKE with make install target

  install -Dm755 "$srcdir/build/assignment-client/assignment-client" "$pkgdir/opt/hifi/assignment-client"
  install -Dm755 "$srcdir/hifi-assignment-client.launcher" "$pkgdir/usr/bin/hifi-assignment-client"

  install -Dm755 "$srcdir/build/domain-server/domain-server" "$pkgdir/opt/hifi/domain-server/domain-server"
  cp -R "$srcdir/build/domain-server/resources" "$pkgdir/opt/hifi/domain-server/"
  install -Dm755 "$srcdir/hifi-domain-server.launcher" "$pkgdir/usr/bin/hifi-domain-server"

  install -Dm755 "$srcdir/build/ice-server/ice-server" "$pkgdir/opt/hifi/ice-server"
  install -Dm755 "$srcdir/hifi-ice-server.launcher" "$pkgdir/usr/bin/hifi-ice-server"

  install -Dm755 "$srcdir/build/interface/interface" "$pkgdir/opt/hifi/interface/interface"
  cp -R "$srcdir/build/interface/resources" "$pkgdir/opt/hifi/interface/"
  install -Dm755 "$srcdir/hifi-interface.launcher" "$pkgdir/usr/bin/hifi-interface"
}
