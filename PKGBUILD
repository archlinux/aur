# Maintainer: Nico <d3sox at protonmail dot com>
# Maintainer: yobson <aur at yobson dot xyz>
pkgname=soundux-git
pkgver=0.2.7.r141.ge028452
pkgrel=1
epoch=1
pkgdesc="A cross-platform soundboard - unstable development version"
arch=('any')
url="https://soundux.rocks"
license=('GPL3')
depends=('pulse-native-provider' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'lsb-release')
optdepends=('youtube-dl: unmaintained downloader integration' 'yt-dlp-drop-in: recommended downloader integration' 'ffmpeg: downloader integration' 'pipewire: pipewire backend' 'libwnck3: icon support on X11')
makedepends=('git' 'pkgconf' 'cmake' 'ninja' 'pipewire')
conflicts=('soundux')
provides=('soundux')
source=("git+https://github.com/Soundux/Soundux.git"
        "git+https://github.com/nlohmann/json.git"
        "git+https://github.com/mackron/miniaudio.git"
        "git+https://github.com/Curve/fancypp.git"
        "git+https://github.com/btzy/nativefiledialog-extended.git"
        "git+https://github.com/Soundux/soundux-ui.git#branch=build"
        "git+https://github.com/Soundux/webviewpp.git"
        "git+https://gitlab.com/eidheim/tiny-process-library.git"
        "git+https://github.com/yhirose/cpp-httplib.git"
        "git+https://github.com/Soundux/traypp.git"
        "git+https://github.com/flathub/shared-modules.git"
        "git+https://github.com/Neargye/semver.git"
        "git+https://github.com/Soundux/lockpp.git"
        "git+https://github.com/bombela/backward-cpp.git"
        "git+https://github.com/Soundux/guardpp.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
install=soundux.install

pkgver() {
  cd "${srcdir}/Soundux"

  # Get the version number.
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/Soundux"

  git submodule init
  git config submodule.lib/json.url "$srcdir/json"
  git config submodule.lib/miniaudio.url "$srcdir/miniaudio"
  git config submodule.lib/fancypp.url "$srcdir/fancypp"
  git config submodule.lib/nativefiledialog-extended.url "$srcdir/nativefiledialog-extended"
  git config submodule.src/ui/impl/webview/lib/soundux-ui.url "$srcdir/soundux-ui"
  git config submodule.src/ui/impl/webview/lib/webviewpp.url "$srcdir/webviewpp"
  git config submodule.lib/tiny-process-library.url "$srcdir/tiny-process-library"
  git config submodule.lib/cpp-httplib.url "$srcdir/cpp-httplib"
  git config submodule.lib/traypp.url "$srcdir/traypp"
  git config submodule.deployment/flatpak/shared-modules.url "$srcdir/shared-modules"
  git config submodule.lib/semver.url "$srcdir/semver"
  git config submodule.lib/lockpp.url "$srcdir/lockpp"
  git config submodule.lib/backward-cpp.url "$srcdir/backward-cpp"
  git config submodule.lib/guardpp.url "$srcdir/guardpp"
  git -c protocol.file.allow=always submodule update

  cd src/ui/impl/webview/lib/webviewpp
  git submodule init
  git config submodule.lib/json.url "$srcdir/json"
  git -c protocol.file.allow=always submodule update

  sed -i 's/webkit2gtk-4\.0/webkit2gtk-4.1/g' \
      CMakeLists.txt
}

build() {
  cd "${srcdir}/Soundux"
  mkdir -p build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
  ninja
}

package() {
  cd "${srcdir}/Soundux/build"
  DESTDIR="$pkgdir/" ninja install
  # install binary symlink
  mkdir -p "${pkgdir}/usr/bin/"
  ln -sf /opt/soundux/soundux "${pkgdir}/usr/bin/soundux"

  # install doc
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/Soundux/README.md"
  # install license
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/Soundux/LICENSE"
}
